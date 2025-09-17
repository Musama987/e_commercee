import 'package:e_commercee/common/products/product_cards/prduct_card_vertical.dart' show UProductCardVertical;
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UGridLayoutHome extends StatelessWidget {
  const UGridLayoutHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: USizes.gridViewSpacing,
        crossAxisSpacing: USizes.gridViewSpacing,
        mainAxisExtent: 238,
      ),
      itemBuilder: (context, index) {
        return UProductCardVertical();
      },
    );
  }
}