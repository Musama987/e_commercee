#// import 'package:e_commercee/utils/helpers/device_helpers.dart';
#import 'package:e_commercee/common/widgets/button/elevated_button.dart';
#import 'package:e_commercee/utils/constants/images.dart';
#import 'package:e_commercee/utils/constants/sizes.dart';
#import 'package:e_commercee/utils/constants/texts.dart' show UTexts;
#import 'package:e_commercee/utils/helpers/device_helpers.dart';
#import 'package:flutter/material.dart';
#import 'package:smooth_page_indicator/smooth_page_indicator.dart';
#
#
#import 'widget/onboarding_page.dart' show onBoardingPage;
#
#class OnboardingScreen extends StatelessWidget {
#const OnboardingScreen({super.key});
#
#@override
#Widget build(BuildContext context) {
#return Scaffold(
#body: Center(
#child: Column(
#mainAxisAlignment: MainAxisAlignment.center,
#crossAxisAlignment: CrossAxisAlignment.center,
#children: [
#Row(
#children: [
#Spacer(),
#Padding(
#padding: const EdgeInsets.only(right: 10.0, bottom: 20),
#child: Text("Skip"),
#),
#],
#),
#Text("Image"),
#SizedBox(height: 20,),
#Text("Heading"),
#
#SizedBox(height: 10,),
#Text("Subtitle"),
#SizedBox(height: 10,),
#Text("Dots"),
#Spacer(),
#Text("BTN"),
#],
#),
#),
#// body: Stack(
#//   children: [
#//     //Scrollable Page
#//     PageView(
#//       children: [
#//         onBoardingPage(image: UImages.onboarding1Image, title: UTexts.onboardingTitle1, subtitle: UTexts.onboardingSubtitle1),
#//         onBoardingPage(image: UImages.onboarding2Image, title: UTexts.onboardingTitle2, subtitle: UTexts.onboardingSubtitle2),
#//         onBoardingPage(image: UImages.onboarding3Image, title: UTexts.onboardingTitle3, subtitle: UTexts.onboardingSubtitle3),
#//       ],
#//     ),
#//     //indicator
#//     onBoardingDotNavigation(),
#//     //Bottom Button
#//     Positioned(
#//         bottom: 1,
#//         right: 20,
#//         left: 20,
#//         child: UElevatedButton())
#//   ],
#// ),
#);
#}
#}
#
#
#class onBoardingDotNavigation extends StatelessWidget {
#const onBoardingDotNavigation({
#super.key,
#});
#
#@override
#Widget build(BuildContext context) {
#return Center(
#child: Positioned(
#bottom: 25,
#child: SmoothPageIndicator(controller: PageController(),
#count: 3,
#effect: ExpandingDotsEffect(
#dotHeight: 6.0,
#),
#)),
#);
#}
#}