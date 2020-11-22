import 'package:flutter/material.dart';

import './entity/user.dart';
///love
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final User user = User(userName: "gerlee", password: "b@g");

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _checkUser() {
    if (_userNameController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }

    final inputUserName = _userNameController.text;
    final inputPassword = _passwordController.text;

    if (inputUserName == user.userName && inputPassword == user.password) {
      user.printUser("kk");
      print("Амжилттай нэвтэрлээ");
    } else {
      print("Нэвтрэх нэр нууц үг таарсангүй");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Med Login"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Нэвтрэх нэр"),
            controller: _userNameController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Нууц үг"),
            controller: _passwordController,
          ),
          RaisedButton(
            child: Text("Нэвтрэх"),
            onPressed: _checkUser,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
