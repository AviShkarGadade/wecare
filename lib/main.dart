import 'package:flutter/material.dart';
import 'package:wecare_app/screens/signin_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const WecareApp());
}

class WecareApp extends StatelessWidget {
  const WecareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wecare',
      theme: ThemeData(
        primaryColor: const Color(0xFF003300),
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(nextPage: SignInScreen()),
    );
  }
}
