import 'package:flutter/material.dart';
import '../../views/screens/start/first_onboarding_Screen.dart';
import '../../views/screens/start/splash_screen.dart';

class AppRoutes {
  // Route Names
  static const String splash = '/';
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';

  // Route Generator
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case onboarding1:
         return MaterialPageRoute(
          builder: (_) => const Onboarding1Screen(),
          settings: settings,

          );


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'Route ${settings.name} not found!',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        );
    }
  }
}