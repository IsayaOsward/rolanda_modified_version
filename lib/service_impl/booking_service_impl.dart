import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'dart:convert';

import 'package:rolanda_modified_version/services/booking_service.dart';

class BookingServiceImpl implements BookingService {
  @override
  Future<void> confirmBooking(
    int hotelId,
    String checkIn,
    String checkOut,
    int adult,
    int children,
    String roomType,
    int roomId,
  ) async {
    const url = '$baseUrl/api/selected-rooms/';
   final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMxMjQ3OTI1LCJpYXQiOjE3MzEyNDQzMjUsImp0aSI6ImQyNGVmNzAzMDFhODRjYzk5NmFhZTUzZGFhN2ZkMGU4IiwidXNlcl9pZCI6N30.tA6GBtOzDlpUkdsoCxvONsF1SSQt4mNt1dChd5trQKU'
    };

    final body = jsonEncode({
      'hotel_id': hotelId,
      'check_in': checkIn,
      'check_out': checkOut,
      'adult': adult,
      'children': children,
      'room_type': roomType,
      'room_id': roomId,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201) {
        // Handle success response
        print('Booking confirmed');
      } else {
        // Handle failure response
        throw Exception('Failed to confirm booking ${response.body}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }
}
