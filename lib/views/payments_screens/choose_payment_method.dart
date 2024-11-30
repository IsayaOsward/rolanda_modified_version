import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/model/checkout_response_model.dart';
import 'package:rolanda_modified_version/providers/booking_payments_provider.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/image_assets.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';

class ChoosePaymentMethod extends StatefulWidget {
  final BookingResponse bookingResponse;
  const ChoosePaymentMethod({super.key, required this.bookingResponse});

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  // Payment options with categories
  final List<Map<String, dynamic>> payments = [
    {
      "value": "Airtel",
      "image": ImageAssets.airtel,
      "category": "Mobile Money"
    },
    {
      "value": "Halopesa",
      "image": ImageAssets.halopesa,
      "category": "Mobile Money"
    },
    {
      "value": "Tigopesa",
      "image": ImageAssets.tigopesa,
      "category": "Mobile Money"
    },
    {
      "value": "Vodacom",
      "image": ImageAssets.vodacom,
      "category": "Mobile Money"
    },
    {"value": "CRDB", "image": ImageAssets.crdb, "category": "Bank"},
    {"value": "NMB", "image": ImageAssets.nmb, "category": "Bank"},
  ];

  String? selectedCategory;
  String? selectedPayment;
  final TextEditingController inputController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Filter payments based on selected category
  List<Map<String, dynamic>> get filteredPayments {
    if (selectedCategory == null) return [];
    return payments
        .where((payment) => payment["category"] == selectedCategory)
        .toList();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<BookingPaymentsProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Payment Confirmation"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height200,
                  width: Dimensions.screenWidth,
                  child: Image.asset(
                    "assets/images/payment.gif",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Please choose your preferred payment method from the list below to complete your booking.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      DropdownButtonFormField<String>(
                        dropdownColor: Theme.of(context).colorScheme.surface,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a category";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodySmall,
                          labelText: "Select Category",
                        ),
                        value: selectedCategory,
                        items: ["Mobile Money", "Bank"]
                            .map((category) => DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value;
                            selectedPayment = null;
                            inputController.clear();
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      if (selectedCategory != null)
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            labelText: "Select Payment Method",
                          ),
                          value: selectedPayment,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please select a payment method";
                            }
                            return null;
                          },
                          items: filteredPayments
                              .map((payment) => DropdownMenuItem<String>(
                                    value: payment["value"],
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          payment["image"],
                                          height: Dimensions.height30,
                                          width: Dimensions.width30,
                                        ),
                                        SizedBox(width: Dimensions.width30),
                                        Text(
                                          payment["value"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedPayment = value;
                              inputController.clear();
                            });
                          },
                        ),
                      const SizedBox(height: 16.0),
                      if (selectedCategory == "Mobile Money" &&
                          selectedPayment != null)
                        TextFormField(
                          controller: inputController,
                          validator: (value) =>
                              Validator.validateInternationalPhoneNumber(
                                  value, context),
                          decoration: InputDecoration(
                            labelText: "$selectedPayment Mobile Number",
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            hintText: "Enter mobile number",
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      if (selectedCategory == "Bank" && selectedPayment != null)
                        TextFormField(
                          controller: inputController,
                          validator: (value) =>
                              Validator.validateBankAccountNumber(
                                  value, context),
                          decoration: InputDecoration(
                            labelText: "$selectedPayment Account Number",
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            hintText: "Enter account number",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        paymentProvider.setIsLoading(true); // Start loading
                        final result = await paymentProvider
                            .confirmPayments(widget.bookingResponse);
                        paymentProvider.setIsLoading(false); // Stop loading

                        if (result) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  "Payment completed successfully!",
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Failed to process payments!",
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please complete the form.")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
          if (paymentProvider.isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
