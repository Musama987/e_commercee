import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class USearchBar extends StatelessWidget {
  const USearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: 0,
        right: USizes.spaceBtwSections,
        left: USizes.spaceBtwSections,
        child: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: USizes.md),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
                color:  dark ? UColors.black : UColors.light,
                boxShadow: [
                  BoxShadow(
                  color: dark ? Colors.black.withValues(alpha: 0.2) : UColors.light.withValues(alpha: 0.1),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                )
                ]
            ),
            child: Row(
                children: [
                  Icon(Iconsax.search_normal, color: UColors.darkGrey),
                  SizedBox(width: USizes.spaceBtwItems),
                  Text(UTexts.searchBarTitle, style: Theme.of(context).textTheme.bodySmall),
                ]
            )
        )
    );
  }
}