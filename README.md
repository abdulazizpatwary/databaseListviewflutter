# Flutter SQfLite User Management App

A simple **Flutter app** demonstrating **CRUD operations** using **SQLite**.  
This project allows you to **create, read, update, and delete users** with a clean Flutter UI.

---

## **Features**

- Add new users with **username** and **password**
- View all users in a **list**
- Update existing users
- Delete users
- Local database storage using **SQLite** (`sqflite` package)
- Model-based mapping using `User` class (`toMap()` and `fromMap()`)

---

## **Project Structure**


- `main.dart`  
  - Handles Flutter UI  
  - Calls database helper methods to load, save, update, delete users
- `database_helper.dart`  
  - Manages SQLite database  
  - Handles CRUD operations (`saveUser`, `getaAllUsers`, `updateUser`, `deleteUser`)
- `user.dart`  
  - User model class  
  - Provides `toMap()` and `fromMap()` methods for database interaction

---

## **Packages Used**

- [sqflite](https://pub.dev/packages/sqflite) → SQLite database  
- [path_provider](https://pub.dev/packages/path_provider) → Access device paths for database storage  

## **dependencies:**


  ##**flutter:**
  
    sdk: flutter
    
    sqflite: ^2.0.2
    
    path_provider: ^2.0.14
  
## **How the Database Helper works**


  CREATE TABLE userTable(
  
    id INTEGER PRIMARY KEY,
    username TEXT,
    password TEXT
  );
  
 ## **Convert from Map to User object**

    User user = User.fromMap(map);

 ## **Convert from User object to Map**

    Map<String, dynamic> data = user.toMap();
    
## **Main UI workflow**
- Loads users from database on app start
- Displays users in a ListView
- Allows tap to view password
- Supports updating and deleting users

