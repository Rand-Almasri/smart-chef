import 'package:flutter/material.dart';
import '../../model/user_model.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Validates login form
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /// Validates email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validates password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Handles login process
  Future<void> login(BuildContext context) async {
    if (!validateForm()) {
      return;
    }

    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      final user = UserModel(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Close loading dialog
      if (context.mounted) {
        Navigator.pop(context);

        // Navigate to home
        Navigator.pushReplacementNamed(context, '/home');

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      // Close loading dialog if still open
      if (context.mounted) {
        Navigator.pop(context);

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Clear all form fields
  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  /// Dispose controllers
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}