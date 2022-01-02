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
    var priceValue = room['Price'];
    if (priceValue is int)
      price = priceValue.toDouble();
    else
      price = priceValue;
    roomState = RoomState.values[room['Status']];
  }
}
