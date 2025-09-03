
import 'package:e_commercee/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart' show OnBoardingDotNavigation;
import 'package:e_commercee/features/authentication/screens/onboarding/widget/onboarding_skip_button.dart' show onBoardingSkipButton;
import 'package:e_commercee/features/authentication/screens/onboarding/widget/onboardingnextbutton.dart' show onBoardingNextButton;
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart' show UTexts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding/onboarding_controller.dart' show OnBoardingController;
import 'widget/onboarding_page.dart' show OnBoardingPage;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            //Scrollable Page
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                OnBoardingPage(
                  image: UImages.onboarding1Image,
                  title: UTexts.onboardingTitle1,
                  subtitle: UTexts.onboardingSubtitle1,
                ),
                OnBoardingPage(
                  image: UImages.onboarding2Image,
                  title: UTexts.onboardingTitle2,
                  subtitle: UTexts.onboardingSubtitle2,
                ),
                OnBoardingPage(
                  image: UImages.onboarding3Image,
                  title: UTexts.onboardingTitle3,
                  subtitle: UTexts.onboardingSubtitle3,
                ),
              ],
            ),
            //indicator
            OnBoardingDotNavigation(),
            //Bottom Button
            onBoardingNextButton(),
            //Skip Button
            onBoardingSkipButton(),
          ],
        ),
      ),
    );
  }
}

