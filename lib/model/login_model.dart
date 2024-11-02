// models/login_model.dart

class LoginModel {
  final String success;
  final String username;
  final String email;
  final String refreshToken;
  final String accessToken;

  LoginModel({
    required this.success,
    required this.username,
    required this.email,
    required this.refreshToken,
    required this.accessToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      refreshToken: json['refresh'] as String,
      accessToken: json['access'] as String,
    );
  }
}
