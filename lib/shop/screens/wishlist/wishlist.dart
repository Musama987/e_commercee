import 'package:e_commercee/app_service.dart';
import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/icons/circular_icons.dart';
import 'package:e_commercee/common/products/product_cards/prduct_card_vertical.dart';
import 'package:e_commercee/common/widgets/layouts/grid_layout_home.dart';
import 'package:e_commercee/navigation_menu.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/product_model.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: UAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          UCircularIcon(
            icon: Iconsax.add,
            appService: AppService(),
            onPressed: () =>
                NavigationController.instanace.selectedindex.value = 0,
          ),
        ],
      ),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: UGridLayoutHome(
            itemCount: 12,
            itemBuilder: (context, index) => UProductCardVertical(
              model: ProductModel(
                id: "",
                name: "",
                brandName: "brandName",
                price: 0,
                description: "",
                status: "",
                discount: 0,
              ),
              appService: AppService(),
              onPressed: ()=> null,
            ),
          ),
        ),
      ),
    );
  }
}
