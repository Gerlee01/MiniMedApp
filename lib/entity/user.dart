import 'package:flutter/foundation.dart';

class  User {
  final String userName;
  final String password;

  User({
    @required this.userName,
    @required this.password,
  });

  void printUser(String user){
    print(user);
  }
}