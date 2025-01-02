# iExpense: Expense Tracker App

Welcome to the iExpense project! This is an expense tracker app that helps you separate personal costs from business costs. It consists of two main components: a form to input how much you've spent, and a list to display the amounts. 

## Learning Objectives

This project is a great way to learn about key concepts in SwiftUI development, including:

- How to navigate between screens
- How to share data across views
- How to save and load user data
- How to use SwiftUI state management
- How to work with `@Observable`, `sheet()`, `onDelete()`, and more

### Seven Topics to Work Through:
1. **iExpense: Introduction** - An overview of the app's functionality and structure.
2. **Using @State with classes** - Learn how to manage state locally within a class in SwiftUI.
3. **Sharing SwiftUI state with @Observable** - Understand how to share state across different views using `@Observable`.
4. **Showing and hiding views** - Learn how to conditionally show or hide views based on state.
5. **Deleting items using onDelete()** - Learn how to allow users to delete items from lists.
6. **Storing user settings with UserDefaults** - Save simple user preferences like theme, or filters using `UserDefaults`.
7. **Archiving Swift objects with Codable** - Understand how to archive and unarchive Swift objects using `Codable` for data persistence.

## Features

- **Input Form**: A form to enter the amount spent, categorized as either personal or business.
- **Expense List**: A list of all expenses entered, with an option to delete individual entries.
- **Data Persistence**: User data is saved and loaded across app sessions using `UserDefaults` and `Codable`.
