import 'package:e_commercee/app_service.dart';
import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/home_banner_images/rounded_images.dart';
import 'package:e_commercee/common/style/shadow.dart';
import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
import 'package:e_commercee/common/texts/product_price_text.dart';
import 'package:e_commercee/common/texts/product_title_text.dart';
import 'package:e_commercee/shop/models/product_model.dart';
import 'package:e_commercee/shop/screens/product_details/product_details.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

import '../../../utils/constants/utils.dart';

class UProductCardVertical extends StatelessWidget {
  final ProductModel model;
  final AppService appService;
  final Function() onPressed;

  const UProductCardVertical({
    super.key,
    required this.model,
    required this.appService,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(model: model)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.productImageRadius),
          color: dark ? UColors.darkGrey : UColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Thumbnil favourite button  discount tag,
            URoundedContainer(
              width: 180,
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  Center(child: URoundedImageHome(imageUrl: UImages.product1)),
                  //Discount tag
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.sm,
                        vertical: USizes.xs,
                      ),
                      child: Text(
                        "${model.discount}%",
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: UColors.black),
                      ),
                    ),
                  ),

                  /// Favourite Button
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: IconButton(
                          onPressed: () {
                            model.isWishListed.value =
                                !model.isWishListed.value;
                            toggle(model);
                          },
                          icon: Icon(
                            model.isWishListed.value
                                ? Iconsax.heart5
                                : Iconsax.heart,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),

            // lower body of product texts
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UProductTitleText(title: model.name, smallSize: true),
                  SizedBox(height: USizes.spaceBtwItems / 2),

                  //products label
                  UBrandTitleWithVerifyIcon(title: model.brandName),
                  // Spacer(),

                  //product price &button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: USizes.sm),
                        child: UProductPriceText(price: "${model.price}"),
                      ),
                      //Add Button
                      Container(
                        width: USizes.iconLg * 1.2,
                        height: USizes.iconLg * 1.2,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusLg),
                            bottomRight: Radius.circular(
                              USizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: Icon(Iconsax.add, color: UColors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggle(ProductModel model) {
    if (Utils.wishListProductList.any((d) => d.name == model.name)) {
      Utils.wishListProductList.removeWhere(
        (d) => d.name == model.name,
      ); // unselect if tapped again
    } else {
      Utils.wishListProductList.add(model);
    }
  }
}
