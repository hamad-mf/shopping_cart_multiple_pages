import 'package:flutter/material.dart';
import 'package:shopping_cart_multiple_pages/View/get_started_screen/get_started_screen.dart';
import 'package:shopping_cart_multiple_pages/View/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
    );
  }
}
