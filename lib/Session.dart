import 'package:kotsys_flutter/LocalStore.dart';
import 'package:kotsys_flutter/models/Role.dart';
import 'package:kotsys_flutter/services/backend.dart';

import 'models/user.dart';

class Session {
  User activeUser = User();
  String token = "";
  Role role = Role();
  static final Session _instance = Session._internal();

  Session._internal();

  factory Session() {
    return _instance;
  }

  fromJson(Map<String, dynamic> json) async {
    token = json['token'];
    HttpClientHelper().token = token;
    activeUser = User.fromJson(json['user']);
    var roleJson = json['role'];
    role = Role.fromJson(roleJson);
    LocalStore.writeUser();
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': activeUser.toJson(), 'role': role.toJson()};
  }
}
