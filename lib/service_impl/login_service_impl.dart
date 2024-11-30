import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/services/login_service.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';
import '../exceptions/authentication_exception.dart';

class LoginServiceImpl implements LoginService {
  final String apiUrl;
  final storageService = StorageService();
  LoginServiceImpl(this.apiUrl);

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user/api/login/'),
      body: {'email': username.trim(), 'password': password.trim()},
    );
    if (response.statusCode == 200) {
      await storageService.saveUserData(
        username: json.decode(response.body)['username'],
        email: json.decode(response.body)['email'],
        accessToken: json.decode(response.body)['access'],
        refreshToken: json.decode(response.body)['refresh'],
      );
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw AuthenticationException('Incorrect username or password');
    } else {
      throw NetworkException('System error, please try again later');
    }
  }
}
