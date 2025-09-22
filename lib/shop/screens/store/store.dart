import 'package:e_commercee/common/appbar/tabbar.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/common/widgets/brands/brand_card.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/category_tab.dart';
import 'widgets/store_primary_header.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 340,
                  pinned: true,
                  floating: false,
                  flexibleSpace: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Primary Header
                        UStorePrimaryHeader(),
                        SizedBox(height: USizes.spaceBtwItems),

                        /// Brands List
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
                          child: Column(
                            children: [
                              /// Brands Heading
                              USectionHeadingHome(title: 'Brands', onPressed: () {}),

                              /// Brand Cards
                              SizedBox(
                                height: USizes.brandCardHeight,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(width: USizes.spaceBtwItems),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      SizedBox(width: USizes.brandCardWidth, child: UBrandCard()),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  bottom: UTabBar(tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ]),
                ),
              ];
            },
            body:
            TabBarView(children: [
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
              UCategoryTab(),
            ])
        ),
      ),
    );
  }
}
