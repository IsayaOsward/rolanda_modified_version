// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/providers/add_to_selection_provider.dart';
import 'package:rolanda_modified_version/providers/booking_provider.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/utils/calculates_nights_difference.dart';
import 'package:rolanda_modified_version/utils/date_converter.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';

class AvailabilityResults extends StatelessWidget {
  final dynamic resultData;
  final int adult, children;
  final dynamic hotelData;

  const AvailabilityResults({
    super.key,
    required this.resultData,
    required this.hotelData,
    required this.adult,
    required this.children,
  });

  Future<void> addToSelection(
    BuildContext context,
    int hotelID,
    String hotelName,
    double hotelPrice,
    int numberOfBeds,
    String checkInDate,
    String checkOutDate,
    String roomTypeId,
    int roomId,
    int adult,
    int children,
  ) async {
    final addToSelection =
        Provider.of<AddToSelectionProvider>(context, listen: false);
    final confirmBooking = Provider.of<BookingProvider>(context, listen: false);
    await addToSelection.addToSelection(
      hotelID,
      hotelName,
      hotelPrice,
      numberOfBeds,
      checkInDate,
      checkOutDate,
      roomTypeId,
      roomId,
      adult,
      children,
    );

    if (addToSelection.isSuccessful) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Booking Confirmation"),
            content: Text(
              "Your room has been successfully added to the selection. The total cost for this booking is ${hotelPrice * calculateNightDifference(
                    checkInDate,
                    checkOutDate,
                  )}",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
              TextButton(
                onPressed: () async {
                  bool response = await confirmBooking.confirmBooking(
                      hotelID,
                      convertToYyyyMmDd(checkInDate),
                      convertToYyyyMmDd(checkOutDate),
                      adult,
                      children,
                      resultData['room_type'],
                      roomId);
                  if (response) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "Booking placed successful!",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.homepage,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        content: Text(
                          "Sorry, failed to place your booking!",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onError,
                          ),
                        ),
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
                child: const Text("Confirm Booking"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // final texts = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        surfaceTintColor: colors.surface,
        title: const Text('Available Rooms'),
      ),
      body: Consumer<AddToSelectionProvider>(
        builder: (context, provider, child) {
          return Stack(
            children: [
              buildContent(context),
              if (provider.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    String hotel = resultData['hotel'] ?? 'Unknown Hotel';
    String roomType = resultData['room_type'] ?? 'Unknown Room Type';
    String checkin = resultData['checkin'] ?? 'No Check-in Date';
    String checkout = resultData['checkout'] ?? 'No Checkout Date';
    List rooms = resultData['rooms'] ?? [];

    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hotel: $hotel',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Room Type: $roomType',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Check-in: $checkin',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Check-out: $checkout',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Expected Adults: $adult,',
                    style: const TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Text(
                    'Expected Children: $children',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Display the list of rooms
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                var room = rooms[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    elevation: 0,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    child: ListTile(
                      onTap: () async {
                        await addToSelection(
                            context,
                            hotelData.id,
                            hotel,
                            room['price'],
                            room['number_of_beds'],
                            checkin,
                            checkout,
                            resultData['room_type_id'],
                            room['id'],
                            adult,
                            children);
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Room Number: ${room['room_number']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'RID: ${room['rid']}',
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Available: ${room['is_available'] ? 'Yes' : 'No'}'),
                          Text('Price: \$${room['price'] ?? 'N/A'}'),
                          Text(
                              'Number of Beds: ${room['number_of_beds'] ?? 'N/A'}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
