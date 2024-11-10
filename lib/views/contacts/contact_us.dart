import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/views/contacts/about_us.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final messageController = TextEditingController();

  void _toAboutPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AboutUs()));
  }

  Future<void> _submitContactForm(BuildContext context) async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final address = addressController.text.trim();
    final message = messageController.text.trim();

    // Validation
    if (fullName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        address.isEmpty ||
        message.isEmpty) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    const url = '$baseUrl/home/api/contact-us/';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'fullname': fullName,
          'email': email,
          'phone': phone,
          'address': address,
          'message_title': 'Contact Us', // Or set dynamically if needed
          'message': message,
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Handle success
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')));
      } else {
        // Handle error response
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to send message.')));
      }
    } catch (error) {
      // Handle exception
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('An error occurred.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            // Full Name Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Full Name",
                  // style: GoogleFonts.poppins(color: darkBlue),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: fullNameController,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      hintText: "John Doe",
                      // hintStyle: GoogleFonts.poppins(color: mediumGray),
                      focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: mediumGray),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Email Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Email",
                  // style: GoogleFonts.poppins(color: darkBlue),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      hintText: "name@mail.com",
                      // hintStyle: GoogleFonts.poppins(color: mediumGray),
                      focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: mediumGray),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Phone Number Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Phone Number",
                  // style: GoogleFonts.poppins(color: darkBlue),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: phoneController,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      hintText: "Your Phone Number",
                      // hintStyle: GoogleFonts.poppins(color: mediumGray),
                      focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: mediumGray),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Address Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Address",
                  // style: GoogleFonts.poppins(color: darkBlue),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: addressController,
                    style: GoogleFonts.poppins(),
                    decoration: const InputDecoration(
                      hintText: "Your Address",
                      // hintStyle: GoogleFonts.poppins(color: mediumGray),
                      focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: mediumGray),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Message Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Message",
                  // style: GoogleFonts.poppins(color: darkBlue),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 300,
                  child: TextField(
                    controller: messageController,
                    style: GoogleFonts.poppins(),
                    maxLines: 10,
                    maxLength: 500,
                    decoration: const InputDecoration(
                      hintText: "Leave your message here",
                      // hintStyle: GoogleFonts.poppins(color: mediumGray),
                      focusedBorder: OutlineInputBorder(
                          // borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                      border: OutlineInputBorder(
                          // borderSide: BorderSide(color: mediumGray),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Submit Button
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
                onPressed: () => _submitContactForm(context),
                child: Text(
                  "Send Message",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // About Us Link
            GestureDetector(
              onTap: () => _toAboutPage(context),
              child: Text(
                "See all about us",
                style: GoogleFonts.poppins(
                  // color: primaryBlue,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
