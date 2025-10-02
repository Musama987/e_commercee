import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/home_banner_images/rounded_images.dart';
import 'package:e_commercee/common/icons/circular_icons.dart';
import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
import 'package:e_commercee/common/texts/product_price_text.dart';
import 'package:e_commercee/common/texts/product_title_text.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color : dark ? UColors.darkerGrey : UColors.light,
        ),
        child: Row(
          children: [

            /// Left Portion
            URoundedContainer(
              height: 120,
              padding: EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [

                  /// Thumbnail
                  SizedBox(
                      width: 120,
                      height: 120,
                      child: URoundedImageHome(imageUrl: UImages.product) ),

                  /// Discount Tag
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                      child: Text('20%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                    ),
                  ),

                  /// Favourite Button
                  Positioned(right: 0, top: 0, child: UCircularIcon(icon: Iconsax.heart5, color: Colors.red))
                ],
              ),
            ),

            /// Right Portion
            SizedBox(
              width: 172.0,
              child: Padding(
                padding: const EdgeInsets.only(left: USizes.sm, top: USizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Product Title
                        UProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                        SizedBox(height: USizes.spaceBtwItems / 2),

                        /// Product Brand
                        UBrandTitleWithVerifyIcon(title: 'Bata')

                      ],
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: UProductPriceText(price: '323')),

                        Container(
                          width: USizes.iconLg * 1.2,
                          height: USizes.iconLg * 1.2,
                          decoration: BoxDecoration(
                              color: UColors.primary,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(USizes.cardRadiusMd),
                                  bottomRight: Radius.circular(USizes.productImageRadius))),
                          child: Icon(Iconsax.add, color: UColors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}