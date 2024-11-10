import 'package:intl/intl.dart';

int calculateNightDifference(String checkInDate, String checkOutDate) {
  // Define the format of your date strings
  DateFormat format = DateFormat("dd/MM/yyyy");

  // Convert the string dates to DateTime objects
  DateTime checkIn = format.parse(checkInDate);
  DateTime checkOut = format.parse(checkOutDate);

  // Calculate the difference
  Duration difference = checkOut.difference(checkIn);

  // Return the difference in days, but if it's zero, return 1 (to account for the same date)
  return difference.inDays == 0 ? 1 : difference.inDays;
}
