import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/contact_model.dart';
import 'package:rolanda_modified_version/providers/contact_provider.dart';
import 'package:rolanda_modified_version/reusable_widgets/textfield_widget.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<ContactProvider>(builder: (context, provider, child) {
        return Container(
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
                      child: CustomTextFormField(
                          controller: fullNameController,
                          label: "Full name",
                          prefixIcon: Icon(Icons.person),
                          validator: (value) =>
                              Validator.validateName(fullNameController.text, context,),),),
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
                  onPressed: () {
                    final contact = ContactModel(
                      firstName: fullNameController.text,
                      lastName: fullNameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                      message: messageController.text,
                    );

                    print(messageController.text);
                    provider.submitContactForm(contact, context);
                  },
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
        );
      }),
    );
  }
}
