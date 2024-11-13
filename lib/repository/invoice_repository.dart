import 'package:http/http.dart' as http;

import '../config/base_url.dart';

class InvoiceController {
    // Method to fetch invoice by booking ID
  Future<Map<String, dynamic>> fetchInvoice(String bookingId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/invoice/$bookingId/'));

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': response.body,
        };
      } else {
        return {
          'success': false,
          'message': 'Unable to fetch your invoice',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred. Please try again.',
      };
    }
  }
}
