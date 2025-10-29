// import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
// import 'package:e_commercee/common/home_banner_images/circular_image.dart';
// import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
// import 'package:e_commercee/common/texts/product_price_text.dart';
// import 'package:e_commercee/common/texts/product_title_text.dart';
// import 'package:e_commercee/shop/models/product_model.dart';
// import 'package:e_commercee/utils/constants/colors.dart';
// import 'package:e_commercee/utils/constants/images.dart';
// import 'package:e_commercee/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';
//
// class UProductMetaData extends StatelessWidget {
//   final ProductModel model;
//   const UProductMetaData({super.key, required this.model});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// Sale Tag, Sale Price, Actual Price And Share Button
//         Row(
//           children: [
//
//             /// Sale Tag
//             URoundedContainer(
//               radius: USizes.sm,
//               backgroundColor: UColors.yellow.withValues(alpha: 0.8),
//               padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
//               child: Text("${model.discount}%", style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
//             ),
//             SizedBox(width: USizes.spaceBtwItems),
//
//             /// Sale Price
//             Text("${model.price}", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
//             SizedBox(width: USizes.spaceBtwItems),
//
//             /// Actual Price
//             UProductPriceText(price: "${model.price}", isLarge: true),
//             Spacer(),
//
//             /// Share Button
//             IconButton(onPressed: (){}, icon: Icon(Icons.share))
//           ],
//         ),
//         SizedBox(height: USizes.spaceBtwItems / 1.5),
//
//         /// Product Title
//         UProductTitleText(title: model.name,smallSize: true, ),
//         SizedBox(height: USizes.spaceBtwItems / 1.5),
//
//         /// Product Status
//         Row(
//           children: [
//             UProductTitleText(title: 'Status'),
//             SizedBox(width: USizes.spaceBtwItems),
//             Text(model.status, style: Theme.of(context).textTheme.titleMedium)
//           ],
//         ),
//         SizedBox(height: USizes.spaceBtwItems / 1.5),
//
//         /// Product Brand Image With Title
//         Row(
//           children: [
//
//             /// Brand Image
//             UCircularImage(
//                 padding: 0,
//                 image: UImages.batalogo, width: 32.0, height: 32.0),
//             SizedBox(width: USizes.spaceBtwItems),
//
//             /// Brand Title
//             UBrandTitleWithVerifyIcon(title: model.brandName)
//           ],
//         )
//
//
//       ],
//     );
//   }
// }


import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/home_banner_images/circular_image.dart';
import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
import 'package:e_commercee/common/texts/product_price_text.dart';
import 'package:e_commercee/common/texts/product_title_text.dart';
import 'package:e_commercee/shop/models/product_model.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProductMetaData extends StatelessWidget {
  final ProductModel model;
  const UProductMetaData({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // Assuming model.price and model.discount are non-null.
    // If they can be null, you might need to add checks.
    // For this calculation, we assume they are doubles or numb.
    final originalPrice = model.price;
    final discountPercentage = model.discount;
    final discountedPrice =
        originalPrice - (originalPrice * discountPercentage / 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Sale Tag, Sale Price, Actual Price And Share Button
        Row(
          children: [
            /// Sale Tag
            // Only show the discount tag if there is a discount
            if (discountPercentage > 0)
              URoundedContainer(
                radius: USizes.sm,
                backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: USizes.sm, vertical: USizes.xs),
                child: Text("${model.discount}%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: UColors.black)),
              ),
            if (discountPercentage > 0) const SizedBox(width: USizes.spaceBtwItems),

            /// Sale Price (Original Price with strikethrough)
            // Only show the original price with strikethrough if there is a discount
            if (discountPercentage > 0)
              Text("${model.price}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (discountPercentage > 0) const SizedBox(width: USizes.spaceBtwItems),

            /// Actual Price (The final price to pay)
            UProductPriceText(
              // Use the calculated discounted price if discount > 0, otherwise show the original price
                price: (discountPercentage > 0 ? discountedPrice : originalPrice)
                    .toStringAsFixed(2),
                isLarge: true),
            const Spacer(),

            /// Share Button
            IconButton(onPressed: () {}, icon: const Icon(Icons.share))
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Title
        UProductTitleText(
          title: model.name,
          smallSize: true,
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Status
        Row(
          children: [
            const UProductTitleText(title: 'Status'),
            const SizedBox(width: USizes.spaceBtwItems),
            Text(model.status, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItems / 1.5),

        /// Product Brand Image With Title
        Row(
          children: [
            /// Brand Image
            UCircularImage(
                padding: 0,
                image: UImages.batalogo,
                width: 32.0,
                height: 32.0),
            const SizedBox(width: USizes.spaceBtwItems),

            /// Brand Title
            UBrandTitleWithVerifyIcon(title: model.brandName)
          ],
        )
      ],
    );
  }
}
