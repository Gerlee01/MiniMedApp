import 'package:flutter/material.dart';

import './tabs_screen.dart';
import '../controller/UserController.dart';

class LoginScreen extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submit(BuildContext context) {
    if (_userNameController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }

    UserController userController = UserController();
    userController
        .findByUsernameAndPassword(
            _userNameController.text, _passwordController.text)
        .then((value) {
      if (value == null) {
        print("user null");
      } else {
        Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
        _passwordController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Med Login"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 15),
            child: Text(
              'Mini Med',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 45,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              height: 350,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: <Widget>[
                  _buildText('Нэвтрэх нэр', 'Нэвтрэх нэрээ оруулна уу!',
                      Icons.assignment_turned_in_outlined, _userNameController, false),
                  SizedBox(
                    height: 10,
                  ),
                  _buildText('Нууц үг', 'Нууц үгээ оруулна уу!', Icons.lock,
                      _passwordController, true),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: false,
                        onChanged: (bool){},
                      ),
                      Text('нэвтрэх нэр сануулах', style: Theme.of(context).textTheme.bodyText2,),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("Нэвтрэх"),
                      onPressed: () => _submit(context),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText(String labelText, String hintText, IconData icon,
      TextEditingController controller, bool hide) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        obscureText: hide,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
  }
}
