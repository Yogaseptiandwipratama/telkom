import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB44F4F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            // TODO: Replace with actual logo asset 'assets/images/celoe_logo.png'
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.asset(
                'assets/images/celoe_logo.png',
                width: 150, // Approximate width
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if image is missing
                  return const Text(
                    'CeLOE',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Cursive', // Just to make it distinct
                    ),
                  );
                },
              ),
            ),
            // Text
            const Text(
              'Learning Management System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14, // Approximate size
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
