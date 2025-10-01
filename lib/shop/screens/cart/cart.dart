import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/cart/cart_item.dart';
import 'package:e_commercee/common/products/cart/product_quantity_with_value_and_remove.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/texts/product_price_text.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

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
          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: USizes.spaceBtwItems,),
              itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [

                  //cart Items
                  UCartItem(),
                  SizedBox(height: USizes.spaceBtwItems),

                  //Price icons and counter
                  Row(
                    children: [
                      SizedBox(width: 70.0),

                      UProductQuantityWithAddRemove(),
                      Spacer(),
                      UProductPriceText(price: '323'),
                    ],
                  )

                ],
              );
            },
          )
          ),

      /// ------[BottomNavigation]------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(onPressed: (){}, child: Text('Checkout \$263527')),
      ),
      );
  }
}



