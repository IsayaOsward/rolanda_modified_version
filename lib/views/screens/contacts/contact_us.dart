// ui/contact_us.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolanda_modified_version/model/contact_model.dart';
import 'package:rolanda_modified_version/providers/contact_provider.dart';

class ContactUs extends StatelessWidget {
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final messageController = TextEditingController();

  void _submitForm(BuildContext context) {
    final contact = ContactModel(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      message: messageController.text.trim(),
    );

    Provider.of<ContactProvider>(context, listen: false)
        .submitContactForm(contact, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 66),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "Contact us now",
                  style: GoogleFonts.poppins(
                    // color: darkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // First Name Field
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                // Last Name Field
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                ),
                // Email, Phone, Address, and Message Fields
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                TextField(
                  controller: messageController,
                  decoration: InputDecoration(labelText: 'Message'),
                ),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  onPressed:
                      provider.isLoading ? null : () => _submitForm(context),
                  child: provider.isLoading
                      ? CircularProgressIndicator()
                      : Text("Send Message"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
