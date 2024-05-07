import 'package:flutter/material.dart';
import 'package:src/screens/authentications/register.dart';
import 'package:src/widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AskHand',
      routes: {
        '/': (context) => const SplashScreen(),
        '/register' : (context) => const RegisterPage(),
      }
    );
  }
}
