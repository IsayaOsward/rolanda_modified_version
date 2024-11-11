import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/services/booking_service.dart';

class BookingProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Injecting the service layer
  final BookingService _bookingService;

  BookingProvider(this._bookingService);

  // This method will be called when confirming the booking
  Future<void> confirmBooking(
    int hotelId,
    String checkIn,
    String checkOut,
    int adult,
    int children,
    String roomType,
    int roomId,
  ) async {
    _setLoading(true);
    try {
      await _bookingService.confirmBooking(
        hotelId,
        checkIn,
        checkOut,
        adult,
        children,
        roomType,
        roomId,
      );
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
