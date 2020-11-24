import 'package:flutter/foundation.dart';

class User {
  BigInt id;
  String uuid;
  String parentUuid;
  final String username;
  final String password;
  List<String> roles;
  DateTime created;

  User({
    @required this.username,
    @required this.password,
    id,
    uuid,
    parentUuid,
    roles,
    created,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        uuid: json['uuid'] as String,
        parentUuid: json['parentUuid'] as String,
        username: json['username'] as String,
        password: json['password'] as String,
        roles: new List<String>.from(json['roles']),
        created: json['created'] as String);
  }
}
