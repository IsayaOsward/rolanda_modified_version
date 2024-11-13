// views/reservation_screen.dart
// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/providers/fetch_booking_provider.dart';

import '../../repository/invoice_repository.dart';
import 'invoice.dart';

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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Reservations',
        ),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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

                          // DateTime parsedDate =
                          //     DateTime.parse(reservation.date);
                          // String formattedDate =
                          //     DateFormat('yyyy-MM-dd – hh:mm a')
                          //         .format(parsedDate);

                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: ListTile(
                              isThreeLine: true,
                              onTap: () async {
                                await navigateToInvoice(
                                    context, reservation.bookingId);
                              },
                              title: Text(
                                reservation.fullName,
                                overflow: TextOverflow
                                    .ellipsis,
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Status: ${reservation.paymentStatus}',
                                      overflow: TextOverflow
                                          .ellipsis, 
                                      style: const TextStyle(
                                          fontWeight: FontWeight
                                              .bold),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Room No: ${reservation.room}",
                                      overflow: TextOverflow
                                          .ellipsis, 
                                      style: TextStyle(
                                          color: Colors.grey
                                              .shade600), // Optional styling
                                    ),
                                  ),
                                
                                ],
                              ),
                              trailing: Text(
                                "Booking ID: ${reservation.bookingId}",
                                overflow: TextOverflow
                                    .ellipsis, 
                              ),
                            ),
                          );
                        },
                      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.fetchReservations(
            widget.token,
          );
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}
