import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerHelper {
  void showDatePickerDialog({
    required BuildContext context,
    required TextEditingController dateController,
    required DateTime? initialDate,
    required DateTime? selectedDate,
    required bool isCheckInDate,
    required ValueChanged<DateTime> onDateSelected,
    required String dateFormat,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      if (isCheckInDate) {
        // Update the check-in date
        onDateSelected(pickedDate);
        dateController.text = DateFormat(dateFormat).format(pickedDate);
      } else {
        // Ensure check-out date is after check-in date
        if (selectedDate != null && pickedDate.isBefore(selectedDate)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Check-out date must be after check-in date')),
          );
        } else {
          // Update the check-out date
          onDateSelected(pickedDate);
          dateController.text = DateFormat(dateFormat).format(pickedDate);
        }
      }
    }
  }
}
