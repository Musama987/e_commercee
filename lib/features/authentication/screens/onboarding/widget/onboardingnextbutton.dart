import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      // bottom: 1,
      // right: 20,
      // left: 20,
      left: 0,
      right: 0,
      bottom: USizes.spaceBtwItems / 2,
      child: UElevatedButton(
          onPressed: controller.nextPage ,
          child: Obx(()=> Text(controller.currentIndex.value == 2 ? 'Get Started' : 'Next'))
    ));
  }
}