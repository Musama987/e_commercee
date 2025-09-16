import 'package:e_commercee/common/products/product_cards/prduct_card_vertical.dart';
import 'package:e_commercee/common/textfields/searchbar.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/shop/controllers/home/home_controller.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/home_promo_slider.dart';
import 'widgets/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        // upper Parts
        children: [
          Stack(
            children: [
              //height upgrade + 20
              SizedBox(
                height: USizes.primaryHeaderHeight + 10,
                // color: Colors.amber,
              ),

              ///Primary Header Container
              UPrimaryHeaderContainerHome(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //appbar
                    UHomeAppBar(),
                    SizedBox(height: USizes.spaceBtwSections),

                    //Home Categories
                    UHomeCategories(),
                  ],
                ),
              ),

              //search bar
              USearchBar(),
            ],
          ),

          // lower parts
          //Banners
          Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: Column(
              children: [
                UPromoSliderHome(),
                const SizedBox(height: USizes.spaceBtwSections),

                //Vertical product Categories
                USectionHeadingHome(
                  title: 'Popular Products',
                  onPressed: () {},
                ),
                const SizedBox(height: USizes.spaceBtwSections),

                //vertical cards
                UProductCardVertical(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


