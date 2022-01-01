import 'package:kotsys_flutter/models/Room.dart';
import 'package:kotsys_flutter/models/user.dart';

class CleaningPlanData {
  List<User> cleaners = [];
  List<Room> rooms = [];
  List<int> listPoints = [];

  CleaningPlanData(this.cleaners, this.listPoints, this.rooms);

  CleaningPlanData.fromJson(Map<String, dynamic> json) {
    cleaners = _cleanersFromJson(json['cleaners']);
    rooms = _roomsFromJson(json['Rooms']);
    listPoints = json['ListPoints'];
  }

  List<User> _cleanersFromJson(dynamic data) {
    List<dynamic> cleanersList = data != null ? List.from(data) : [];
    return cleanersList.map((element) => User.fromJson(element)).toList();
  }

  List<Room> _roomsFromJson(dynamic rooms) {
    List<dynamic> roomsList = rooms != null ? List.from(rooms) : [];
    return roomsList.map((e) => Room.fromJson(e)).toList();
  }
}
