import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kotsys_flutter/session.dart';

class HttpClientHelper {
  static final HttpClientHelper _instance = HttpClientHelper._internal();
  final String serverAddress = "http://192.168.10.94:3000/";
  String token = Session().token;
  static final http.Client httpClient = http.Client();

  HttpClientHelper._internal();

  factory HttpClientHelper() {
    return _instance;
  }

  Future<http.Response> post(String path, Map<String, dynamic> body) {
    if (token == "") throw new Exception();

    Uri uri = Uri.http("bearer:@$serverAddress", "/path");
    return httpClient.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: token
      },
      body: body,
    );
  }

  Future<http.Response> get(String path) async {
    if (token == "") throw new Exception('token not set Exception');

    String address = serverAddress + path;
    Uri uri = Uri.parse(address);

    return await httpClient.get(uri, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token
    });
  }
}
