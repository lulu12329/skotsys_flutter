import 'package:kotsys_flutter/enums/roomState.dart';

class Room {
  int roomid = 0;
  int hotelid = 0;
  String roomName = "";
  int numBeds = 0;
  int category = 0;
  double price = 0;
  RoomState roomState = RoomState.free;

  Room.fromJson(dynamic room) {
    roomid = room['RoomId'];
    hotelid = room['Hotelid'];
    roomName = room['RoomName'];
    numBeds = room['NumBeds'];
    category = room['Category'];
    price = room['Price'];
    roomState = RoomState.values[room['State']];
  }
}
