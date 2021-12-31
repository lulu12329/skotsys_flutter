import 'dart:convert';

import 'package:http/http.dart';
import 'package:kotsys_flutter/models/Role.dart';
import 'package:kotsys_flutter/services/backend.dart';

class RoleService {
  HttpClientHelper httpClientHelper = new HttpClientHelper();

  Future<Role> get(int id) async {
    Response response = await httpClientHelper.get('roles/$id');

    //handling response
    if (response.statusCode == 200) {
      return Role.fromJson(json.decode(response.body)["data"]);
    } else {
      throw new Exception();
    }
  }
}
