import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  // Initialize FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Method to save user data with expiration time
  Future<void> saveUserData({
    required String username,
    required String email,
    required String accessToken,
    required String refreshToken,
  }) async {
    final DateTime expTime = DateTime.now().add(const Duration(minutes: 55));
    final String expTimeString = expTime.toIso8601String();

    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'access', value: accessToken);
    await _storage.write(key: 'refresh', value: refreshToken);
    await _storage.write(key: 'expTime', value: expTimeString);
  }

  // Method to check if token has expired
  Future<bool> isTokenExpired() async {
    String? expTimeString = await _storage.read(key: 'expTime');
    if (expTimeString == null) return true;

    final DateTime expTime = DateTime.parse(expTimeString);
    return DateTime.now().isAfter(expTime);
  }

  // method to get user access token
  Future<String?> getUserToken() async {
    return await _storage.read(key: 'access');
  }

  // Method to clear user data during log out
  Future<void> clearUserData() async {
    await _storage.deleteAll();
  }
}
