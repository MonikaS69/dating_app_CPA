import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<Map<String, String>> slides = [
  {
    'image': 'assets/images/onBoardImg/person1.jpg',
    'header': 'Algorithm',
    'text':
        'Users going through a vetting process to ensure you never match with bots.'
  },
  {
    'image': 'assets/images/onBoardImg/person2.jpg',
    'header': 'Matches',
    'text':
        'We match you with people that have a large array of similar interests..'
  },
  {
    'image': 'assets/images/onBoardImg/person3.jpg',
    'header': 'Premium',
    'text': 'Sign up today and enjoy the first month of premium benefits on us.'
  },
];

class SliderWid extends StatefulWidget {
  const SliderWid({super.key});

  @override
  State<SliderWid> createState() => _SliderWidState();
}

class _SliderWidState extends State<SliderWid> {
  int activeIndex = 0;
  final controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: slides.length,
          itemBuilder: (context, index, realIndex) {
            final slide = slides[index];
            return buildSliderItem(slide);
          },
          options: CarouselOptions(
            height: 500,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildSliderItem(Map<String, String> slide) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: ResizeImage(
              AssetImage(slide['image']!),
              height: 350,
              width: 260,
            ),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          slide['header']!,
          style: GoogleFonts.inclusiveSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryRed,
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text(
            slide['text']!,
            textAlign: TextAlign.center,
            style: GoogleFonts.inclusiveSans(
              fontSize: 16,
              color: textBody,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: SlideEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: primaryRed,
          dotColor: Colors.black12,
        ),
        activeIndex: activeIndex,
        count: slides.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}
