import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';

class AddToSelectionProvider extends ChangeNotifier {
/**
 * POST:   /booking/api/add-to-selection/  {
    "hotel_id":1,                                  ROOMS
    "hotel_name":"Gran Melia Hotel",              
    "room_price":50.0,                            FROM HOTELS DATA
    "number_of_beds":2,                           
    "check_in":"2024-08-23",                      
    "check_out":"2024-08-25",
    "room_type_id":1,                             
    "room_id":1                                   
}
 */

  bool isLoading = false;

  Future<void> addToSelection(
      int hotelID,
      String hotelName,
      double hotelPrice,
      int numberOfBeds,
      String checkInDate,
      String checkOutDate,
      int roomTypeId,
      int roomId) async {
    //
    isLoading = true;
    Map<String, dynamic> selectionData = {
      "hotel_id": 1,
      "hotel_name": "Gran Melia Hotel",
      "room_price": 50.0,
      "number_of_beds": 2,
      "check_in": "2024-08-23",
      "check_out": "2024-08-25",
      "room_type_id": 1,
      "room_id": 1
    };

    final url = Uri.parse('$baseUrl/booking/api/add-to-selection/');
    try {
      final result = await http.post(url, body: jsonEncode(selectionData));
      if (result.statusCode == 200) {}
    } catch (e) {
      
    }
  }
}
