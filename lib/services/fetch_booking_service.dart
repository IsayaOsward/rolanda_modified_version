import 'package:rolanda_modified_version/model/reservation_model.dart';

abstract class ReservationService {
  Future<List<Reservation>> fetchReservations(String? token);
}
