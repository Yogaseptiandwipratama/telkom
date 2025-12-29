import 'package:flutter/material.dart';
import 'package:simat_telkom/presentation/pages/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simat Telkom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB44F4F)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

