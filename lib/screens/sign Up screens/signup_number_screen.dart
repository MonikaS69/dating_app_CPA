import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberSignUpScreen extends StatefulWidget {
  static String routeName = '/signUpNumber';
  const NumberSignUpScreen({super.key});

  @override
  State<NumberSignUpScreen> createState() => _NumberSignUpScreenState();
}

class _NumberSignUpScreenState extends State<NumberSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: "Enter Phone Number",
                style: GoogleFonts.inclusiveSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
