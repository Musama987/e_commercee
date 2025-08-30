import 'package:e_commercee/utils/constants/images.dart' show UImages;
import 'package:e_commercee/utils/constants/sizes.dart' show USizes;
import 'package:e_commercee/utils/constants/texts.dart' show UTexts;
import 'package:e_commercee/utils/helpers/device_helpers.dart' show UDeviceHelper;
import 'package:flutter/material.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: USizes.defaultSpace,
        left: USizes.defaultSpace,
        top: UDeviceHelper.getAppBarHeight(),
      ),
      child: Column(
        children: [
          Image.asset(image),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium,
          ),
          Text(
          subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}