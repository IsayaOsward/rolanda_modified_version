import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/model/checkout_response_model.dart';
import 'package:rolanda_modified_version/services/booking_payments_service.dart';
import 'package:dio/dio.dart';

import '../utils/storage_service.dart';

class BookingPaymentsServiceImpl implements BookingPaymentsService {
  final storageService = StorageService();
  @override
  Future<bool> bookingPayments(BookingResponse bookingResponse) async {
    final dio = Dio();
    final url = "$baseUrl/api/success/${bookingResponse.bookingId}/";
    String? token = await storageService.getUserToken();
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final body = {
      "success_id": bookingResponse.successId,
      "booking_total": bookingResponse.total
    };

    try {
      Response response = await dio.request(
        url,
        data: body,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
