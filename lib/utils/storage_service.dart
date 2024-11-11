import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  // Initialize FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Method to save user data
  Future<void> saveUserData({
    required String username,
    required String email,
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: 'username', value: username);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'access', value: accessToken);
    await _storage.write(key: 'refresh', value: refreshToken);
  }

  // Method to retrieve user data
  Future<Map<String, String?>> getUserData() async {
    String? username = await _storage.read(key: 'username');
    String? email = await _storage.read(key: 'email');
    String? accessToken = await _storage.read(key: 'access');
    String? refreshToken = await _storage.read(key: 'refresh');

    return {
      'username': username,
      'email': email,
      'access': accessToken,
      'refresh': refreshToken,
    };
  }

  // Method to clear user data during log out
  Future<void> clearUserData() async {
    await _storage.deleteAll();
  }
}
