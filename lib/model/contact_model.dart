// models/contact.dart
class ContactModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final String message;

  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.address,
    required this.message,
  });

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'message_title': 'User Inquiries',
      'message_body': message,
    };
  }
}
