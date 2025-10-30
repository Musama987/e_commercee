import 'package:carousel_slider/carousel_options.dart' show CarouselOptions;
import 'package:carousel_slider/carousel_slider.dart' show CarouselSlider;
import 'package:e_commercee/common/home_banner_images/rounded_images.dart';
import 'package:e_commercee/shop/screens/home/home_controller.dart';
import 'package:e_commercee/shop/screens/home/widgets/banners_dot_navigation.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UPromoSliderHome extends StatelessWidget {
  const UPromoSliderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Column(
      children: [
        CarouselSlider(
          items: [
            URoundedImageHome(imageUrl: UImages.banner1),
            URoundedImageHome(imageUrl: UImages.banner2),
            URoundedImageHome(imageUrl: UImages.banner3),
            URoundedImageHome(imageUrl: UImages.banner5),
            URoundedImageHome(imageUrl: UImages.banner1),
          ],
          options: CarouselOptions(
              viewportFraction: 1.0, onPageChanged: (index, reason) => controller.onPageChanged(index)),
          carouselController: controller.carouselController,
        ),
        SizedBox(height: USizes.spaceBtwItems),
        //dot navigation
        BannersDotNavigation(),
      ],

      //dotNavigation

    );
  }
}