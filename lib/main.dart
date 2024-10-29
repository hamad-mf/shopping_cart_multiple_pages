import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_multiple_pages/Controller/home_screen_controller.dart';
import 'package:shopping_cart_multiple_pages/View/get_started_screen/get_started_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStartedScreen(),
      ),
    );
  }
}
