import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/hotel_model.dart';

class HotelsProvider extends ChangeNotifier {
  bool isLoading = true;
  late String error;
  Map<String, dynamic> _hotelResult = {};
  List _hotels = [];
  final Map<String, String> _slugPrice = {};

  // Getters to access the state
  Map<String, dynamic> get hotelResult => _hotelResult;
  List get hotels => _hotels;
  Map<String, String> get slugPrice => _slugPrice;

  // Method to fetch hotels data with optional search query and category
  Future<void> fetchHotels({String? searchQuery, String? category}) async {
    String endpoint = '$baseUrl/api/hotels/';

    if (searchQuery != null && searchQuery.isNotEmpty) {
      endpoint += '?q=$searchQuery';
    }

    if (category != null && category != "All") {
      endpoint += (searchQuery != null && searchQuery.isNotEmpty) ? '&' : '?';
      endpoint += 'category=$category';
    }

    final url = Uri.parse(endpoint);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        
        final List hotelsJson = json.decode(response.body);
        _hotels =
            hotelsJson.map((hotelJson) => Hotel.fromJson(hotelJson)).toList();
        
        
        _hotelResult = {
          "status": "ok",
          "hotels": _hotels,
        };
        isLoading = false;
      } else {
        error = "Failed to fetch hotels from the server";
        isLoading = true;
      }
    } catch (e) {
      error = "An error occurred: $e";
      isLoading = true;
    }
    notifyListeners();
  }
}
