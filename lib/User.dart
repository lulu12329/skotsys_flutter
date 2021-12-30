import 'dart:convert';

import 'package:kotsys_flutter/LocalStore.dart';

class User {
  int id = 0;
  String username = "";
  String email = "";
  String token = "";
  List<String> permissions = [];
  static final User _instance = User._internal();

  User._internal();

  factory User() {
    return _instance;
  }

  void fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    id = json['id'];
    token = json['token'];
    permissions = _permissionsFromJson(json['permissions']);
    LocalStore.writeUser();
  }

  List<String> _permissionsFromJson(dynamic permissions) {
    List<dynamic> list = permissions != null ? List.from(permissions) : [];
    return list.map((e) => e.toString()).toList();
  }

  Map<String, dynamic> toJsonWithToken() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'permissions': permissions
    };
  }
}
