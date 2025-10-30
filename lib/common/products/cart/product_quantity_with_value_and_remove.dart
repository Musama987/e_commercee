import 'package:e_commercee/app_service.dart';
import 'package:e_commercee/common/icons/circular_icons.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class UProductQuantityWithAddRemove extends StatelessWidget {
  const UProductQuantityWithAddRemove({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Increment Button
        UCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: dark ? UColors.white : UColors.black,
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
          appService: AppService(),
        ),
        SizedBox(width: USizes.spaceBtwItems),

        /// Counter Text
        Text(
            '2',
            style: Theme.of(context).textTheme.titleSmall
        ),
        SizedBox(width: USizes.spaceBtwItems),

        /// Decrement Button
        UCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.iconSm,
          color: UColors.white,
          backgroundColor: UColors.primary,
          appService: AppService(),
        )
      ],
    );
  }
}