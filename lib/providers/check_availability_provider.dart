import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:rolanda_modified_version/config/base_url.dart';

class CheckAvailabilityProvider with ChangeNotifier {
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _bookingResponse;
  Map<String, dynamic>? get bookingResponse => _bookingResponse;

  String? _error;
  String? get error => _error;

  Future<void> checkAvailability({
    required int hotelId,
    required String roomType,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfAdults,
    required int numberOfChildren,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final url = Uri.parse('$baseUrl/booking/api/check_room_availability/');
    final headers = {'Content-Type': 'application/json'};
    final requestData = jsonEncode({
      'hotel_id': hotelId,
      'room_type': roomType.toLowerCase(),
      'check_in': _dateFormat.format(checkInDate),
      'check_out': _dateFormat.format(checkOutDate),
      'adult': numberOfAdults,
      'children': numberOfChildren,
    });
    print("==========================> $requestData");
    try {
      final response =
          await http.post(url, headers: headers, body: requestData);

      if (response.statusCode == 302) {
        final redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          final parsedUrl = Uri.parse(redirectUrl);
          final fullUrl =
              parsedUrl.isAbsolute ? parsedUrl : url.resolve(redirectUrl);
          final redirectedResponse = await http.get(fullUrl);
          _bookingResponse = jsonDecode(redirectedResponse.body);
          print(
              "============================================$_bookingResponse");
        } else {
          _error = 'No redirect URL provided';
        }
      } else {
        _bookingResponse = jsonDecode(response.body);
      }
    } catch (error) {
      _error = 'Error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
