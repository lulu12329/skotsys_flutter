class Role {
  int hotelID = 0;
  int roleID = 0;

  String name = "";

  String description = "";

  //Colours Colour;

  //General:
  bool isAllowedToSeePrice = false;
  bool isAllowedToGiveDiscount = false;
  bool isAllowedToEditHotel = false;
  //Booking:
  bool isAllowedToCreateNewBooking = false;
  bool isAllowedToEditBooking = false;
  bool isAllowedToDeleteBooking = false;
  bool isAllowedToSeeBooking = false;
  //Room:
  bool isAllowedToCreateNewRoom = false;
  bool isAllowedToEditRoom = false;
  bool isAllowedToDeleteRoom = false;
  bool isAllowedToSeeListOfRooms = false;
  //Room Category:
  bool isAllowedToCreateNewRoomCategory = false;
  bool isAllowedToEditRoomCategory = false;
  bool isAllowedToDeleteRoomCategory = false;
  bool isAllowedToSeeListOfRoomsCategory = false;
  //Catering:
  bool isAllowedToCreateNewCatering = false;
  bool isAllowedToEditCatering = false;
  bool isAllowedToDeleteCatering = false;
  bool isAllowedToSeeListOfCaterings = false;
  //Invoice:
  bool isAllowedToPrintInvoice = false;
  bool isAllowedToSeeInvoices = false;
  //User:
  bool isAllowedToCreateNewUser = false;
  bool isAllowedToEditUser = false;
  bool isAllowedToDeleteUser = false;
  bool isAllowedToLockUser = false;
  bool isAllowedToSeeListOfUsers = false;
  bool isAllowedToChangeUsersPassword = false;
  //Role:
  bool isAllowedToCreateNewRole = false;
  bool isAllowedToEditRole = false;
  bool isAllowedToDeleteRole = false;
  bool isAllowedToSeeListOfRoles = false;
  //Cleaningplan:
  bool isAllowedToUseCleaningplan = false;
  bool isAllowedToEditAllAssignments = false;
  bool isAllowedToEditCleaningplan = false;
  bool isAllowedToSeeCleaningplan = false;
  //Dashboard:
  bool isAllowedToSeeDashboard = false;

  Role();

  Role.fromJson(Map<String, dynamic> roleJson) {
    hotelID = roleJson['HotelID'];
    roleID = roleJson['RoleID'];

    name = roleJson['Name'];

    description = roleJson['Description'];

    //Colours Colour;

    //General:
    isAllowedToSeePrice = roleJson['IsAllowedToSeePrice'];
    isAllowedToGiveDiscount = roleJson['IsAllowedToGiveDiscount'];
    isAllowedToEditHotel = roleJson['IsAllowedToEditHotel'];
    //Booking:
    isAllowedToCreateNewBooking = roleJson['IsAllowedToCreateNewBooking'];
    isAllowedToEditBooking = roleJson['IsAllowedToEditBooking'];
    isAllowedToDeleteBooking = roleJson['IsAllowedToDeleteBooking'];
    isAllowedToSeeBooking = roleJson['IsAllowedToSeeBooking'];
    //Room:
    isAllowedToCreateNewRoom = roleJson['IsAllowedToCreateNewRoom'];
    isAllowedToEditRoom = roleJson['IsAllowedToEditRoom'];
    isAllowedToDeleteRoom = roleJson['IsAllowedToDeleteRoom'];
    isAllowedToSeeListOfRooms = roleJson['IsAllowedToSeeListOfRooms'];
    //Room Category:
    isAllowedToCreateNewRoomCategory =
        roleJson['IsAllowedToCreateNewRoomCategory'];
    isAllowedToEditRoomCategory = roleJson['IsAllowedToEditRoomCategory'];
    isAllowedToDeleteRoomCategory = roleJson['IsAllowedToDeleteRoomCategory'];
    isAllowedToSeeListOfRoomsCategory =
        roleJson['IsAllowedToSeeListOfRoomsCategory'];
    //Catering:
    isAllowedToCreateNewCatering = roleJson['IsAllowedToCreateNewCatering'];
    isAllowedToEditCatering = roleJson['IsAllowedToEditCatering'];
    isAllowedToDeleteCatering = roleJson['IsAllowedToDeleteCatering'];
    isAllowedToSeeListOfCaterings = roleJson['IsAllowedToSeeListOfCaterings'];
    //Invoice:
    isAllowedToPrintInvoice = roleJson['IsAllowedToPrintInvoice'];
    isAllowedToSeeInvoices = roleJson['IsAllowedToSeeInvoices'];
    //User:
    isAllowedToCreateNewUser = roleJson['IsAllowedToCreateNewUser'];
    isAllowedToEditUser = roleJson['IsAllowedToEditUser'];
    isAllowedToDeleteUser = roleJson['IsAllowedToDeleteUser'];
    isAllowedToLockUser = roleJson['IsAllowedToLockUser'];
    isAllowedToSeeListOfUsers = roleJson['IsAllowedToSeeListOfUsers'];
    isAllowedToChangeUsersPassword = roleJson['IsAllowedToChangeUsersPassword'];
    //Role:
    isAllowedToCreateNewRole = roleJson['IsAllowedToCreateNewRole'];
    isAllowedToEditRole = roleJson['IsAllowedToEditRole'];
    isAllowedToDeleteRole = roleJson['IsAllowedToDeleteRole'];
    isAllowedToSeeListOfRoles = roleJson['IsAllowedToSeeListOfRoles'];
    //Cleaningplan:
    isAllowedToUseCleaningplan = roleJson['IsAllowedToUseCleaningplan'];
    isAllowedToEditAllAssignments = roleJson['IsAllowedToEditAllAssignments'];
    isAllowedToEditCleaningplan = roleJson['IsAllowedToEditCleaningplan'];
    isAllowedToSeeCleaningplan = roleJson['IsAllowedToSeeCleaningplan'];
    //Dashboard:
    isAllowedToSeeDashboard = roleJson['IsAllowedToSeeDashboard'];
  }

  Map<String, dynamic> toJson() {
    return {
      'HotelID': hotelID,
      "RoleID": roleID,
      'Name': name,
      'Description': description,
      'IsAllowedToSeePrice': isAllowedToSeePrice,
      'IsAllowedToGiveDiscount': isAllowedToGiveDiscount,
      'IsAllowedToEditHotel': isAllowedToEditHotel,
      'IsAllowedToCreateNewBooking': isAllowedToCreateNewBooking,
      'IsAllowedToEditBooking': isAllowedToEditBooking,
      'IsAllowedToDeleteBooking': isAllowedToDeleteBooking,
      'IsAllowedToSeeBooking': isAllowedToSeeBooking,
      'IsAllowedToCreateNewRoom': isAllowedToCreateNewRoom,
      'IsAllowedToEditRoom': isAllowedToEditRoom,
      'IsAllowedToDeleteRoom': isAllowedToDeleteRoom,
      'IsAllowedToSeeListOfRooms': isAllowedToSeeListOfRooms,
      'IsAllowedToCreateNewRoomCategory': isAllowedToCreateNewRoomCategory,
      'IsAllowedToEditRoomCategory': isAllowedToEditRoomCategory,
      'IsAllowedToDeleteRoomCategory': isAllowedToDeleteRoomCategory,
      'IsAllowedToSeeListOfRoomsCategory': isAllowedToSeeListOfRoomsCategory,
      'IsAllowedToCreateNewCatering': isAllowedToCreateNewCatering,
      'IsAllowedToEditCatering': isAllowedToEditCatering,
      'IsAllowedToDeleteCatering': isAllowedToDeleteCatering,
      'IsAllowedToSeeListOfCaterings': isAllowedToSeeListOfCaterings,
      'IsAllowedToPrintInvoice': isAllowedToPrintInvoice,
      'IsAllowedToSeeInvoices': isAllowedToSeeInvoices,
      'IsAllowedToCreateNewUser': isAllowedToCreateNewUser,
      'IsAllowedToEditUser': isAllowedToEditUser,
      'IsAllowedToDeleteUser': isAllowedToDeleteUser,
      'IsAllowedToLockUser': isAllowedToLockUser,
      'IsAllowedToSeeListOfUsers': isAllowedToSeeListOfUsers,
      'IsAllowedToChangeUsersPassword': isAllowedToChangeUsersPassword,
      'IsAllowedToCreateNewRole': isAllowedToCreateNewRole,
      'IsAllowedToEditRole': isAllowedToEditRole,
      'IsAllowedToDeleteRole': isAllowedToDeleteRole,
      'IsAllowedToSeeListOfRoles': isAllowedToSeeListOfRoles,
      'IsAllowedToUseCleaningplan': isAllowedToUseCleaningplan,
      'IsAllowedToEditAllAssignments': isAllowedToEditAllAssignments,
      'IsAllowedToEditCleaningplan': isAllowedToEditCleaningplan,
      'IsAllowedToSeeCleaningplan': isAllowedToSeeCleaningplan,
      'IsAllowedToSeeDashboard': isAllowedToSeeDashboard
    };
  }
}
