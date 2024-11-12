import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'dart:convert';

import 'package:rolanda_modified_version/services/confirm_booking_service.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';

class BookingServiceImpl implements BookingService {
  final storageService = StorageService();
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
    String? token = await storageService.getUserToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
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
