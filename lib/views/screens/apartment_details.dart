import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/utils/booking_dialog.dart';
import 'package:rolanda_modified_version/utils/constants/colors.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/image_assets.dart';

class ApartmentDetails extends StatefulWidget {
  final dynamic hotels;
  final String imageUrl;

  const ApartmentDetails(
      {super.key, required this.hotels, required this.imageUrl});

  @override
  State<ApartmentDetails> createState() => _ApartmentDetailsState();
}

class _ApartmentDetailsState extends State<ApartmentDetails> {
  final List _aminities = [
    {'icon': FontAwesomeIcons.waterLadder, 'name': 'Swimming pool'},
    {'icon': FontAwesomeIcons.shower, 'name': 'Shower'},
    {'icon': FontAwesomeIcons.sprayCanSparkles, 'name': 'AC'},
    {'icon': FontAwesomeIcons.wifi, 'name': 'Wifi'},
    {'icon': FontAwesomeIcons.shield, 'name': 'Security'},
    {'icon': FontAwesomeIcons.waterLadder, 'name': 'Gym'},
    {'icon': FontAwesomeIcons.waterLadder, 'name': 'Heater'},
    {'icon': FontAwesomeIcons.waterLadder, 'name': 'Elevator'},
    {'icon': FontAwesomeIcons.waterLadder, 'name': 'Swimming'}
  ];

  final TextEditingController dateControllerCheckIn = TextEditingController();
  final TextEditingController dateControllerCheckOut = TextEditingController();
  final TextEditingController adultController = TextEditingController();
  final TextEditingController childrenController = TextEditingController();

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BookingDialog(hotel: widget.hotels);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // CommonActions.shiftPage(context, const ImagesViewPage());
            },
            child: AbsorbPointer(
              child: Container(
                height: screenSize.height * 0.35,
                decoration: BoxDecoration(
                  color: AppColor.paleGreyColor,
                  image: DecorationImage(
                      image: NetworkImage('$baseUrl${widget.imageUrl}'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              // controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      // CommonActions.shiftPage(
                      //     context, const ImagesViewPage());
                    },
                    child: AbsorbPointer(
                      child: Container(
                        margin: EdgeInsets.only(top: screenSize.height * 0.27),
                        height: 10,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width25),
                    decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        boxShadow: [BoxShadow(blurRadius: 1)],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            "DETAILS",
                            // style: textTheme.bodyLarge!.merge(baseTxtStyle),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.hotels.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                // style:
                                //     textTheme.titleLarge!.merge(baseTxtStyle),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              ListTile(
                                minVerticalPadding: 0,
                                //dense: true,
                                visualDensity: const VisualDensity(
                                    horizontal: -3, vertical: -4),
                                contentPadding: const EdgeInsets.all(0),
                                title: Text(widget.hotels.address),
                                subtitle: const RatingBar.readOnly(
                                  filledIcon: Icons.star,
                                  size: 20,
                                  emptyIcon: Icons.star_border,
                                  initialRating: 4,
                                  maxRating: 5,
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      // CommonActions.shiftPage(
                                      //     context, const HotelMapviewPage());
                                    },
                                    icon: const Icon(
                                      Icons.location_on,
                                      size: 35,
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Amenities ",
                              // style: baseTxtStyle.copyWith(fontSize: 22),
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            GridView.builder(
                                controller: ScrollController(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisExtent: 50,
                                        mainAxisSpacing: 2,
                                        crossAxisSpacing: 2),
                                itemCount: _aminities.length,
                                itemBuilder: (context, index) {
                                  var amenity = _aminities[index];
                                  return Container(
                                    color: AppColor.greyWhite,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FaIcon(amenity['icon']),
                                        Text(
                                          amenity['name'],
                                          overflow: TextOverflow.ellipsis,
                                          // style: baseTxtStyle,
                                        ),
                                      ],
                                    ),
                                  );
                                })
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              // style: baseTxtStyle.copyWith(fontSize: 22),
                            ),
                            HtmlWidget(
                              widget.hotels.description,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        SizedBox(
                          height:
                              100, // Set the desired height for gallery images
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.hotels.gallery.length,
                            itemBuilder: (context, galleryIndex) {
                              final galleryImage =
                                  widget.hotels.gallery[galleryIndex];
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    '$baseUrl/${galleryImage.imageUrl}', // Accessing each gallery image URL
                                    fit: BoxFit.cover,
                                    width:
                                        200, // Set the width for each gallery image
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageAssets.bookmark,
                  height: Dimensions.height40,
                ),
              ),
              SizedBox(
                width: Dimensions.width300,
                child: ElevatedButton(
                  onPressed: () => _showBookingDialog(
                    context,
                  ),
                  child: const Text(
                    "Book now",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}