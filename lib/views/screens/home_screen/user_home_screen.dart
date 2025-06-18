import 'package:flutter/material.dart';
import '../../widgets/login_required_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool isLoggedIn = false;

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => LoginRequiredDialog(
        onLogin: () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (isLoggedIn) {
              Navigator.pushNamed(context, '/recipe');
            } else {
              _showLoginDialog(context);
            }
          },
          child: const Text('View Recipe'),
        ),
      ),
    );
  }
}
