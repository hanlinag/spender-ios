# Spender-iOS

## Expense Tracker

![spender-logo](https://github.com/hanlinag/spender-ios/blob/485923ae362372c2c312620bab32b846d241fd33/files/logo.png)

> The idea of this app is to manage your money & finances, allow you to see your spending by category, set up bill payments, keep track of your incomes, and plan for savings.>

</br>
*Disclaimer: This project and documentation are still under constructions such as refactoring, fixing bug. However, the basic funcationalities should be working properly.*

 </br>

# Requirements Specification

Please check the following link for detail: [Requirements](https://github.com/hanlinag/spender-ios/blob/develop/Requirements.md)

## Technology Slack

In here, you can learn the following concepts: </br>

- Passcode with FaceID [LocalAuth Framework + Encryption (Private + Public)]
- MVVM Design Pattern
- RxSwift, RxCocoa, RxAlamofire as possible
- Storage:
  - [Custom Golang API](https://github.com/hanlinag/go-spender-api) - Postgres DB
  - RealmDB for local cache
  - User Defaults for flags
- Custom buttons, text fields, labels
- Extension concepts
- Global API handling
- Custom ViewControllers [OOP Concept]

# Design

> Please look at the linked PDF file for Low Fedility Design. >

- ![Figma design](https://dribbble.com/shots/19347750-Spender-Expense-Tracker)
- [L-F Design- Sketch](https://github.com/hanlinag/spender-ios/blob/develop/files/Spender-L-F-Mockup.pdf)

</br>

# Screenshots

![screenshot](https://www.saihanlinaung.dev/assets/img/projects/spender.portfolio.png)

# Usecase Diagram

![usecase](www.google.com)

# ER Diagram

![er](www.google.com)

# Project Structure

- Current project tries to fit in MVVM design along with RxSwift and RxCocoa.
- Alamofire and Moya are being used together in order to simplify Network calls in iOS.
- Data encryption for PIN codes and user’s sensitive are made with the use of FaceID, Secure Enclave and Keychain as possible.
- Tries to use third party libraries as less as possible for less dependeincy and easier maintainability.

</br>

# MVVM Design Pattern

This project tries not to implement the business logic inside the View Controller. View Controller is used only to communicate view and view model. Moreover, view controller is being used for UI manipulation.

- It has 4 layers:
  - View
  - View Controller
  - View Model
  - Model
- **View**: is the storyboard itself. It includes the user interface.
- **View Controller**: stays between UI View and View Model and acts as the communicator. UI manipulations with codes are done in these classes.
- **View Model**: talks to API calls, DB connections, User Defaults via interfaces like Network calls, and DB schemes. All the business logics regarding the application scopes are made in the VMs for simplification sake. VM talks to view controller and data models while trying to obtain business logic inside it.
- **Data Model**: perform the same task as in MVC design. Data manipulation are done in this layer as required by the business logic. Data models are for data passing between UI views, to and from APIs, Database and User Defaults.

Therefore, all the business logics will only be done inside VM layer for simplification and maintainability. MVVM design is achieved by using as much as Reactive programming as well as completion handlers. (RxSwift and RxCocoa in this case.)

</br>

# [Reactive Programming](https://reactivex.io)

- When the business logic actions are fired inside the VMs, the specific event is triggered. As the required View Controller is listening to the event with Observable objects, VC knows instantly when event is being fired, thus UI changes happen simultaneously.
- Reactive programming simplifies a lot of things ensuring the less codes of having to write handling for UI changes in some cases. Network calls are now a lot easier with RxAlamofire.

![reactive-programming](https://github.com/hanlinag/spender-ios/blob/develop/files/reactive-programming.png)
</br>

# Image Loading/Caching

- [Kingfisher](https://github.com/onevcat/Kingfisher) is a very popular image loading pure-swift library available. It contians all the functionalities about caching, managing time out, retrying, adding tranitions, authentication and so on.
- As the library is still under maintainance, it’s safe to use. For easier mantainnace, Kingfisher will handle all the image loading in UIImage view in this project.
