import 'package:dating_app/utils/colors.dart';
import 'package:dating_app/widgets/sliders.dart';
import 'package:flutter/material.dart';

final List<String> urlImages = [
  'assets/images/onBoardImg/girl1.jpg',
  'assets/images/onBoardImg/girl2.jpg',
  'assets/images/onBoardImg/girl3.jpg',
  'assets/images/onBoardImg/male1.jpg',
  'assets/images/onBoardImg/male2.jpg',
];

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
      backgroundColor: backGroundOnboard,
      body: const SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 30)),
            SliderWid(),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
