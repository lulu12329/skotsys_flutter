import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kotsys_flutter/views/cleaningPlan/Cleaner.dart';
import 'package:kotsys_flutter/views/cleaningPlan/CleaningPlanData.dart';
import 'package:kotsys_flutter/views/cleaningPlan/Room.dart';

class HttpClientHelper {
  static final HttpClientHelper _instance = HttpClientHelper._internal();
  final String serverAddress = "http://192.168.10.94:3000/";
  String token = "";
  static final http.Client httpClient = http.Client();

  HttpClientHelper._internal();

  factory HttpClientHelper() {
    return _instance;
  }

  Future<CleaningPlanData> getCleaningPlanData() async {
    List<Cleaner> cleaners = List.empty();
    Cleaner cleaner1 = Cleaner('test', '');
    cleaner1.roomsToClean = List.filled(
        1,
        RoomToClean(101, "dirty", DateTime.parse("2021-11-28 10:20:00"),
            DateTime.parse("2021-11-28 11:00:00")));

    cleaners.add(cleaner1);
    return CleaningPlanData(cleaners);

    /* String route = "cleaning_plan";
    http.Response response = await _get(route);
    //handling response
    if (response.statusCode == 200) {
      //TODO successfull handle response
      List<Cleaner> cleaners = List.empty();
      Cleaner cleaner1 = Cleaner('test', '');
      cleaner1.roomsToClean = List.filled(
          1,
          RoomToClean(101, "dirty", DateTime.parse("2021-11-28 10:20:00"),
              DateTime.parse("2021-11-28 11:00:00")));

      cleaners.add(cleaner1);
      return CleaningPlanData(cleaners);
    } else {
      throw new Exception('Error message');
    } */
  }

  Future<http.Response> post(String path, Object body) {
    if (token == "") throw new Exception();

    Uri uri = Uri.http("bearer:@$serverAddress", "/path");
    return httpClient.post(uri,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: token
        },
        body: json.encode(body));
  }

  Future<http.Response> get(String path) async {
    if (token == "") throw new Exception();

    String address = serverAddress + path;
    Uri uri = Uri.parse(address);

    /* await http.get(address, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token
    }); */
    ;

    return await httpClient.get(uri, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: token
    });
  }
}
