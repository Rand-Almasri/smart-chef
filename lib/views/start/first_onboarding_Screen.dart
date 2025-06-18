import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({Key? key}) : super(key: key);

  void _handleGetStarted(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC107), // Golden yellow
              Color(0xFFFFD54F), // Lighter yellow
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 80),

                      // Chef Illustration
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                        child: ClipOval(
                          child: Container(
                            width: 270,
                            height: 270,
                            child: Image.asset(
                              'assets/images/chef_welcome.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),


                      // Title
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 16),
                        child: Text(
                          'Welcome to\nSmart Chef App',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                      ),

                      // Subtitle
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Enjoy cooking Delicious and detailed recipes on your phone',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Button Section
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    // Get Started Button with Gradient
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF5ECE63), // Green
                              Color(0xE0F5DE75), // Light
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => _handleGetStarted(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}