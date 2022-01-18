import 'dart:convert';

import 'package:http/http.dart';
import 'package:kotsys_flutter/models/CleaningPlanData.dart';
import 'package:kotsys_flutter/services/backend.dart';

class CleaningPlanService {
  HttpClientHelper httpClientHelper = new HttpClientHelper();

  Future<CleaningPlanData> get(int id) async {
    Response response = await httpClientHelper.get('roles/$id');

    //handling response
    if (response.statusCode == 200) {
      return CleaningPlanData.fromJson(json.decode(response.body)["data"]);
    } else {
      throw new Exception();
    }
  }

  Future<CleaningPlanData> getForDate(DateTime date) async {
    Response response = await httpClientHelper
        .get('cleaningPlan/day/${date.toIso8601String()}');

    //handling response
    if (response.statusCode == 200) {
      return CleaningPlanData.fromJson(json.decode(response.body)["data"]);
    } else {
      throw new Exception();
    }
  }
}
