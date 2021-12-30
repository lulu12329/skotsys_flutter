import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kotsys_flutter/User.dart';
import 'package:kotsys_flutter/services/backend.dart';

import '../LocalStore.dart';

class LoginService {
  static Future login(username, password) async {
    HttpClientHelper httpClientHelper = new HttpClientHelper();

    String address = httpClientHelper.serverAddress + 'auth/login';

    //build requestBody
    var body = {
      "login": "$username",
      "password": "$password",
    };
    //send request
    Response response = await http.post(
      Uri.parse(address),
      body: json.encode(body),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    //handling response
    if (response.statusCode == 201) {
      dynamic responseBody = json.decode(response.body)["data"];
      User().fromJson(responseBody);
      httpClientHelper.token = User().token;
    } else {
      throw new Exception('Login failed');
    }
  }
}
