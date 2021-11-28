import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Backend {
  static final Backend _instance = Backend._internal();
  final String _backendAddress = "";
  String _token = "";

  Backend._internal();

  factory Backend() {
    return _instance;
  }

  Future<String> signIn(
      http.Client client, String phonenumber, String kundenNr) async {
    var body = {
      "username": "$phonenumber",
      "password": "$kundenNr",
    };
    Uri uri = Uri.parse(_backendAddress);
    http.Response response = await client.post(uri,
        body: json.encode(body),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    //handling response
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var token = responseBody['data']['card'][0]['number'];
      return "";
    } else {
      return "Telefonnummer ist ungültig";
    }
  }

  Future<String> getCleaningPlanData(
      http.Client client, String phonenumber, String kundenNr) async {
    var body = {
      "phone": "$phonenumber",
      "kundenNr": "$kundenNr",
    };
    Uri uri = Uri.parse(_backendAddress);
    http.Response response = await client.post(uri,
        body: json.encode(body),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    //handling response
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var token = responseBody['data']['card'][0]['number'];
      return "";
    } else {
      return "Telefonnummer ist ungültig";
    }
  }

  Future<http.Response> _post(http.Client client,String path,Object body){
    if(_token == "")
      throw new Exception();
    
    Uri uri = Uri.http("bearer:@$_backendAddress", "/path");
    return client.post(uri,
    headers: {HttpHeaders.contentTypeHeader:"application/json"},
    body: json.encode(body)
    );
  }

  Future<String> getCleaningPlanData2(String phonenumber, String kundenNr) async {
    var body = {
      "phone": "$phonenumber",
      "kundenNr": "$kundenNr",
    };
    Uri uri = Uri.parse(_backendAddress);
    http.Response response = await client.post(uri,
        body: json.encode(body),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    //handling response
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      var token = responseBody['data']['card'][0]['number'];
      return "";
    } else {
      return "Telefonnummer ist ungültig";
    }
  }
}
