import 'package:dating_app/screens/sign%20Up%20screens/signup_screen.dart';
import 'package:dating_app/utils/colors.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:dating_app/widgets/sliders.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/onBoardScreen";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            const SliderWid(),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
              text: "Create an account",
              backgroundColor: primaryRed,
              textColor: text2,
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: GoogleFonts.inclusiveSans(
                  color: text1,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(
                      color: primaryRed,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      Navigator.pushNamed(context, "/signIn");
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
