import 'package:e_commercee/common/products/product_cards/prduct_card_vertical.dart' show UProductCardVertical;
import 'package:e_commercee/common/widgets/layouts/grid_layout_home.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Filter Field
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Filter', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map((filter) {
            return DropdownMenuItem(value: filter, child: Text(filter));
          },).toList(),
        ),
        SizedBox(height: USizes.spaceBtwSections),

        /// Products
        UGridLayoutHome(itemCount: 10, itemBuilder: (context, index) => UProductCardVertical(),)
      ],
    );
  }
}