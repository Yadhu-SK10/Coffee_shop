import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5), // neutral background
        body: Center(
          child: SizedBox(
            width: 375,
            height: 812,
            child: const LoginScreen(),
          ),
        ),
      ),
    );
  }
}
