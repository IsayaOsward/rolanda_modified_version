import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolanda_modified_version/config/base_url.dart';
import 'package:rolanda_modified_version/providers/hotels_provider.dart';
import 'package:rolanda_modified_version/utils/constants/colors.dart';
import 'package:rolanda_modified_version/utils/dimensions.dart';
import 'package:rolanda_modified_version/utils/image_assets.dart';
import 'package:rolanda_modified_version/utils/inputs_validation.dart';
import 'package:rolanda_modified_version/views/screens/apartment_details.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

class GuestHomePages extends StatefulWidget {
  const GuestHomePages({super.key});

  @override
  State<GuestHomePages> createState() => _GuestHomePagesState();
}

class _GuestHomePagesState extends State<GuestHomePages> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce; // Timer for debouncing
  final _scrollController = ScrollController();
  final List<String> _categories = [
    "All",
    "Hotel",
    "Lodge",
    "Guest",
    "Apartment",
  ];
  int _currentCategory = 0;
  @override
  void initState() {
    super.initState();
    _fetchAllResults();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    // Start a new debounce timer
    _debounce = Timer(const Duration(seconds: 1), () {
      if (query.isEmpty) {
        // If the search query is empty, fetch all results
        _fetchAllResults(); // Fetch all hotels
      } else {
        _performSearch(query); // Call the search function with category
      }
    });
  }

// Function to perform the actual search with category
  void _performSearch(String query) {
    final provider = Provider.of<HotelsProvider>(context, listen: false);
    String selectedCategory =
        _categories[_currentCategory]; // Get the current category
    provider.fetchHotels(
        searchQuery: query,
        category: selectedCategory); // Call with both parameters
  }

// Function to fetch all results
  void _fetchAllResults() {
    final provider = Provider.of<HotelsProvider>(context, listen: false);
    provider.fetchHotels(); // Fetch all hotels (without search filter)
  }

  void _fetchFilteredResults() {
    final provider = Provider.of<HotelsProvider>(context, listen: false);
    provider.fetchHotels(
      searchQuery: _searchController.text,
      category: _categories[_currentCategory], // Pass the selected category
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text("Rolanda"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(ImageAssets.notification),
          ),
        ],
      ),
      body: Consumer<HotelsProvider>(builder: (context, provider, child) {
        return ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width27),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Discover your",
                    ),
                    const Text(
                      "perfect place to stay",
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    FormField<String>(
                      validator: (value) => Validator.validateName(
                        _searchController.text,
                        context,
                      ),
                      builder: (formFieldState) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            TextFormField(
                              controller: _searchController,
                              textInputAction: TextInputAction.search,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: "Search hotel ...",
                                filled: true,
                                fillColor: AppColor.greyInputFill,
                                prefixIcon: Image.asset(ImageAssets.searchIcon),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: Dimensions.radius20,
                                    backgroundColor: AppColor.whiteColor,
                                    child: Image.asset(ImageAssets.filterAsset),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 + Dimensions.radius10,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: AppColor.paleGreyColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 + Dimensions.radius10,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppColor.redColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 + Dimensions.radius10,
                                  ),
                                ),
                                errorText: formFieldState
                                    .errorText, // Automatically displays error
                              ),
                              // Call validate() on submit to trigger the validator method
                              onFieldSubmitted: (value) {
                                if (formFieldState.validate()) {
                                  // If input is valid, proceed with search
                                  // performSearch(_searchController.text);
                                }
                              },
                            ),
                            Positioned(
                              right: 20, // Adjust position based on your layout
                              child: DropdownButton<String>(
                                padding: const EdgeInsets.all(0),
                                // dropdownColor: Colors.white,
                                // value: _categories[_currentCategory],
                                icon: const Icon(
                                  Icons.filter_list_outlined,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      _currentCategory = _categories.indexOf(
                                        newValue!,
                                      );
                                      _fetchFilteredResults();
                                    },
                                  );
                                },
                                items:
                                    _categories.map<DropdownMenuItem<String>>(
                                  (String category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(
                                        category,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SizedBox(
                      height: Dimensions.height40,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    _currentCategory =
                                        index; // Update current category
                                    // Fetch hotels with the selected category and current search query
                                    _fetchFilteredResults();
                                  },
                                );
                              },
                              child: AnimatedContainer(
                                constraints: BoxConstraints(
                                  minWidth: Dimensions.width180,
                                  maxWidth: Dimensions.width200,
                                ),
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width10),
                                decoration: BoxDecoration(
                                  color: index == _currentCategory
                                      ? AppColor.yellowColor
                                      : AppColor.paleGreyColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20 +
                                          Dimensions.radius10),
                                ),
                                child: Center(
                                  child: Text(
                                    _categories[index],
                                    style: TextStyle(
                                      color: index == _currentCategory
                                          ? AppColor.whiteColor
                                          : AppColor.blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: Dimensions.height15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nearby",
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          child: const Text(
                            "See all",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height5),
                    SizedBox(
                      height: 134,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: Dimensions.width400,
                              height: Dimensions.height180,
                              margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.width10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height5),
                    const Text("Others"),
                    SizedBox(height: Dimensions.height5),
                    if (provider.isLoading)
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (_, __) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10),
                                    child: Image.asset(
                                      ImageAssets.placeHolderImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Apply shimmer only on the container
                                Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: SizedBox(
                                      height: Dimensions.height60 *
                                          2, // Define a height for the Column here
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .start, // Apply mainAxisAlignment
                                        children: [
                                          Container(
                                            width: Dimensions.width400,
                                            height: Dimensions.height10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius10),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Container(
                                            width: Dimensions.width400,
                                            height: Dimensions.height10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius10),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Container(
                                            width: Dimensions.width325,
                                            height: Dimensions.height10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius10),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height45,
                                          ),
                                          Container(
                                            width: Dimensions.width180,
                                            height: Dimensions.height10,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: ListView.builder(
                            itemCount: provider.hotels.length,
                            itemBuilder: (context, index) {
                              String extractImageUrl(String thumbnailHtml) {
                                final RegExp regExp = RegExp(r'src="([^"]+)"');
                                final match = regExp.firstMatch(thumbnailHtml);
                                if (match != null) {
                                  return match.group(
                                      1)!; // Return the URL found in the 'src' attribute
                                }
                                return ''; // Return an empty string if no match is found
                              }

                              final hotel = provider.hotels[index];
                              final thumbnailUrl =
                                  extractImageUrl(hotel.thumbnail);
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ApartmentDetails(
                                        imageUrl: thumbnailUrl,
                                        hotels: hotel,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius10),
                                          child: Image.network(
                                            '$baseUrl/$thumbnailUrl',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width15,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: Dimensions.height60 *
                                              2, // Define a height for the Column here
                                          child: SingleChildScrollView(
                                            // Allow scrolling if content overflows
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                // Hotel Name
                                                Text(
                                                  hotel.name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle overflow for hotel name
                                                  maxLines:
                                                      2, // Limit to 1 line for hotel name
                                                ),
                                                SizedBox(
                                                    height:
                                                        Dimensions.height10),

                                                // Hotel Location
                                                Text(
                                                  hotel
                                                      .address, // Access the hotel address/location
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle overflow for address
                                                  maxLines:
                                                      2, // Allow 2 lines for address
                                                ),
                                                SizedBox(
                                                  height: Dimensions.height10,
                                                ),
                                                // Hotel Category
                                                Text(
                                                  hotel
                                                      .category, // Access the hotel category
                                                  style: const TextStyle(
                                                    color: Colors.orange,
                                                  ),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle overflow for category
                                                  maxLines:
                                                      1, // Limit to 1 line for category
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
