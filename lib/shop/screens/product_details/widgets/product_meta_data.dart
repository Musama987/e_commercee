import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/home_banner_images/circular_image.dart';
import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
import 'package:e_commercee/common/texts/product_price_text.dart';
import 'package:e_commercee/common/texts/product_title_text.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Sale Tag, Sale Price, Actual Price And Share Button
        Row(
          children: [

            /// Sale Tag
            URoundedContainer(
              radius: USizes.sm,
              backgroundColor: UColors.yellow.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
              child: Text('20%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
            ),
            SizedBox(width: USizes.spaceBtwItems),

            /// Sale Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            SizedBox(width: USizes.spaceBtwItems),

            /// Actual Price
            UProductPriceText(price: '150', isLarge: true),
            Spacer(),

            /// Share Button
            IconButton(onPressed: (){}, icon: Icon(Icons.share))
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Title
        UProductTitleText(title: 'Blue Shoes of Bata',smallSize: true, ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Status
        Row(
          children: [
            UProductTitleText(title: 'Status'),
            SizedBox(width: USizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Brand Image With Title
        Row(
          children: [

            /// Brand Image
            UCircularImage(
                padding: 0,
                image: UImages.batalogo, width: 32.0, height: 32.0),
            SizedBox(width: USizes.spaceBtwItems),

            /// Brand Title
            UBrandTitleWithVerifyIcon(title: 'Bata')
          ],
        )


      ],
    );
  }
}
