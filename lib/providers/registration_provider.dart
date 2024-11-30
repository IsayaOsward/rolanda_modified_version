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

  Future<int> registerUser(UserRegistration user) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await registrationRepository.registerUser(user);
      if (response !=201 ) {
        _errorMessage = "Registration failed. Please try again.";
      }
      return response;
    } catch (e) {
      _errorMessage = "An internal error occurred";
      return 500;
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
