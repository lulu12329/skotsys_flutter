class User {
  int id = 0;
  int hotelId = 0;
  int placeId = 0;
  String lName = "";
  String fName = "";
  String street = "";
  String postcode = "";
  String country = "";
  String city = "";
  String email = "";
  String tel = "";
  DateTime birthDate = new DateTime(0);
  int role = 0;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['UserId'];
    hotelId = json['HotelId'];
    placeId = json['PlaceId'];
    lName = json['LName'];
    fName = json['FName'];
    street = json['Street'];
    postcode = json['Postcode'];
    country = json['Country'];
    city = json['City'];
    email = json['Email'];
    tel = json['Tel'];
    birthDate = DateTime.parse(json['Birthdate']);
    role = json['Role'];
  }

  Map<String, dynamic> toJson() {
    return {
      'UserId': id,
      'HotelId': hotelId,
      'PlaceId': placeId,
      'LName': lName,
      'fName': fName,
      'Street': street,
      'Postcode': postcode,
      'Country': country,
      'City': city,
      'Email': email,
      'Tel': tel,
      'Birthdate': birthDate.toString(),
    };
  }
}
