import 'dart:async';

import 'package:blush_saloon/app/customWidgets/custom_loading_widget.dart';
import 'package:blush_saloon/app/routes/app_pages.dart';
import 'package:blush_saloon/app/utils/constraints/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showWelcomeText = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showWelcomeText = false;
      });

      // Start the loading bar and navigate to the next screen after 3 seconds
      Timer(const Duration(seconds: 3), () {
        Get.toNamed(AppPages.ONBOARDING);
      });
    });

    // Navigate to the next screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            VoidImages.background,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                VoidImages.logo,
                width: 200.w,
                height: 200.h,
                // color: Colors.white,
              ),
              SizedBox(height: 340.h),
              if (_showWelcomeText)
                Text(
                  'Welcome to',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              Text(
                'BLUSH SALOON',
                style: GoogleFonts.luckiestGuy(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.h),
              if (!_showWelcomeText) CustomLoader(controller: _controller),
            ],
          ),
        ],
      ),
    );
  }
}
