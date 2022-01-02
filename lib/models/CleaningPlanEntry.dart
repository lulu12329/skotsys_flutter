class CleaningPlanEntry {
  int cleaningPlanID = 0;
  int hotelID = 0;
  int roomID = 0;
  int cleanerID = 0;
  DateTime cleanDate = new DateTime.now();
  bool isCleaning = false;
  DateTime? beginTime = new DateTime.now();
  bool isCleaned = false;
  DateTime? timestamp = new DateTime.now();

  CleaningPlanEntry.fromJson(Map<String, dynamic> json) {
    hotelID = json['HotelID'];
    roomID = json['RoomID'];
    cleanerID = json['CleanerID'];
    var cleanDateJson = json['CleanDate'];
    cleanDate = DateTime.parse(cleanDateJson);
    isCleaning = json['IsCleaning'];
    var beginTimeJson = json['BeginTime'];
    beginTime = beginTimeJson != null ? DateTime.parse(beginTimeJson) : null;
    isCleaned = json['IsCleaned'];
    var timestampJson = json['Timestamp'];
    timestamp = timestampJson != null ? DateTime.parse(beginTimeJson) : null;
  }
}
