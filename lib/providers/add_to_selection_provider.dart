import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/utils/date_converter.dart';

class AddToSelectionProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSuccessful = false; // Track success

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
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzMxMjQ3OTI1LCJpYXQiOjE3MzEyNDQzMjUsImp0aSI6ImQyNGVmNzAzMDFhODRjYzk5NmFhZTUzZGFhN2ZkMGU4IiwidXNlcl9pZCI6N30.tA6GBtOzDlpUkdsoCxvONsF1SSQt4mNt1dChd5trQKU'
    };
    try {
      final result = await http.post(url,
          headers: headers, body: jsonEncode(selectionData));
      if (result.statusCode == 201) {
        isSuccessful = true;
        print("object");
      } else {
        print(result.body);
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
