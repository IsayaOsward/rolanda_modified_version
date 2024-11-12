import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/utils/date_converter.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';

class AddToSelectionProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccessful = false; // Track success
  final storageService = StorageService();
  Future<void> addToSelection(
    int hotelID,
    String hotelName,
    double hotelPrice,
    int numberOfBeds,
    String checkInDate,
    String checkOutDate,
    String roomTypeId,
    int roomId,
    int adult,
    int children,
  ) async {
    isLoading = true;
    isSuccessful = false;
    notifyListeners();

    String? token = await storageService.getUserToken();
    Map<String, dynamic> selectionData = {
      "hotel_id": hotelID,
      "hotel_name": hotelName,
      "room_price": hotelPrice,
      "number_of_beds": numberOfBeds,
      "room_type_id": roomTypeId,
      "check_in": convertToYyyyMmDd(checkInDate),
      "check_out": convertToYyyyMmDd(checkOutDate),
      "room_id": roomId,
      "adult": adult,
      "children": children,
    };
    final url = Uri.parse('$baseUrl/booking/api/add-to-selection/');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      final result = await http.post(url,
          headers: headers, body: jsonEncode(selectionData));
      if (result.statusCode == 201) {
        isSuccessful = true;
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
