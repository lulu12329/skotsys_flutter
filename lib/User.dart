import 'dart:convert';

class User {
  String id = "";
  String name = "";
  String email = "";
  String token = "";
  static final User _instance = User._internal();

  User._internal();

  factory User(){
    return _instance;
  }

  User.fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    name = json['name'];
    email = json['email'];
    id = json['id'];
    token = json['token'];
  }

  Map<String,dynamic> toJson() => {
    'name' : name,
    'email' : email,
    'id': id,
  };

   Map<String,dynamic> toJsonWithToken() => {
    'name' : name,
    'email' : email,
    'id': id,
    'token': token,
  };
}