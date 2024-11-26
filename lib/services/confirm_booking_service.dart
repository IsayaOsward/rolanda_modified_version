import '../model/checkout_response_model.dart';

abstract class BookingService {
  Future<BookingResponse> confirmBooking(
    int hotelId,
    String checkIn,
    String checkOut,
    int adult,
    int children,
    String roomType,
    int roomId,
    String fullName,
    String emailAddress,
    String phoneNumber,
  );
}
