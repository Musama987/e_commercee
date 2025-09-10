import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/cart/cart_counter_icon.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:flutter/material.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title $ Subtitle
          Text(
            UTexts.homeappbartitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.white),
          ),
          Text(
            UTexts.homeappbarsubtitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
        ],
      ),

      actions: [
        UCartCounterIcon(),
      ],
    );
  }
}