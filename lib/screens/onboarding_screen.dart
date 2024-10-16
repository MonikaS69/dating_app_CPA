import 'package:dating_app1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';

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
  int activeIndex = 0;
  final controller = CarouselSliderController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundOnboard,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 375,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      enlargeCenterPage: false,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  buildIndicator(),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ExpandingDotsEffect(
            dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

Widget buildImage(urlImages, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      child: Image.asset(urlImages, fit: BoxFit.cover),
    );
