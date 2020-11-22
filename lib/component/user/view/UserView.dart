import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_med_front/component/user/controller/UserController.dart';
import 'package:mini_med_front/util/MConstants.dart';

class Home extends StatelessWidget {
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    // userController.auth();
    return Text(MConstants.token);
  }
}