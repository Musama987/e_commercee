import 'package:e_commercee/shop/screens/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' show SmoothPageIndicator, ExpandingDotsEffect;

class BannersDotNavigation extends StatelessWidget {
  const BannersDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Obx(
      ()=> SmoothPageIndicator(
        count: 6,
        effect: ExpandingDotsEffect
          (
          dotHeight: 6.0,
        ),
        controller: PageController(initialPage: controller.currentIndex.value),

      ),
    );
  }
}