import 'package:flutter/cupertino.dart';

/// Login Model
class LoginRequest {
  String username;
  String password;

  LoginRequest({@required this.username, @required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
        username: json['username'] as String,
        password: json['password'] as String);
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
