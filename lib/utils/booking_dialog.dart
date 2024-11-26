// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'package:rolanda_modified_version/providers/check_availability_provider.dart';
import 'package:rolanda_modified_version/views/screens/availability_results.dart';

class BookingDialog extends StatefulWidget {
  final dynamic hotel;
  const BookingDialog({super.key, required this.hotel});

  @override
  _BookingDialogState createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  final TextEditingController _adultsController = TextEditingController();
  final TextEditingController _childrenController = TextEditingController();

  bool _hasChildren = false;
  String _selectedCategory = "";
  Set<String> categories = {};

  final FocusNode _checkInFocusNode = FocusNode();
  final FocusNode _checkOutFocusNode = FocusNode();

  @override
  void dispose() {
    _checkInFocusNode.dispose();
    _checkOutFocusNode.dispose();
    super.dispose();
  }

  bool _isValid() {
    final numberOfAdults = int.tryParse(_adultsController.text) ?? 0;
    final numberOfChildren = int.tryParse(_childrenController.text) ?? 0;

    if (_selectedCategory == "" ||
        numberOfAdults < 1 ||
        numberOfAdults > 3 ||
        numberOfChildren < 0 ||
        numberOfChildren > 4) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    _selectedCategory = (widget.hotel.roomTypes[0].slug);
    super.initState();
  }

  DateTime _checkInDate = DateTime.now();
  DateTime _checkOutDate = DateTime.now().add(const Duration(days: 1));
  @override
  Widget build(BuildContext context) {
    final checkAvailabilityProvider =
        Provider.of<CheckAvailabilityProvider>(context);
    for (var i = 0; i < widget.hotel.roomTypes.length; i++) {
      categories.add(widget.hotel.roomTypes[i].slug);
    }
    categories.toList();

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(
        children: [
          Container(
            width: 500,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Booking Form',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                const SizedBox(height: 16),

                // Category Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: customSwatch))),
                  hint: const Text('Select Category'),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Check-in Date Picker
                GestureDetector(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _checkInDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _checkInDate = pickedDate;
                        if (_checkOutDate.isBefore(pickedDate)) {
                          _checkOutDate =
                              pickedDate.add(const Duration(days: 1));
                        }
                        _checkInController.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _checkInController,
                      decoration:
                          const InputDecoration(labelText: 'Check-In Date'),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                GestureDetector(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _checkOutDate,
                      firstDate: _checkInDate,
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _checkOutDate = pickedDate;
                        _checkOutController.text =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _checkOutController,
                      decoration:
                          const InputDecoration(labelText: 'Check-Out Date'),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Number of Adults
                TextField(
                  controller: _adultsController,
                  decoration:
                      const InputDecoration(labelText: 'Number of Adults'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),

                const SizedBox(height: 16),

                // Have Children? Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Do you have children?'),
                    Switch(
                      value: _hasChildren,
                      onChanged: (value) {
                        setState(() {
                          _hasChildren = value;
                          if (!value) {
                            _childrenController.text = '0';
                          }
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Number of Children (if they have children)
                if (_hasChildren)
                  TextField(
                    controller: _childrenController,
                    decoration:
                        const InputDecoration(labelText: 'Number of Children'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),

                const SizedBox(height: 16),

                // Submit and Cancel Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (_isValid()) {
                          try {
                            await checkAvailabilityProvider.checkAvailability(
                              hotelId: widget.hotel.id,
                              roomType: _selectedCategory,
                              checkInDate: _checkInDate,
                              checkOutDate: _checkOutDate,
                              numberOfAdults:
                                  int.tryParse(_adultsController.text) ?? 1,
                              numberOfChildren:
                                  int.tryParse(_childrenController.text) ?? 0,
                            );
                            if (checkAvailabilityProvider
                                .bookingResponse!.isNotEmpty) {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AvailabilityResults(
                                    resultData: checkAvailabilityProvider
                                        .bookingResponse,
                                    hotelData: widget.hotel,
                                    adult:
                                        int.tryParse(_adultsController.text) ??
                                            1,
                                    children: int.tryParse(
                                            _childrenController.text) ??
                                        0,
                                  ),
                                ),
                              );
                            } else if (checkAvailabilityProvider.error !=
                                null) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Error'),
                                  content:
                                      Text(checkAvailabilityProvider.error!),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          } catch (error) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    "Internal server error has occurred"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        } else {
                          // Show an error message if validation fails
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Invalid Input'),
                              content: const Text(
                                  'Please ensure all fields are correctly filled.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Check Availability'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Loading Indicator Overlay
          Consumer<CheckAvailabilityProvider>(
            builder: (context, provider, child) {
              return provider.isLoading
                  ? Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
