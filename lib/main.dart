import 'package:database_intro/database_helper.dart';
import 'package:database_intro/user.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// List? _users;

void main() async {
  // var db = DatabaseHelper();
  // //add user
  // int savedUser = await db.saveUser(User("Bonomali", "bonoma123"));
  // print("User sabed $savedUser");
  //
  // _users = await db.getaAllUsers();
  // for (int i = 0; i < _users!.length; i++) {
  //   User user = User.map(_users![i]);
  //   print("Username: ${user.name}");
  // }
  // int? count = await db.getCount();
  // print(count);
  //
  // User? adnan = await db.getUser(1);
  // print("got username: ${adnan!.name}");
  // print("got username: ${adnan!.password}");
  //
  // int userDeleted = await db.deletUser(1);
  // print("Deleted : $userDeleted");
  //
  // User ginaUpdated = User.fromMap({
  //   "username": "Updatedgina",
  //   "password": "updatedpassword",
  //   "id": 1,
  // });
  // db.updateUser(ginaUpdated);

  runApp(MaterialApp(title: "Database", home: myApp()));
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(),);
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home>{
  final DatabaseHelper db = DatabaseHelper();
  List<User> users = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }
  Future<void> loadData() async {
    await db.saveUser(User("raj", "raj123"));
    final data = await db.getaAllUsers();
    setState(() {
      users = data.map<User>((e) => User.fromMap(e)).toList();
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: ListView.builder(
        itemCount: users.length,

        itemBuilder: (_, int position) {
          final user = users[position];
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  user.name![0],
                ),
              ),
              title: Text("User: ${user.name}"),
              subtitle: Text("Id: ${user.id}"),
              onTap: () =>
                  debugPrint("${user.password}"),
            ),
          );
        },
      ),
    );
  }
  
}

