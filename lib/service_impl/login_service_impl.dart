import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rolanda_modified_version/services/login_service.dart';
import '../exceptions/authentication_exception.dart';


class LoginServiceImpl implements LoginService {
  final String apiUrl;

  LoginServiceImpl(this.apiUrl);

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/user/api/login/'),
      body: {'email': username, 'password': password},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw AuthenticationException('Incorrect username or password');
    } else {
      throw NetworkException('System error, please try again later');
    }
  }
}
