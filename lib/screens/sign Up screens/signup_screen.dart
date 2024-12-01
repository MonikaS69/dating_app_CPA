import 'package:dating_app/utils/colors.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:dating_app/widgets/social_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/signUp";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: 70),
                Image(image: AssetImage("assets/icons/trademark.png")),
                SizedBox(height: 110),
                Text(
                  "Sign up to continue",
                  style: GoogleFonts.inclusiveSans(
                      color: text1, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 50),
                CustomButton(
                  onTap: () {},
                  text: "Continue with email",
                  backgroundColor: primaryRed,
                  textColor: text2,
                ),
                SizedBox(height: 30),
                CustomButton(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/signUpNumber');
                  },
                  text: "Use phone number",
                  backgroundColor: Colors.white,
                  textColor: primaryRed,
                ),
                SizedBox(height: 55),
                Row(
                  children: [
                    const Expanded(
                        child: Divider(
                      color: Colors.black26,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or sign up with',
                        style: GoogleFonts.rubik(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: text1,
                        ),
                      ),
                    ),
                    const Expanded(
                        child: Divider(
                      color: Colors.black26,
                    )),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      iconWidget:
                          Icon(Icons.facebook, color: Colors.blue, size: 35),
                      color: Colors.blue,
                    ),
                    SizedBox(width: 15),
                    SocialButton(
                      iconWidget: Image.asset(
                        'assets/icons/gg_icon.png',
                        width: 35,
                        height: 35,
                      ),
                      color: Colors.red,
                    ),
                    SizedBox(width: 15),
                    SocialButton(
                      iconWidget:
                          Icon(Icons.apple, color: Colors.black, size: 35),
                      color: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of use',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Text('|', style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
