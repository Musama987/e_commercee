
import 'package:e_commercee/common/home_banner_images/rounded_images.dart';
import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
import 'package:e_commercee/common/texts/product_title_text.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// Product Image
        URoundedImageHome(
          imageUrl: UImages.product1,
          height: 60.0,
          width: 60.0,
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: dark ? UColors.darkerGrey : UColors.light,
        ),
        SizedBox(width: USizes.spaceBtwItems),

        /// Brand, Name, Variation
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Brand
                UBrandTitleWithVerifyIcon(title: 'Bata'),

                /// Title
                UProductTitleText(title: 'Blue Bata Shoes', maxLines: 1),

                /// Variation OR Attributes
                RichText(
                    text: TextSpan(children: [
                      TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'and ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Blue ', style: Theme.of(context).textTheme.bodyLarge),
                      // TextSpan(text: 'Storage ', style: Theme.of(context).textTheme.bodySmall),
                      // TextSpan(text: '512GB ', style: Theme.of(context).textTheme.bodyLarge),
                    ]))
              ],
            ))
      ],
    );
  }
}