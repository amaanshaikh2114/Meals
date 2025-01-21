# Meals App

 - A multiscreen meals app that uses GridView, NetworkImage and various other widgets like InkWell, Navigationbar, Drawer, SwitchTileList etc. 
 - It does use Riverpod package for cross state widget management. Instead of the function being passed down through various widgets from the parent widget to the actual widget where it is going to be used   
   (cumbersome method), a separate providers.dart file can be created which can provide a particular static/dynamic value(variable) and it's associated methods to modify this value throughout the whole project. 
   Thus passing of values from one widget to another becomes a much easier task when a common provider file handles such common values required in multiple widgets. 
 - Multiple provider files can be created for multiple such values and the StateNotifier with StateNotifierProvider class can be used for handling dynamic values and making functions for managing the changing 
   state/value of the variables it provides.
 - The files that want an access to the variables provided by these provider files must use the read() or watch() function. The read() function is only executed once and thus can be used in initState() function 
   or anonymous functions < (){} > used in onPressed and onTap like attributes. While the read() function is executed as many times as the state of the value it provides changes. It also calls the corresponding 
   build() in which it is present to update the UI changes accordingly.  

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Credits](#credits)
- [Contact](#contact)

## Introduction
A simple Flutter project that provides a multi-screen interface to view differnt meals across different categories, allows filtering and adding favourite meals.

## Features
- **Add expense:** Allows for addition of expenses.
- **Delete expense:** User can also delete expenses.
- **View bar chart:** Displays the expenses in a visual format. The bar keeps updating according to the addition and deletion of tasks.

## Technologies Used
- **Flutter:** Framework and its various packages.
- **Dart:** Primary programming language.

## Setup Instructions
1. **Install Flutter and Android Studio:**
    Make sure you have the necessary requirements to run a Flutter app on your local machine. Flutter framework, its extensions in VS Code, Android Studio, android emulator (from Android Studio) to run your apps and see them how they look on screens (Alternatively, you can run apps on your actual mobile devices too).

2. **Clone the repository:**
   Type the following commands in your terminal after you have directed it to a particular directory.
   
   - git clone https://github.com/amaanshaikh2114/Expense_tracker_app.git

    
## Usage
1. **Run the application:**
    Go to the directory where you have placed the project and type 'flutter run' in the terminal. Ensure flutter is recognized by your system by making sure it's in the 'Path' option of System variables by going to the environment variables of your system.
    
2. **Add expense:**
    Use the '+' button to open the expense adding sheet and you can enter the title, date, category of expense and amount. Then click 'Save expense' button.

3. **Delete expense:**
    To delete an expense swipe the expense card left/right.

## Screenshots
<p align="center">
  <img src="screenshots/home_page.png" alt="Home page" width="300"/>
  <img src="screenshots/add_expense_sheet.png" alt="Add new expense sheet" width="300"/>
  <img src="screenshots/expense_add_del.png" alt="Adding and deleting expenses" width="300"/>
</p>

## Credits
'Flutter & Dart - The Complete Guide [2024 Edition]' Course by Maximilian Schwarzmüller on Udemy.

## Contact
For any questions or inquiries, please contact [Amaan Shaikh](mailto:amaanmazhar211@gmail.com). Send a mail to amaanmazhar211@gmail.com
