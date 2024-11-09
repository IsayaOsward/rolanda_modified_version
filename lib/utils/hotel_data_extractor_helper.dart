class HotelDataExtractorHelper {
  final dynamic roomTypes;

  HotelDataExtractorHelper({required this.roomTypes});
 Map<String, dynamic>? getRoomDetailsById(int id) {
    // print(roomTypes.price);
    Map<String, dynamic> data = {
      "price": 0,
      "numberOfBeds": 1
    };
    for (var roomType in roomTypes) {
      if (roomType.id == id) {
        data = {
          'price': roomType.price,
          'numberOfBeds': roomType.numberOfBeds,
        };
      }
    }
    return data;
  }
}
