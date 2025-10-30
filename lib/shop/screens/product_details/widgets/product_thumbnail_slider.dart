import 'package:e_commercee/app_service.dart';
import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/home_banner_images/rounded_images.dart';
import 'package:e_commercee/common/icons/circular_icons.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.white,
      child: Stack(
        children: [
          /// [Image] - Main Image OR Thumbnail
          SizedBox(
              height: 400,
              child: Padding(
                  padding: EdgeInsets.all(USizes.productImageRadius * 2),
                  child: Center(child: Image(image: AssetImage(UImages.product1))))),

          /// Image Slider
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80.0,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) => URoundedImageHome(
                      width: 80,
                      backgroundColor: dark ? UColors.dark : UColors.light,
                      padding: EdgeInsets.all(USizes.sm),
                      border: Border.all(color: UColors.primary),
                      imageUrl: UImages.product1)),
            ),
          ),

          /// [AppBar] - Back Arrow & Favourite Button
          UAppBar(
            showBackArrow: true,
            actions: [UCircularIcon(icon: Iconsax.heart5, color: Colors.red, appService: AppService(),)],
          )
        ],
      ),
    );
  }
}

