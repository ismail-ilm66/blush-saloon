import 'package:blush_saloon/app/utils/constraints/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onSkip() {
    _pageController.jumpToPage(2);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              OnboardingPage(
                imagePath: VoidImages.background2,
                description: 'Explore flavors, find friends, Eat and relax',
              ),
              OnboardingPage(
                imagePath: VoidImages.background2,
                description:
                    'Your gateway to the ultimate hookah lounge adventure',
              ),
              OnboardingPage(
                imagePath: VoidImages.background2,
                description: 'Relax and Enjoy',
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: _onSkip,
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentIndex < 2) {
                          int x = _currentIndex + 1;

                          setState(() {
                            _pageController.jumpToPage(x);
                          });
                        }
                        print(_currentIndex);
                      },
                      style: ElevatedButton.styleFrom(
                        // Text color
                        textStyle: const TextStyle(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Rounded corners
                        ),
                        minimumSize: Size(100.w, 30.h), // Minimum size
                      ),
                      child: Text(
                        _currentIndex == 2 ? "Continue" : 'Next',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        Container(
            // color: Colors.black.withOpacity(0.5),
            ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 150.h),
          ],
        ),
      ],
    );
  }
}
