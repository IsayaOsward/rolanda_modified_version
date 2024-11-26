import 'package:rolanda_modified_version/model/checkout_response_model.dart';

import '../services/booking_payments_service.dart';

class BookingPaymentsRepository {
  final BookingPaymentsService bookingPaymentsService;

  BookingPaymentsRepository({required this.bookingPaymentsService});
  Future<bool> bookingPaymentsRepository(BookingResponse bookingResponse)
  {
    return bookingPaymentsService.bookingPayments(bookingResponse);
  }
}