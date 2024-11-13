import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/user_registration_model.dart';
import 'package:rolanda_modified_version/services/registration_services.dart';

class RegistrationServiceImpl implements RegistrationService {
  @override
  Future<bool> registerUser(UserRegistration user) async {
    const url = '$baseUrl/user/api/register/';

    final registerUser = {
      "username" : user.email,
      "full_name" : "${user.firstName} ${user.lastName}",
      "phone": user.phoneNumber,
      "email": user.email,
      "password1": user.password,
      "password2": user.confirmPassword
    };

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(registerUser),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response.statusCode == 201;
  }
}
