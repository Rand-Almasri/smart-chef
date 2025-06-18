import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String? gender;

  void login(BuildContext context) {
    final user = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );

    Navigator.pushReplacementNamed(context, '/home');
  }

  void register(BuildContext context) {
    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      age: int.tryParse(ageController.text),
      gender: gender,
    );

    Navigator.pushReplacementNamed(context, '/home');
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    ageController.dispose();
  }
}

class LoginController extends AuthController {}
class SignupController extends AuthController {}
