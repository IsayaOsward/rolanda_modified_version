import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/model/reservation_model.dart';
import 'package:rolanda_modified_version/repository/fetch_booking_repository.dart';

class ReservationProvider extends ChangeNotifier {
  final ReservationRepository repository;
  List<Reservation> _reservations = [];
  bool _isLoading = false;
  String? _errorMessage;

  ReservationProvider({required this.repository});

  List<Reservation> get reservations => _reservations;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchReservations(String? token) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _reservations = await repository.getReservations(token);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}