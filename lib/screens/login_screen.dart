import 'package:flutter/material.dart';
import './tabs_screen.dart';

import '../controller/UserController.dart';

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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Нэвтрэх нэр',
                hintText: 'Нэвтрэх нэрээ оруулна уу!',
              ),
              controller: _userNameController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Нууц үг',
                hintText: 'Нууц үгээ оруулна уу!',
              ),
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
      ),
    );
  }
}
