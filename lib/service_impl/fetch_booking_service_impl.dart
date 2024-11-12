import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/reservation_model.dart';
import 'package:rolanda_modified_version/services/fetch_booking_service.dart';

class ReservationServiceImpl implements ReservationService {
  final String apiUrl = "$baseUrl/api/bookings/";

  @override
  Future<List<Reservation>> fetchReservations(String? token) async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<dynamic> filteredData = data.where((reservation) {
        return reservation['payment_status'] == 'paid' ||
               reservation['payment_status'] == 'processing';
      }).toList();

      return filteredData.map((json) => Reservation.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reservations');
    }
  }
}
