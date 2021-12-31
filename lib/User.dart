import 'package:kotsys_flutter/LocalStore.dart';
import 'package:kotsys_flutter/services/backend.dart';
import 'package:kotsys_flutter/services/roleService.dart';

import 'models/Role.dart';

class User {
  int id = 0;
  int hotelId = 0;
  int placeId = 0;
  String lName = "";
  String fName = "";
  String street = "";
  String postcode = "";
  String country = "";
  String city = "";
  String email = "";
  String tel = "";
  DateTime birthDate = new DateTime(0);
  Role role = new Role();
  String token = "";
  static final User _instance = User._internal();

  User._internal();

  factory User() {
    return _instance;
  }

  void fromJson(Map<String, dynamic> json) async {
    token = json['token'];
    HttpClientHelper().token = token;

    id = json['UserId'];
    hotelId = json['HotelId'];
    placeId = json['PlaceId'];
    lName = json['LName'];
    fName = json['FName'];
    street = json['Street'];
    postcode = json['Postcode'];
    country = json['Country'];
    city = json['City'];
    email = json['Email'];
    tel = json['Tel'];
    birthDate = DateTime.parse(json['Birthdate']);
    int roleId = json['Role'];
    role = await RoleService().get(roleId);
    LocalStore.writeUser();
  }

  Map<String, dynamic> toJsonWithToken() {
    return {
      'UserId': id,
      'HotelId': hotelId,
      'PlaceId': placeId,
      'LName': lName,
      'fName': fName,
      'Street': street,
      'Postcode': postcode,
      'Country': country,
      'City': city,
      'Email': email,
      'Tel': tel,
      'Birthdate': birthDate.toString(),
      'token': token,
      'Role': role.roleID
    };
  }
}
