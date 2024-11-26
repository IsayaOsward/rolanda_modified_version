// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/providers/login_provider.dart';
import 'package:rolanda_modified_version/reusable_widgets/custom_button.dart';
import 'package:rolanda_modified_version/reusable_widgets/header.dart';
import 'package:rolanda_modified_version/reusable_widgets/textfield_widget.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<LoginProvider>(context);
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
                  subtitle: "Welcome Again, Login to continue",
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: usernameController,
                        label: "Email address",
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Colors.lightBlue),
                        validator: (value) {
                          return Validator.validateEmail(value, context);
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
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
                          return Validator.validateLoginPassword(
                              value, context);
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password action
                          },
                          child: const Text("Forgot password"),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CustomButton(
                        text: "Login",
                        isLoading: authProvider.isLoading,
                        onPressed: authProvider.isLoading
                            ? () {}
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  final provider = Provider.of<LoginProvider>(
                                      context,
                                      listen: false);
                                  await provider.login(
                                    usernameController.text,
                                    passwordController.text,
                                  );

                                  if (provider.errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          provider.errorMessage!,
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.homepage);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          "Login successful!",
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an Account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.register);
                            },
                            child: const Text("Sign Up"),
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
