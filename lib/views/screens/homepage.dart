import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/config/theme/custom_swatch.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';
import 'package:rolanda_modified_version/views/contacts/contact_us.dart';
import 'package:rolanda_modified_version/views/profile/user_profile.dart';
import 'package:rolanda_modified_version/views/screens/fetch_booking.dart';
import 'package:rolanda_modified_version/views/screens/guest_home_pages.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  String? token;
  final userStorage = StorageService();

  @override
  void initState() {
    super.initState();
    _fetchToken();
  }

  Future<void> _fetchToken() async {
    final fetchedToken = await userStorage.getUserToken();
    setState(() {
      token = fetchedToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    List<Widget> tabItems = [
      const GuestHomePages(),
      token != null
          ? ReservationScreen(token: token!)
          : const Center(child: CircularProgressIndicator()),
      ContactUs(),
      const ProfileDetails(),
    ];

    return Scaffold(
      backgroundColor: colors.surface,
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            activeColor: customSwatch,
            icon: Image.asset(
              "assets/images/home.png",
              color: colors.onSurface,
              width: 30,
            ),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            activeColor: customSwatch,
            icon: Image.asset(
              "assets/images/calender.png",
              color: colors.onSurface,
              width: 30,
            ),
            title: const Text('Bookings'),
          ),
          FlashyTabBarItem(
            activeColor: customSwatch,
            icon: Image.asset(
              "assets/images/about.png",
              color: colors.onSurface,
              width: 30,
            ),
            title: const Text('Contact Us'),
          ),
          FlashyTabBarItem(
            activeColor: customSwatch,
            icon: Image.asset(
              "assets/images/user.png",
              color: colors.onSurface,
              width: 30,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
