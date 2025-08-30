
// import 'package:e_commercee/utils/helpers/device_helpers.dart';
import 'package:e_commercee/utils/constants/texts.dart' show UTexts;
import 'package:e_commercee/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/images.dart' show UImages;
import 'widget/onboarding_page.dart' show onBoardingPage;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Scrollable Page
          PageView(
            children: [
              onBoardingPage(image: UImages.onboarding1Image, title: UTexts.onboardingTitle1, subtitle: UTexts.onboardingSubtitle1),
              onBoardingPage(image: UImages.onboarding2Image, title: UTexts.onboardingTitle2, subtitle: UTexts.onboardingSubtitle2),
              onBoardingPage(image: UImages.onboarding3Image, title: UTexts.onboardingTitle3, subtitle: UTexts.onboardingSubtitle3),
            ],
          ),
          //indicator
          onBoardingDontNavigation()

        ],
      ),
    );
  }
}

class onBoardingDontNavigation extends StatelessWidget {
  const onBoardingDontNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: UDeviceHelper.getBottomNavigationBarHeight() * 4,
        left: UDeviceHelper.getScreenWidth(context) / 2.5 ,
        right: UDeviceHelper.getScreenWidth(context) / 2.5,
        child: SmoothPageIndicator(controller: PageController(),
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 6.0,
            ),
        ));
  }
}


