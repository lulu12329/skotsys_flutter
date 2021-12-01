class Room {
  int number;
  String state;

  Room(this.number, this.state);
}

class RoomToClean extends Room {
  DateTime start;
  DateTime end;

  RoomToClean(int roomNumber, String state, this.start, this.end)
      : super(roomNumber, state);
}
