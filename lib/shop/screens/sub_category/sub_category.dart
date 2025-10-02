import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/product_cards/product_card_horizontal.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Sports', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [

              /// Sub Category
              USectionHeadingHome(title: 'Sports Shoes', onPressed: (){}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Horizontal Product Card
              SizedBox(height: 120,child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems / 2),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return UProductCardHorizontal();
                },)),

              /// Sub Category
              USectionHeadingHome(title: 'Sports Clothes', onPressed: (){}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Horizontal Product Card
              SizedBox(height: 120,child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems / 2),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return UProductCardHorizontal();
                },)),

              /// Sub Category
              USectionHeadingHome(title: 'Furniture', onPressed: (){}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Horizontal Product Card
              SizedBox(height: 120,child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems / 2),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return UProductCardHorizontal();
                },)),
              /// Sub Category
              USectionHeadingHome(title: 'Electronics', onPressed: (){}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Horizontal Product Card
              SizedBox(height: 120,child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems / 2),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return UProductCardHorizontal();
                },)),
              /// Sub Category
              USectionHeadingHome(title: 'Clothes', onPressed: (){}),
              SizedBox(height: USizes.spaceBtwItems / 2),

              /// Horizontal Product Card
              SizedBox(height: 120,child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems / 2),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return UProductCardHorizontal();
                },))
            ],
          ),
        ),
      ),
    );
  }
}