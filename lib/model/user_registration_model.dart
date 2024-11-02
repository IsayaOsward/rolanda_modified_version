class UserRegistration {
  String firstName;
  String lastName;
  String email;
  String nationality;
  String phoneNumber;
  String location;
  String password;
  String confirmPassword;

  UserRegistration({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nationality,
    required this.phoneNumber,
    required this.location,
    required this.password,
    required this.confirmPassword,
  });

  // Convert a UserRegistration object to a Map (for JSON encoding)
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'nationality': nationality,
      'phoneNumber': phoneNumber,
      'location': location,
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
      nationality: json['nationality'],
      phoneNumber: json['phoneNumber'],
      location: json['location'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
