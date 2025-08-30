
// import 'package:e_commercee/utils/helpers/device_helpers.dart';
import 'package:e_commercee/utils/constants/texts.dart' show UTexts;
import 'package:flutter/material.dart';

import '../../../../utils/constants/images.dart' show UImages;
import 'widget/onboarding_page.dart' show onBoardingPage;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              onBoardingPage(image: UImages.onboarding1Image, title: UTexts.onboardingTitle1, subtitle: UTexts.onboardingSubtitle1),
              onBoardingPage(image: UImages.onboarding2Image, title: UTexts.onboardingTitle2, subtitle: UTexts.onboardingSubtitle2),
              onBoardingPage(image: UImages.onboarding3Image, title: UTexts.onboardingTitle3, subtitle: UTexts.onboardingSubtitle3),
            ],
          ),
        ],
      ),
    );
  }
}


