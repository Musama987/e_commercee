import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/sortable_products.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/brands/brand_card.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Bata', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [

              /// Brand
              UBrandCard(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Brand Products
              USortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}