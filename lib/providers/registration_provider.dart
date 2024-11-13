import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/model/user_registration_model.dart';
import 'package:rolanda_modified_version/repository/registration_repository.dart';

class RegistrationProvider with ChangeNotifier {
  final RegistrationRepository registrationRepository;

  RegistrationProvider({required this.registrationRepository});

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> registerUser(UserRegistration user) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final isSuccess = await registrationRepository.registerUser(user);
      if (!isSuccess) {
        _errorMessage = "Registration failed. Please try again.";
      }
      return isSuccess;
    } catch (e) {
      _errorMessage = "An error occurred: $e";
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
