import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/common/widgets/brands/brand_card.dart';
import 'package:e_commercee/common/widgets/layouts/grid_layout_home.dart';
import 'package:e_commercee/shop/screens/brands/brand_products.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// [Text] - Brands
              USectionHeadingHome(title: 'Brands', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              /// List Of Brands
              UGridLayoutHome(
                itemCount: 10,
                itemBuilder: (context, index) => UBrandCard(
                  onTap: () => Get.to(() => BrandProductsScreen()),
                ),
                mainAxisExtent: 80
              ),
            ],
          ),
        ),
      ),
    );
  }
}
