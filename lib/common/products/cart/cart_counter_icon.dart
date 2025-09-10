import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.shopping_bag),
          color: UColors.white,
        ),
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? UColors.light : UColors.dark,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!
                    .apply(
                  fontSizeFactor: 0.8,
                  color: dark ? UColors.dark : UColors.light,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}