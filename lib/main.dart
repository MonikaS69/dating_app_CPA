import 'package:dating_app/screens/home_screen.dart';
import 'package:dating_app/screens/onboarding_screen.dart';
import 'package:dating_app/screens/sign%20Up%20screens/otp_screens.dart';
import 'package:dating_app/screens/sign%20Up%20screens/signup_number_screen.dart';
import 'package:dating_app/screens/sign%20Up%20screens/signup_screen.dart';
import 'package:dating_app/screens/signin_screen.dart';
import 'package:dating_app/screens/user_profile/gender_screen.dart';
import 'package:dating_app/screens/user_profile/user_profile_screen.dart';
import 'package:dating_app/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backGroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backGroundColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: textHeader,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(
            color: textHeader,
          ),
        ),
      ),
      routes: {
        //Normal
        HomeScreen.routeName: (context) => const HomeScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        //Sign Up
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        //Sign In
        SignInScreen.routeName: (context) => const SignInScreen(),
        NumberSignUpScreen.routeName: (context) => const NumberSignUpScreen(),
        OtpScreens.routeName: (context) => const OtpScreens(),
        //User
        UserProfileScreen.routeName: (context) => const UserProfileScreen(),
        GenderScreen.routeName: (context) => const GenderScreen(),
        // UserProfileScreen.routeName: (context) => const UserProfileScreen()
      },
      home: const OnBoardingScreen(),
    );
  }
}


