import 'package:e_commercee/common/custom_shapes/rounded_edges_container.dart';
import 'package:e_commercee/common/style/shadow.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow:UShadow.verticalProductShadow,
        borderRadius: BorderRadius.circular(
            USizes.productImageRadius,
        ),
        color: dark ? UColors.darkGrey : UColors.white,
      ),
      child: Column(
        children: [
          //Thumbnil favourit button  discount tag,

]
      ),
    );
  }
}