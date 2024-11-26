import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'package:rolanda_modified_version/model/contact_model.dart';
import 'package:rolanda_modified_version/providers/contact_provider.dart';
import 'package:rolanda_modified_version/reusable_widgets/textfield_widget.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';
import 'package:rolanda_modified_version/utils/views/contacts/about_us.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final emailController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void _toAboutPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutUs()),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    emailController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Contact us now",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: IconButton(
              onPressed: () {
                _toAboutPage(context);
              },
              icon: Icon(
                Icons.info,
                size: Dimensions.height20,
                color: customSwatch,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<ContactProvider>(builder: (context, provider, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: provider.isLoading
                    ? 0.5
                    : 1.0, // Dim the background if loading
                child: AbsorbPointer(
                  absorbing: provider.isLoading, // Disable inputs if loading
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    alignment: Alignment.topCenter,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            child: CustomTextFormField(
                              controller: firstNameController,
                              label: "First name",
                              prefixIcon: const Icon(Icons.person),
                              validator: (value) => Validator.validateName(
                                value,
                                context,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20),
                          SizedBox(
                            child: CustomTextFormField(
                              controller: lastNameController,
                              label: "Last name",
                              prefixIcon: const Icon(Icons.person),
                              validator: (value) => Validator.validateName(
                                value,
                                context,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20),
                          SizedBox(
                            child: CustomTextFormField(
                              controller: emailController,
                              label: "Email",
                              prefixIcon: const Icon(Icons.mail),
                              validator: (value) => Validator.validateEmail(
                                value,
                                context,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20),
                          SizedBox(
                            child: CustomTextFormField(
                              controller: phoneController,
                              label: "Phone number",
                              prefixIcon: const Icon(Icons.phone),
                              validator: (value) =>
                                  Validator.validatePhoneNumber(
                                value,
                                context,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20),
                          SizedBox(
                            child: CustomTextFormField(
                              controller: addressController,
                              label: "Address",
                              prefixIcon: const Icon(Icons.location_pin),
                              validator: (value) => Validator.validateAddress(
                                value,
                                context,
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height20),
                          SizedBox(
                            height: Dimensions.height280,
                            child: TextFormField(
                              controller: messageController,
                              style: GoogleFonts.poppins(),
                              maxLines: 8,
                              validator: (value) =>
                                  Validator.validateTextOrMessage(
                                      value, context),
                              maxLength: 500,
                              decoration: const InputDecoration(
                                hintText: "Leave your message here",
                                focusedBorder: OutlineInputBorder(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(
                                  customSwatch,
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.onSurface,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final contact = ContactModel(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    address: addressController.text,
                                    message: messageController.text,
                                  );
                                  bool success = await provider
                                      .submitContactForm(contact, context);
                                  if (success) {
                                    firstNameController.clear();
                                    lastNameController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    addressController.clear();
                                    messageController.clear();
                                  }
                                }
                              },
                              child: Text(
                                "Send Message",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (provider.isLoading)
                const Center(
                  child: CircularProgressIndicator(
                    color: customSwatch,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
