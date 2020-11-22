import 'package:flutter/material.dart';
import 'package:mini_med_front/component/user/controller/UserController.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit() {
    UserController userController = UserController();
    userController.findByUsernameAndPassword(_userNameController.text, _passwordController.text);
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
            onPressed: _submit,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
