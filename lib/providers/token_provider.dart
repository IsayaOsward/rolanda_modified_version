import 'package:flutter/material.dart';

import '../utils/storage_service.dart';

class TokenProvider with ChangeNotifier {
  final StorageService storageService = StorageService();
  bool? _isTokenExpired;

  bool? get isTokenExpired => _isTokenExpired;

  TokenProvider() {
    checkTokenStatus();
  }

  Future<void> checkTokenStatus() async {
    _isTokenExpired = await storageService.isTokenExpired();
    notifyListeners(); // Notify consumers when the status changes
  }
}
