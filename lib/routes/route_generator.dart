import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/views/auth/login.dart';
import 'package:rolanda_modified_version/views/auth/registration_screen.dart';
import 'package:rolanda_modified_version/views/contacts/contact_us.dart';
import 'package:rolanda_modified_version/views/screens/guest_home_pages.dart';
import 'package:rolanda_modified_version/views/onboarding/on_boarding_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());
      case Routes.guest:
        return MaterialPageRoute(builder: (_) => const GuestHomePages());
      case Routes.contactUs:
        return MaterialPageRoute(builder: (_) => ContactUs());
      // case Routes.profile:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(child: Text('Ooops!!! An error has occurred')),
        );
      },
    );
  }
}
