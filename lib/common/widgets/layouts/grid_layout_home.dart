import 'package:e_commercee/common/products/product_cards/prduct_card_vertical.dart'
    show UProductCardVertical;
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UGridLayoutHome extends StatelessWidget {
  const UGridLayoutHome({
    super.key,
    required this.itemCount,
    this.mainAxisExtent,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    // return GridView.builder(
    //   physics: NeverScrollableScrollPhysics(),
    //   itemCount: 12,
    //   padding: EdgeInsets.zero,
    //   shrinkWrap: true,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: USizes.gridViewSpacing,
    //     crossAxisSpacing: USizes.gridViewSpacing,
    //     mainAxisExtent: 238,
    //   ),
    //   itemBuilder: (context, index) {
    //     return UProductCardVertical();
    //   },
    // );
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: USizes.gridViewSpacing,
            mainAxisSpacing: USizes.gridViewSpacing,
            mainAxisExtent: 238),
        itemBuilder: itemBuilder);
  }
}
