import 'package:flutter/material.dart';
import './tabs_screen.dart';

import '../component/user/controller/UserController.dart';

class LoginScreen extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit(BuildContext context) {
    UserController userController = UserController();
    userController
        .findByUsernameAndPassword(_userNameController.text, _passwordController.text)
        .then((value) {
      if (value == null) {
        print("user null");
      } else {
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
      }
    });
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
            onPressed: () => _submit(context),
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
