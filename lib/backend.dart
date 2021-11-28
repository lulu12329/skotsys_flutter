import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'LocalStore.dart';

class Backend {
  static final Backend _instance = Backend._internal();
  final String _backendAddress = "";
  String _token = "";
  static final http.Client httpClient = http.Client();

  Backend._internal();

  factory Backend() {
    return _instance;
  }

  Future<String> signIn(String username, String password) async {
    //build request
    var body = {
      "username": "$username",
      "password": "$password",
    };
    Uri uri = Uri.parse(_backendAddress);
    //send request
    http.Response response = await httpClient.post(uri,
        body: json.encode(body),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    //handling response
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      _token = responseBody['token'];
      LocalStore.writeUser(username, _token);
      return '';
    } else {
      //TODO handle error
      return 'something went wrong';
    }
  }

  Future<String> getCleaningPlanData() async {
    String route = "cleaning_plan";
    http.Response response = await _get(route);
    //handling response
    if (response.statusCode == 200) {
      //TODO successfull handle response
      return "";
    } else {
      //TODO handle http error
      return "Telefonnummer ist ungültig";
    }
  }

  Future<http.Response> _post(String path, Object body) {
    if (_token == "") throw new Exception();

    Uri uri = Uri.http("bearer:@$_backendAddress", "/path");
    return httpClient.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: 'Bearer $_token'
        },
        body: json.encode(body));
  }

  Future<http.Response> _get(String path) {
    Uri uri = Uri.http("bearer:@$_backendAddress", "/path");
    return httpClient.get(uri, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer $_token'
    });
  }
}
