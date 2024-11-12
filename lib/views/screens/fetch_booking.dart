// views/reservation_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/providers/fetch_booking_provider.dart';

class ReservationScreen extends StatefulWidget {
  final String? token;

  const ReservationScreen({super.key, this.token});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger the fetchReservations method on screen initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReservationProvider>(context, listen: false)
          .fetchReservations(widget.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Reservations',
        ),
      ),
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : provider.errorMessage != null
                ? Text(
                    provider.errorMessage!,
                  )
                : provider.reservations.isEmpty
                    ? const Text(
                        'No reservations found.',
                      )
                    : ListView.builder(
                        itemCount: provider.reservations.length,
                        itemBuilder: (context, index) {
                          final reservation = provider.reservations[index];
                          return ListTile(
                            title: Text(
                              reservation.fullName,
                            ),
                            subtitle: Text(
                              'Status: ${reservation.paymentStatus}',
                            ),
                          );
                        },
                      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger data fetch manually on button press
          provider.fetchReservations(
            widget.token,
          );
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
