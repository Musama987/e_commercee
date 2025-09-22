import 'package:e_commercee/shop/screens/store/store.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

import 'shop/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool dark =UHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Obx(()=> controller.screens[controller.selectedindex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          backgroundColor: dark ? UColors.dark : UColors.light,
          indicatorColor: dark ? UColors.light.withValues(alpha: 0.1) : UColors.dark.withValues(alpha: 0.1),
          selectedIndex: controller.selectedindex.value,
          onDestinationSelected: (index) {
            controller.selectedindex.value = index;
          },
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt selectedindex = 0.obs;

  List <Widget> screens = [HomeScreen(), StoreScreen(), Container(color: Colors.green), Container(color: Colors.yellow)];
}
