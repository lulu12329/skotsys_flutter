import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kotsys_flutter/services/backend.dart';

import '../LocalStore.dart';

class LoginService {
  static Future login(username, password) async {
    HttpClientHelper httpClientHelper = new HttpClientHelper();

    String address = httpClientHelper.serverAddress + 'auth/login';

    //build requestBody
    var body = {
      "username": "$username",
      "password": "$password",
    };
    //send request
    Response response = await http.post(
      Uri.parse(address),
      body: json.encode(body),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );

    //handling response
    if (response.statusCode == 200) {
      dynamic responseBody = json.decode(response.body);
      final token = responseBody['token'];
      httpClientHelper.token = token;
      LocalStore.writeUser(username, token);
    } else {
      throw new Exception('Login failed');
    }
  }
}
