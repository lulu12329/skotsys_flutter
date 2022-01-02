import 'package:kotsys_flutter/models/Room.dart';
import 'package:kotsys_flutter/models/user.dart';
import 'package:kotsys_flutter/models/cleaningPlanEntry.dart';

class CleaningPlanData {
  List<User> cleaners = [];
  List<Room> rooms = [];
  List<CleaningPlanEntry> listPoints = [];

  CleaningPlanData(this.cleaners, this.listPoints, this.rooms);

  CleaningPlanData.fromJson(Map<String, dynamic> json) {
    cleaners = _cleanersFromJson(json['Cleaners']);
    rooms = _roomsFromJson(json['ListRoom']);
    listPoints = _entrysFromJson(json['ListPoints']);
  }

  List<User> _cleanersFromJson(dynamic data) {
    List<dynamic> cleanersList = data != null ? List.from(data) : [];
    return cleanersList.map((element) => User.fromJson(element)).toList();
  }

  List<Room> _roomsFromJson(dynamic rooms) {
    List<dynamic> roomsList = rooms != null ? List.from(rooms) : [];
    return roomsList.map((e) => Room.fromJson(e)).toList();
  }

  List<CleaningPlanEntry> _entrysFromJson(dynamic entrys) {
    List<dynamic> entryList = entrys != null ? List.from(entrys) : [];
    return entryList.map((e) => CleaningPlanEntry.fromJson(e)).toList();
  }
}
