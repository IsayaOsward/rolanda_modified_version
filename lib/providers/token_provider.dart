import 'package:flutter/material.dart';

import '../utils/storage_service.dart';

class TokenProvider with ChangeNotifier {
  final StorageService storageService = StorageService();
  bool _isTokenExpired = true;
  bool _isCheckingToken = true;

  bool get isTokenExpired => _isTokenExpired;
  bool get isCheckingToken => _isCheckingToken;

  TokenProvider() {
    checkTokenStatus();
  }

  Future<void> checkTokenStatus() async {
    _isCheckingToken = true;
    notifyListeners();

    _isTokenExpired = await storageService.isTokenExpired();

    _isCheckingToken = false;
    notifyListeners();
  }

  // New method to refresh token status after login
  Future<void> refreshTokenStatus() async {
    await checkTokenStatus();  // Re-check token status
  }
}
