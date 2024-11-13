import 'package:intl/intl.dart';

String convertToYyyyMmDd(String date) {
  try {
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('yyyy-MM-dd').format(parsedDate);
  } catch (e) {
    return '';
  }
}