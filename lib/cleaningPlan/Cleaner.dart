import 'Room.dart';

class Cleaner {
  String name;
  String number;
  List<RoomToClean> roomsToClean = new List.empty();

  Cleaner(this.name, this.number);
}
