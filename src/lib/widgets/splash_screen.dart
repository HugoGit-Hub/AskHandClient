import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/register');
    });

    return Container(
      color: Colors.green,
      child: Center(
        child: Image.asset(
          'assets/splash_screen_image.png',
          width: 150,
          height: 100,
        ),
      ),
    );
  }
}