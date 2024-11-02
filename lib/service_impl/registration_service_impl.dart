import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/user_registration_model.dart';
import 'package:rolanda_modified_version/services/registration_services.dart';

class RegistrationServiceImpl implements RegistrationService {
  @override
  Future<bool> registerUser(UserRegistration user) async {
    const url = '$baseUrl/auth/register';

    
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response.statusCode == 200;
  }
}
