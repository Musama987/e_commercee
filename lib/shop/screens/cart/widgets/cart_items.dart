import 'package:e_commercee/common/products/cart/cart_item.dart';
import 'package:e_commercee/common/products/cart/product_quantity_with_value_and_remove.dart';
import 'package:e_commercee/common/texts/product_price_text.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({
    super.key,
 this.showAddRemoveButtons= true
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: USizes.spaceBtwItems),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            //cart Items
            UCartItem(),
            if(showAddRemoveButtons) SizedBox(height: USizes.spaceBtwItems),

            //Price icons and counter
            if(showAddRemoveButtons) Row(
              children: [
                SizedBox(width: 70.0),

                UProductQuantityWithAddRemove(),
                Spacer(),
                UProductPriceText(price: '323'),
              ],
            ),
          ],
        );
      },
    );
  }
}
