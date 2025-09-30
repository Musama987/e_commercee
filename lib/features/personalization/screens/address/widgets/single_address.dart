import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class USingleAddress extends StatelessWidget {
  const USingleAddress({
    super.key,
    required this.isSelected
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
        width: double.infinity,
        showBorder: true,
        backgroundColor: isSelected ? UColors.primary.withValues(alpha: 0.5) : Colors.transparent,
        borderColor: isSelected ? Colors.transparent : dark ? UColors.darkerGrey : UColors.grey,
        padding: EdgeInsets.all(USizes.md),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name
                Text('Unknown Pro',
                    style: Theme.of(context).textTheme.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: USizes.spaceBtwItems / 2),

                /// Phone Number
                Text('+92 312345678', maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: USizes.spaceBtwItems / 2),

                /// Address
                Text('House No.295, Hyderabad, Sindh, Pakistan'),

              ],
            ),

            if(isSelected) Positioned(
                top: 0,
                bottom: 0,
                right: 6,
                child: Icon(Iconsax.tick_circle5))
          ],
        )
    );
  }
}