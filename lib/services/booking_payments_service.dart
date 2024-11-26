import '../model/checkout_response_model.dart';

abstract class BookingPaymentsService {
  Future<bool> bookingPayments(BookingResponse bookingResponse);
}
