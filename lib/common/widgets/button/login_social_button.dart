
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ULoginSocialButton extends StatelessWidget {
  const ULoginSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.googleIcon, height: USizes.iconMd, width: USizes.iconMd,)),
        ),
        SizedBox(width: USizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: UColors.grey),
              borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.facebookIcon, height: USizes.iconMd, width: USizes.iconMd,)),
        )
      ],
    );
  }
}