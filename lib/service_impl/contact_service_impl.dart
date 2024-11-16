import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/contact_model.dart';
import 'dart:convert';

import '../services/contact_service.dart';

class ContactServiceImpl implements ContactService {
  @override
  Future<bool> sendMessage(ContactModel contact) async {
    const url = '$baseUrl/home/api/contact-us/';

    Map<String, dynamic> contactForm = contact.toJson();
    print(contactForm);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(contactForm),
      );
      print("====================>${response.body}");
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
