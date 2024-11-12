import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/utils/storage_service.dart';
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
    List<Widget> tabItems = [
      const GuestHomePages(),
      token != null
          ? ReservationScreen(token: token!)
          : const Center(child: CircularProgressIndicator()),
      const Center(child: Text("1")),
      const Center(child: Text("2")),
    ];

    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              color: const Color(0xff9496c1),
              width: 30,
            ),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Image.asset(
              "assets/images/calender.png",
              color: const Color(0xff9496c1),
              width: 30,
            ),
            title: const Text('Bookings'),
          ),
          FlashyTabBarItem(
            icon: Image.asset(
              "assets/images/about.png",
              color: const Color(0xff9496c1),
              width: 30,
            ),
            title: const Text('Contact Us'),
          ),
          FlashyTabBarItem(
            icon: Image.asset(
              "assets/images/user.png",
              color: const Color(0xff9496c1),
              width: 30,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }
}
