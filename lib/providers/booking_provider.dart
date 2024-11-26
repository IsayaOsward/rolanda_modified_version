import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/model/checkout_response_model.dart';
import 'package:rolanda_modified_version/services/confirm_booking_service.dart';

class BookingProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Injecting the service layer
  final BookingService _bookingService;

  BookingProvider(this._bookingService);

  // This method will be called when confirming the booking
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
  ) async {
    _setLoading(true);
    try {
      final response = await _bookingService.confirmBooking(
          hotelId,
          checkIn,
          checkOut,
          adult,
          children,
          roomType,
          roomId,
          fullName,
          emailAddress,
          phoneNumber);

      if (response.successId != "Unknown") {
        return response;
      }
      else{
        return response;
      }
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
