import 'package:flutter/material.dart';
import '../../views/screens/auth_screens/login_screen.dart';
import '../../views/screens/auth_screens/signup_screen.dart';
import '../../views/screens/request_new_recipe_screen.dart';
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
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String recipeDetail = '/recipeDetail';
  static const String categoryMeals = '/categoryMeals';
  static const String requestNewRecipe = '/requestNewRecipe';

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

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings: settings,
        );

      case home:
        final username = settings.arguments as String? ?? 'User';
        return MaterialPageRoute(
          builder: (_) => HomeScreen(username: username),
          settings: settings,
        );

      case recipeDetail:
        final recipe = settings.arguments as Recipe;
        return MaterialPageRoute(
          builder: (_) => RecipeDetailScreen(recipe: recipe),
          settings: settings,
        );

      case categoryMeals:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(categoryName: categoryName),
          settings: settings,
        );

      case requestNewRecipe:
        return MaterialPageRoute(
          builder: (_) => RequestNewRecipeScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Page Not Found'),
              backgroundColor: const Color(0xFF8FB78F),
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Route "${settings.name}" not found!',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
    }
  }
}
