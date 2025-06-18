import 'package:flutter/material.dart';
import '../../views/start/first_onboarding_Screen.dart';
import '../../views/start/splash_screen.dart';
import '../../views/screens/home_screen/home_screen.dart';
import '../../views/screens/home_screen/recipe_detail_screen.dart';
import 'package:smart_chef/model/recipe_model.dart';
import '../../views/screens/category_screen/category_screen.dart';

class AppRoutes {
  // Route Names
  static const String splash = '/';
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';
  static const String home = '/home';
  static const String recipeDetail = '/recipeDetail';
  static const String categoryMeals = '/categoryMeals';

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

      case AppRoutes.home:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const HomeScreen(username: 'User'), // Mock username for now
          settings: settings,
        );

      case AppRoutes.recipeDetail:
        final recipe = settings.arguments as Recipe;
        return MaterialPageRoute(
          builder: (_) => RecipeDetailScreen(recipe: recipe),
          settings: settings,
        );

      case AppRoutes.categoryMeals:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(categoryName: categoryName),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
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
