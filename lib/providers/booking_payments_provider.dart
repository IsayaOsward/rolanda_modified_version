import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/model/checkout_response_model.dart';
import 'package:rolanda_modified_version/repository/booking_payments_repository.dart';
import 'package:rolanda_modified_version/service_impl/booking_payments_service_impl.dart';

class BookingPaymentsProvider extends ChangeNotifier {
  bool isLoading = false;
  final bookingPaymentsRepository = BookingPaymentsRepository(
      bookingPaymentsService: BookingPaymentsServiceImpl());
  Future<bool> confirmPayments(BookingResponse bookingResponse) async {
    final result = await bookingPaymentsRepository
        .bookingPaymentsRepository(bookingResponse);
    if (result) {
      return true;
    } else {
      return false;
    }
  }

  void setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners(); // Notify listeners to rebuild UI
  }
}
