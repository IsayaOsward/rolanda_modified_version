import 'package:flutter/material.dart';
import 'package:rolanda_modified_version/routes/routes.dart';
import 'package:rolanda_modified_version/views/auth/login.dart';
import 'package:rolanda_modified_version/views/auth/registration_screen.dart';
import 'package:rolanda_modified_version/views/onboarding/on_boarding_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const Login());      
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
