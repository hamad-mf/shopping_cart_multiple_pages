import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart_multiple_pages/View/home_screen/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 240, 239, 238),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(1.10, 0.10),
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/no_bg.png"))),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Define yourself in your unique way",
                      style: GoogleFonts.dmSerifText(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        height: 0.8,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(350, 70)),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Get Started"),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
