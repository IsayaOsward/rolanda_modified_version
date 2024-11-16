// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/providers/fetch_booking_provider.dart';

import '../../model/reservation_model.dart';
import '../../repository/invoice_repository.dart';
import 'invoice.dart';

class ReservationScreen extends StatefulWidget {
  final String? token;

  const ReservationScreen({super.key, this.token});

  @override
  ReservationScreenState createState() => ReservationScreenState();
}

class ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReservationProvider>(context, listen: false)
          .fetchReservations(widget.token);
    });
  }

  final InvoiceController controller = InvoiceController();

  Future<void> navigateToInvoice(BuildContext context, String bookingId) async {
    final result = await controller.fetchInvoice(bookingId);

    if (result['success']) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Invoice(htmlContent: result['data']),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(result['message']),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReservationProvider>(context);

    return DefaultTabController(
      length: 2, // Two tabs: Paid and Unpaid
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Reservations'),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Paid Rooms'),
              Tab(text: 'Unpaid Rooms'),
            ],
          ),
        ),
        body: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : provider.errorMessage != null
                ? Center(child: Text(provider.errorMessage!))
                : provider.reservations.isEmpty
                    ? const Center(child: Text('No reservations found.'))
                    : TabBarView(
                        children: [
                          // Paid Rooms Tab
                          buildReservationsList(
                            provider.reservations
                                .where((res) =>
                                    res.paymentStatus.toLowerCase() == 'paid')
                                .toList(),
                            context,
                          ),
                          // Unpaid Rooms Tab
                          buildReservationsList(
                            provider.reservations
                                .where((res) =>
                                    res.paymentStatus.toLowerCase() != 'paid')
                                .toList(),
                            context,
                          ),
                        ],
                      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.fetchReservations(widget.token);
          },
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildReservationsList(
      List<Reservation> reservations, BuildContext context) {
    return reservations.isEmpty
        ? const Center(child: Text('No reservations found.'))
        : ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final reservation = reservations[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: ListTile(
                  isThreeLine: true,
                  onTap: () async {
                    await navigateToInvoice(context, reservation.bookingId);
                  },
                  title: Text(
                    reservation.fullName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Status: ${reservation.paymentStatus}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Room No: ${reservation.room}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text(
                    "Booking ID: ${reservation.bookingId}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
  }
}
