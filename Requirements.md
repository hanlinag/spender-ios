# Spender-iOS

## Requirements Specification

> The idea of this app is to manage your money & finances, allow you to see your spending by category, set up bill payments, keep track of your incomes, and plan for savings.

</br>

### The required features of the app are:

- Display and compare total cost by day, month, year.
- Show your invoices during the day.
- Add a new invoice.
- Show categories (including food, water bills, etc).
- Show categories with used invoices (for collecting purpose).

</br>

### This expense management app works in the following way:

- First, in the ‘**Home**’ screen, you will see comparative charts which will help keep track and make comparisons of the current day’s expenses. Below the charts, a list will display all invoices you have paid that day.
- Next, as you click the ‘**Add New**’ button, catalogs will appear. Clicking on each specific catalog will lead to the next screen where you can input the amount of money and give a description for that invoice. When things are done, the app will automatically return to its home screen.
- By utilizing the **Tab bar** navigation, you can create 3 items: **Home**, **Activities**, and **Settings**. Activities screen displays recorded bills in categories (for example, Food: 3 bills, Drink: 4 bills, etc). Clicking on a specific item to see the details.
- ‘**Settings**’ enables users to edit their information and images.

</br>

- White theme only
- Multiple logo variants/representation
- Background image for white theme
- Icons: Apple iOS SF Symbols

</br>

### So, what can you apply?

**1. Chart View, Table View, Collection View**: With the infinite creativity of designers, you can apply knowledge of views to create impressive screens.

**2. Tab bar Navigation and View Controller Navigation**.

Basically, this app does not need to integrate with the server because it is used to track your own expenses. However, you can still apply this by using firebase serivces or [Golang API made for this app specifically](https://github.com/hanlinag/go-spender-api).
