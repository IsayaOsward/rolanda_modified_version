abstract class BookingService {
  Future<bool> confirmBooking(
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
