import 'package:rolanda_modified_version/model/login_model.dart';
import 'package:rolanda_modified_version/services/login_service.dart';

class LoginRepository {
  final LoginService _loginService;

  LoginRepository(this._loginService);

  Future<LoginModel> login(String username, String password) async {
    final response = await _loginService.login(username, password);
    return LoginModel.fromJson(response);
  }
}
