import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'dart:convert';

import 'package:rolanda_modified_version/services/confirm_booking_service.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';

class BookingServiceImpl implements BookingService {
  final storageService = StorageService();
  @override
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
      String phoneNumber) async {
    const url = '$baseUrl/api/selected-rooms/';
    String? token = await storageService.getUserToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final body = jsonEncode(
      {
        'hotel_id': hotelId,
        'check_in': checkIn,
        'check_out': checkOut,
        'adult': adult,
        'children': children,
        'room_type': roomType,
        'room_id': roomId,
      },
    );

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> res = jsonDecode(response.body);
        // Access the booking_id
        final bookingId = res["booking_id"];
        String endPoint = '$baseUrl/api/checkout/$bookingId/';
        final checkoutBody = jsonEncode({
          "full_name": fullName,
          "email": emailAddress,
          "phone": phoneNumber
        });
        final result = await http.post(Uri.parse(endPoint),
            headers: headers, body: checkoutBody);
        if (result.statusCode == 200 || result.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
