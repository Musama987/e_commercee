import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/cart/cart_counter_icon.dart';
import 'package:e_commercee/common/textfields/searchbar.dart';
import 'package:e_commercee/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UStorePrimaryHeader extends StatelessWidget {
  const UStorePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Total Height + 10
        SizedBox(height: USizes.storePrimaryHeaderHeight + 10),

        /// Primary Header Container
        UPrimaryHeaderContainerHome(
            height: USizes.storePrimaryHeaderHeight,
            child: UAppBar(
              title: Text('Store',
                  style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
              actions: [UCartCounterIcon()],
            )),

        /// Search Bar
        USearchBar()
      ],
    );
  }
}