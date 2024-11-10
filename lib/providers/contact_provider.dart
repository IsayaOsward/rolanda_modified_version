// providers/contact_provider.dart
import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/model/contact_model.dart';
import 'package:rolanda_modified_version/repository/contact_repository.dart';

class ContactProvider with ChangeNotifier {
  final ContactRepository contactRepository;
  bool isLoading = false;

  ContactProvider({required this.contactRepository});

  Future<void> submitContactForm(
      ContactModel contact, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final isSuccess = await contactRepository.sendMessage(contact);
    isLoading = false;
    notifyListeners();

    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send message.')));
    }
  }
}
