// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/providers/registration_provider.dart';
import 'package:rolanda_modified_version/reusable_widgets/custom_button.dart';
import 'package:rolanda_modified_version/reusable_widgets/header.dart';
import 'package:rolanda_modified_version/reusable_widgets/textfield_widget.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';

import '../../model/user_registration_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: MediaQuery.of(context).size.height * 0.15,
            ),
            child: Column(
              children: [
                const HeaderText(
                  title: "Rolanda",
                  subtitle:
                      "Create an account\nFill your details below to get you started",
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: firstnameController,
                        label: "First name",
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.lightBlue),
                        validator: (value) {
                          return Validator.validateName(value, context);
                        },
                      ),
                      SizedBox(height: Dimensions.height20),
                      CustomTextFormField(
                        controller: lastnameController,
                        label: "Last name",
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.lightBlue),
                        validator: (value) {
                          return Validator.validateName(value, context);
                        },
                      ),
                      SizedBox(height: Dimensions.height20),
                      CustomTextFormField(
                        controller: emailController,
                        label: "Email address",
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.lightBlue),
                        validator: (value) {
                          return Validator.validateEmail(value, context);
                        },
                      ),
                      SizedBox(height: Dimensions.height20),
                      CustomTextFormField(
                        controller: phoneNumberController,
                        label: "Phone number",
                        prefixIcon:
                            const Icon(Icons.phone, color: Colors.lightBlue),
                        validator: (value) {
                          return Validator.validateNumber(value, context);
                        },
                      ),
                      SizedBox(height: Dimensions.height20),
                      CustomTextFormField(
                        controller: passwordController,
                        label: "Password",
                        obscureText: isVisible,
                        prefixIcon: const Icon(Icons.lock_outline_rounded,
                            color: Colors.lightBlue),
                        suffixIcon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.lightBlue,
                        ),
                        suffixIconOnPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        validator: (value) {
                          return Validator.validateRegisterPassword(
                              value, context);
                        },
                      ),
                      SizedBox(height: Dimensions.height20),
                      CustomTextFormField(
                        controller: confirmPasswordController,
                        label: "Confirm password",
                        obscureText: isVisible,
                        prefixIcon: const Icon(Icons.lock_outline_rounded,
                            color: Colors.lightBlue),
                        suffixIcon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.lightBlue,
                        ),
                        suffixIconOnPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        validator: (value) {
                          return Validator.validateConfirmPassword(
                              passwordController.text, value, context);
                        },
                      ),
                      SizedBox(height: Dimensions.height20),
                      CustomButton(
                        text: "Register",
                        isLoading: authProvider.isLoading,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final registrationProvider =
                                Provider.of<RegistrationProvider>(context,
                                    listen: false);

                            final user = UserRegistration(
                              firstName: firstnameController.text,
                              lastName: lastnameController.text,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            );

                            final isSuccess =
                                await registrationProvider.registerUser(user);

                            if (isSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Registered Successfully!")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        registrationProvider.errorMessage ??
                                            "Registration failed")),
                              );
                            }
                          }
                        },
                      ),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.login);
                            },
                            child: const Text("Sign in"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
