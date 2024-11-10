// services/contact_service_impl.dart
import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/contact_model.dart';
import 'dart:convert';

import 'package:rolanda_modified_version/services/contact_service.dart';

class ContactServiceImpl implements ContactService {
  @override
  Future<bool> sendMessage(ContactModel contact) async {
    const url = '$baseUrl/home/api/contact-us/';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(contact.toJson()),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
