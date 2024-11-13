class UserRegistration {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;

  UserRegistration({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  // Convert a UserRegistration object to a Map (for JSON encoding)
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  // Factory method to create a UserRegistration object from a Map (from JSON)
  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return UserRegistration(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
