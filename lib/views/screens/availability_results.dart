import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/hotel_data_extractor_helper.dart';

class AvailabilityResults extends StatelessWidget {
  final dynamic resultData;
  final int adult, children;
  final dynamic hotelData;

  const AvailabilityResults(
      {super.key,
      required this.resultData,
      required this.hotelData,
      required this.adult,
      required this.children});

  @override
  Widget build(BuildContext context) {
    String hotel = resultData['hotel'] ?? 'Unknown Hotel';
    // int roomId = resultData['id'] ?? 1;
    String roomType = resultData['room_type'] ?? 'Unknown Room Type';
    String checkin = resultData['checkin'] ?? 'No Check-in Date';
    String checkout = resultData['checkout'] ?? 'No Checkout Date';
    List rooms = resultData['rooms'] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text('Available Rooms'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display hotel, room type, check-in, and check-out
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
                  var newData =
                      HotelDataExtractorHelper(roomTypes: hotelData.roomTypes)
                          .getRoomDetailsById(room['id']);
                  //
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 0,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide.none,
                        ),
                        child: ListTile(
                          onTap: () {
                            
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Room Number: ${room['room_number']}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'RID: ${room['rid']}',
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Available: ${room['is_available'] ? 'Yes' : 'No'}'),
                              Text(
                                  'Price: \$${newData!['price'] ?? 'N/A'}'), // Display price
                              Text(
                                  'Number of Beds: ${newData['numberOfBeds'] ?? 'N/A'}'), // Display number of beds
                            ],
                          ),
                          // trailing: Text(
                          //   'RID: ${room['rid']}',
                          //   style: TextStyle(color: Colors.grey),
                          // ),
                        ),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
