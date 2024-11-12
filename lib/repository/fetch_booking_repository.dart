import 'package:rolanda_modified_version/model/reservation_model.dart';
import 'package:rolanda_modified_version/services/fetch_booking_service.dart';

class ReservationRepository {
  final ReservationService service;

  ReservationRepository(this.service);

  Future<List<Reservation>> getReservations(String? token) {
    return service.fetchReservations(token);
  }
}