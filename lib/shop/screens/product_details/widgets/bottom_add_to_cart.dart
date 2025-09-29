import 'package:e_commercee/common/icons/circular_icons.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class UBottomAddToCart extends StatelessWidget {
  const UBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace, vertical: USizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? UColors.darkerGrey : UColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(USizes.cardRadiusLg),
            topRight: Radius.circular(USizes.cardRadiusLg),
          )
      ),
      child: Row(
        children: [

          /// Decrement Button
          UCircularIcon(icon: Iconsax.minus, backgroundColor: UColors.darkGrey, width: 40, height: 40, color: UColors.white, ),
          SizedBox(width: USizes.spaceBtwItems),

          /// Counter
          Text('2', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(width: USizes.spaceBtwItems),

          /// Increment Button
          UCircularIcon(icon: Iconsax.add, backgroundColor: UColors.black, width: 40, height: 40, color: UColors.white ),
          Spacer(),

          /// Add to Cart Button
          ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(USizes.md),
              backgroundColor: UColors.black,
              side: BorderSide(color: UColors.black)
          ), child: Row(
            children: [
              Icon(Iconsax.shopping_bag),
              SizedBox(width: USizes.spaceBtwItems  / 2),
              Text('Add To Cart'),
            ],
          ),)
        ],
      ),
    );
  }
}