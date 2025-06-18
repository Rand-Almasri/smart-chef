import 'package:flutter/material.dart';
import '../../views/screens/auth_screens/login_screen.dart';
import '../../views/screens/home_screen/user_home_screen.dart';
import '../../views/screens/start/first_onboarding_Screen.dart';
import '../../views/screens/start/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';
  static const String login = '/login';
  static const String home = '/home';
  static const String recipe = '/recipe';

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

    case login:
    return MaterialPageRoute(
    builder: (_) => LoginScreen(),
    settings: settings,
    );

    case home:
    return MaterialPageRoute(
    builder: (_) => const HomeScreen(),
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