import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/shop/screens/checkout/checkout.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/cart_items.dart' show UCartItems;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ------[AppBar]------
      appBar: UAppBar(showBackArrow: true, title: Text('Cart', style: Theme
          .of(context)
          .textTheme
          .headlineMedium)),

      /// ------[Body]------
      body: Padding(
          padding: UPadding.screenPadding,
          child: UCartItems()
          ),

      /// ------[BottomNavigation]------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(onPressed: () => Get.to(()=>CheckOutScreen()), child: Text('Checkout \$263527')),
      ),
      );
  }
}





