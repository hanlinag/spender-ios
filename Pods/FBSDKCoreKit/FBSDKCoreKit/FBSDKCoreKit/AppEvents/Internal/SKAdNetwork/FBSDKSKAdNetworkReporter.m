// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TargetConditionals.h"

#if !TARGET_OS_TV

 #import "FBSDKSKAdNetworkReporter.h"

 #import <StoreKit/StoreKit.h>

 #import <objc/message.h>

 #import "FBSDKAppEventsUtility.h"
 #import "FBSDKConversionValueUpdating.h"
 #import "FBSDKCoreKitBasicsImport.h"
 #import "FBSDKDataPersisting.h"
 #import "FBSDKGraphRequestProtocol.h"
 #import "FBSDKGraphRequestProviding.h"
 #import "FBSDKSKAdNetworkConversionConfiguration.h"
 #import "FBSDKSettings.h"

 #define FBSDK_SKADNETWORK_CONFIG_TIME_OUT 86400

typedef void (*send_type)(Class, SEL, NSInteger);

typedef void (^FBSDKSKAdNetworkReporterBlock)(void);

static NSString *const FBSDKSKAdNetworkConversionConfigurationKey = @"com.facebook.sdk:FBSDKSKAdNetworkConversionConfiguration";
static NSString *const FBSDKSKAdNetworkReporterKey = @"com.facebook.sdk:FBSDKSKAdNetworkReporter";
static char *const serialQueueLabel = "com.facebook.appevents.SKAdNetwork.FBSDKSKAdNetworkReporter";

@interface FBSDKSKAdNetworkReporter ()

@property (nonatomic) BOOL isSKAdNetworkReportEnabled;
@property (nonnull, nonatomic) NSMutableArray<FBSDKSKAdNetworkReporterBlock> *completionBlocks;
@property (nonatomic) BOOL isRequestStarted;
@property (nonnull, nonatomic) dispatch_queue_t serialQueue;
@property (nullable, nonatomic) FBSDKSKAdNetworkConversionConfiguration *config;
@property (nonnull, nonatomic) NSDate *configRefreshTimestamp;
@property (nonatomic) NSInteger conversionValue;
@property (nonatomic) NSDate *timestamp;
@property (nonnull, nonatomic) NSMutableSet<NSString *> *recordedEvents;
@property (nonnull, nonatomic) NSMutableDictionary<NSString *, NSMutableDictionary *> *recordedValues;
@property (nonnull, nonatomic) id<FBSDKGraphRequestProviding> requestProvider;
@property (nonnull, nonatomic) id<FBSDKDataPersisting> store;
@property (nonnull, nonatomic) Class<FBSDKConversionValueUpdating> conversionValueUpdatable;

@end

@implementation FBSDKSKAdNetworkReporter

- (instancetype)initWithRequestProvider:(id<FBSDKGraphRequestProviding>)requestProvider
                                  store:(id<FBSDKDataPersisting>)store
               conversionValueUpdatable:(Class<FBSDKConversionValueUpdating>)conversionValueUpdatable
{
  self.requestProvider = requestProvider;
  self.store = store;
  self.conversionValueUpdatable = conversionValueUpdatable;
  return self;
}

- (void)enable
{
  if (@available(iOS 14.0, *)) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      [SKAdNetwork registerAppForAdNetworkAttribution];
      [self _loadReportData];
      self.completionBlocks = [NSMutableArray new];
      self.serialQueue = dispatch_queue_create(serialQueueLabel, DISPATCH_QUEUE_SERIAL);
      [self _loadConfigurationWithBlock:^{
        [self _checkAndUpdateConversionValue];
        [self _checkAndRevokeTimer];
      }];
      self.isSKAdNetworkReportEnabled = YES;
    });
  }
}

- (void)checkAndRevokeTimer
{
  if (@available(iOS 14.0, *)) {
    if (!self.isSKAdNetworkReportEnabled) {
      return;
    }
    [self _loadConfigurationWithBlock:^() {
      [self _checkAndRevokeTimer];
    }];
  }
}

- (void)recordAndUpdateEvent:(NSString *)event
                    currency:(nullable NSString *)currency
                       value:(nullable NSNumber *)value
                  parameters:(nullable NSDictionary *)parameters
{
  [self recordAndUpdateEvent:event currency:currency value:value];
}

- (void)recordAndUpdateEvent:(NSString *)event
                    currency:(nullable NSString *)currency
                       value:(nullable NSNumber *)value
{
  if (@available(iOS 14.0, *)) {
    if (!self.isSKAdNetworkReportEnabled) {
      return;
    }
    if (!event.length) {
      return;
    }
    [self _loadConfigurationWithBlock:^() {
      [self _recordAndUpdateEvent:event currency:currency value:value];
    }];
  }
}

- (void)_loadConfigurationWithBlock:(FBSDKSKAdNetworkReporterBlock)block
{
  if (!self.serialQueue) {
    return;
  }
  // Executes block if there is cache
  if ([self _isConfigRefreshTimestampValid] && [self.store objectForKey:FBSDKSKAdNetworkConversionConfigurationKey]) {
    [self dispatchOnQueue:self.serialQueue block:^() {
      [FBSDKTypeUtility array:self.completionBlocks addObject:block];
      for (FBSDKSKAdNetworkReporterBlock executionBlock in self.completionBlocks) {
        executionBlock();
      }
      [self.completionBlocks removeAllObjects];
    }];
    return;
  }
  [self dispatchOnQueue:self.serialQueue block:^{
    [FBSDKTypeUtility array:self.completionBlocks addObject:block];
    if (self.isRequestStarted) {
      return;
    }
    self.isRequestStarted = YES;
    id<FBSDKGraphRequest> request = [self.requestProvider createGraphRequestWithGraphPath:[NSString stringWithFormat:@"%@/ios_skadnetwork_conversion_config", [FBSDKSettings appID]]];
    [request startWithCompletion:^(id<FBSDKGraphRequestConnecting> connection, id result, NSError *error) {
      [self dispatchOnQueue:self.serialQueue block:^{
        if (error) {
          self.isRequestStarted = NO;
          return;
        }
        NSDictionary<NSString *, id> *json = [FBSDKTypeUtility dictionaryValue:result];
        if (json) {
          [self.store setObject:json forKey:FBSDKSKAdNetworkConversionConfigurationKey];
          self.configRefreshTimestamp = [NSDate date];
          self.config = [[FBSDKSKAdNetworkConversionConfiguration alloc] initWithJSON:json];
          for (FBSDKSKAdNetworkReporterBlock executionBlock in self.completionBlocks) {
            executionBlock();
          }
          [self.completionBlocks removeAllObjects];
          self.isRequestStarted = NO;
        }
      }];
    }];
  }];
}

- (void)_checkAndRevokeTimer
{
  if (!self.config) {
    return;
  }
  if ([self shouldCutoff]) {
    return;
  }
  if (self.conversionValue > self.config.timerBuckets) {
    return;
  }
  if (self.timestamp && [[NSDate date] timeIntervalSinceDate:self.timestamp] < self.config.timerInterval) {
    return;
  }
  [self _updateConversionValue:self.conversionValue];
}

- (void)_recordAndUpdateEvent:(NSString *)event
                     currency:(nullable NSString *)currency
                        value:(nullable NSNumber *)value
{
  if (!self.config) {
    return;
  }
  if ([self shouldCutoff]) {
    return;
  }
  if (![self.config.eventSet containsObject:event] && ![FBSDKAppEventsUtility isStandardEvent:event]) {
    return;
  }
  BOOL isCacheUpdated = false;
  if (![self.recordedEvents containsObject:event]) {
    [self.recordedEvents addObject:event];
    isCacheUpdated = true;
  }
  // Change currency to default currency if currency is not found in currencySet
  NSString *valueCurrency = [currency uppercaseString];
  if (![self.config.currencySet containsObject:valueCurrency]) {
    valueCurrency = self.config.defaultCurrency;
  }
  if (value != nil) {
    NSMutableDictionary *mapping = [[FBSDKTypeUtility dictionary:self.recordedValues objectForKey:event ofType:NSDictionary.class] mutableCopy] ?: [NSMutableDictionary new];
    NSNumber *valueInMapping = [FBSDKTypeUtility dictionary:mapping objectForKey:valueCurrency ofType:NSNumber.class] ?: [NSNumber numberWithDouble:0];
    [FBSDKTypeUtility dictionary:mapping setObject:[NSNumber numberWithDouble:(valueInMapping.doubleValue + value.doubleValue)] forKey:valueCurrency];
    [FBSDKTypeUtility dictionary:self.recordedValues setObject:mapping forKey:event];
    isCacheUpdated = true;
  }
  if (isCacheUpdated) {
    [self _checkAndUpdateConversionValue];
    [self _saveReportData];
  }
}

- (void)_checkAndUpdateConversionValue
{
  // Update conversion value if a rule is matched
  for (FBSDKSKAdNetworkRule *rule in self.config.conversionValueRules) {
    if (rule.conversionValue < self.conversionValue) {
      break;
    }
    if ([rule isMatchedWithRecordedEvents:self.recordedEvents recordedValues:self.recordedValues]) {
      [self _updateConversionValue:rule.conversionValue];
      break;
    }
  }
}

- (void)_updateConversionValue:(NSInteger)value
{
  if (@available(iOS 14.0, *)) {
    if ([self shouldCutoff]) {
      return;
    }
    [self.conversionValueUpdatable updateConversionValue:value];
    self.conversionValue = value + 1;
    self.timestamp = [NSDate date];
    [self _saveReportData];
  }
}

- (BOOL)shouldCutoff
{
  if (!self.config.cutoffTime) {
    return true;
  }
  NSDate *installTimestamp = [self.store objectForKey:@"com.facebook.sdk:FBSDKSettingsInstallTimestamp"];
  return [installTimestamp isKindOfClass:NSDate.class] && [[NSDate date] timeIntervalSinceDate:installTimestamp] > self.config.cutoffTime * 86400;
}

- (BOOL)isReportingEvent:(NSString *)event
{
  return (self.config && [self.config.eventSet containsObject:event]);
}

 #pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (void)_loadReportData
{
  id cachedJSON = [self.store objectForKey:FBSDKSKAdNetworkConversionConfigurationKey];
  self.config = [[FBSDKSKAdNetworkConversionConfiguration alloc] initWithJSON:cachedJSON];
  NSData *cachedReportData = [self.store objectForKey:FBSDKSKAdNetworkReporterKey];
  self.recordedEvents = [NSMutableSet new];
  self.recordedValues = [NSMutableDictionary new];
  if ([cachedReportData isKindOfClass:[NSData class]]) {
    NSDictionary<NSString *, id> *data;
    if (@available(iOS 11.0, *)) {
      data = [FBSDKTypeUtility dictionaryValue:[NSKeyedUnarchiver
                                                unarchivedObjectOfClasses:[NSSet setWithArray:
                                                                           @[NSString.class,
                                                                             NSNumber.class,
                                                                             NSArray.class,
                                                                             NSDate.class,
                                                                             NSDictionary.class,
                                                                             NSSet.class]]
                                                fromData:cachedReportData
                                                error:nil]];
    } else {
      data = [FBSDKTypeUtility dictionaryValue:[NSKeyedUnarchiver unarchiveObjectWithData:cachedReportData]];
    }
    if (data) {
      self.conversionValue = [FBSDKTypeUtility integerValue:data[@"conversion_value"]];
      self.timestamp = [FBSDKTypeUtility dictionary:data objectForKey:@"timestamp" ofType:NSDate.class];
      self.recordedEvents = [[FBSDKTypeUtility dictionary:data objectForKey:@"recorded_events" ofType:NSSet.class] mutableCopy] ?: [NSMutableSet new];
      self.recordedValues = [[FBSDKTypeUtility dictionary:data objectForKey:@"recorded_values" ofType:NSDictionary.class] mutableCopy] ?: [NSMutableDictionary new];
    }
  }
}

- (void)_saveReportData
{
  NSMutableDictionary<NSString *, id> *reportData = [NSMutableDictionary new];
  [FBSDKTypeUtility dictionary:reportData setObject:@(self.conversionValue) forKey:@"conversion_value"];
  [FBSDKTypeUtility dictionary:reportData setObject:self.timestamp forKey:@"timestamp"];
  [FBSDKTypeUtility dictionary:reportData setObject:self.recordedEvents forKey:@"recorded_events"];
  [FBSDKTypeUtility dictionary:reportData setObject:self.recordedValues forKey:@"recorded_values"];
  NSData *cache = [NSKeyedArchiver archivedDataWithRootObject:reportData];
  if (cache) {
    [self.store setObject:cache forKey:FBSDKSKAdNetworkReporterKey];
  }
}

- (void)dispatchOnQueue:(dispatch_queue_t)queue block:(dispatch_block_t)block
{
  if (block != nil) {
    if (strcmp(dispatch_queue_get_label(queue), serialQueueLabel) == 0) {
      dispatch_async(queue, block);
    } else {
      block();
    }
  }
}

 #pragma clang diagnostic pop

- (BOOL)_isConfigRefreshTimestampValid
{
  return self.configRefreshTimestamp && [[NSDate date] timeIntervalSinceDate:self.configRefreshTimestamp] < FBSDK_SKADNETWORK_CONFIG_TIME_OUT;
}

 #pragma mark - Testability

 #if DEBUG
  #if FBTEST

- (void)setConfiguration:(FBSDKSKAdNetworkConversionConfiguration *)configuration
{
  self.config = configuration;
}

- (void)setSKAdNetworkReportEnabled:(BOOL)enabled
{
  self.isSKAdNetworkReportEnabled = enabled;
}

  #endif
 #endif
@end

#endif
