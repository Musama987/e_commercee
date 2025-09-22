import 'package:e_commercee/common/products/product_cards/prduct_card_vertical.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/common/widgets/brands/brand_showcase.dart';
import 'package:e_commercee/common/widgets/layouts/grid_layout_home.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Showcase 1
              UBrandShowcase(
                images: [
                  UImages.product,
                  UImages.mobile,
                  UImages.shirt,
                ],
              ),

              /// Brand Showcase 2
              UBrandShowcase(
                images: [
                  UImages.product,
                  UImages.mobile,
                  UImages.shirt,
                ],
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// You might like Section Heading
              USectionHeadingHome(title: 'You might like', onPressed: () {}),

              /// Grid Layout Products
              UGridLayoutHome(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return UProductCardVertical();
                },
              ),

              SizedBox(height: USizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
