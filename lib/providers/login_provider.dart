// providers/login_provider.dart

import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/model/login_model.dart';
import 'package:rolanda_modified_version/repository/login_repository.dart';
import '../exceptions/authentication_exception.dart';

class LoginProvider with ChangeNotifier {
  final LoginRepository _repository;

  LoginProvider(this._repository);

  LoginModel? _loginData;
  bool _isLoading = false;
  String? _errorMessage;

  LoginModel? get loginData => _loginData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final loginData = await _repository.login(username, password);
      _loginData = loginData;
    } on AuthenticationException catch (e) {
      _errorMessage = e.message;
    } on NetworkException catch (e) {
      _errorMessage = e.message;
    } catch (e) {
      _errorMessage = 'An unexpected error occurred';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
