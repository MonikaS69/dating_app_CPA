import 'package:dating_app/screens/home_screen.dart';
import 'package:dating_app/screens/onboarding_screen.dart';
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
        HomeScreen.routeName: (context) => const HomeScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
      },
      home: const OnBoardingScreen(),
    );
  }
}


