import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/reusable_widgets/textfield_widget.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';

class PaymentConfirmation extends StatefulWidget {
  final String bookingId;
   const PaymentConfirmation({super.key, required this.bookingId});

  @override
  State<PaymentConfirmation> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailControleer = TextEditingController();
  final phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              controller: firstNameController,
              label: "First name",
              validator: (value) => Validator.validateName(value, context),
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: lastNameController,
              label: "Last name",
              validator: (value) => Validator.validateName(value, context),
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: emailControleer,
              label: "Email",
              validator: (value) => Validator.validateEmail(value, context),
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: phoneNumberController,
              label: "Phone number",
              validator: (value) =>
                  Validator.validateInternationalPhoneNumber(value, context),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: const Text(
                  "Submit",
                ))
          ],
        )),
      ),
    );
  }
}
