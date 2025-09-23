import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

import 'widgets/profile_primary_header.dart';
import 'widgets/settings_menu_tile.dart';
import 'widgets/user_profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Primary Header
            UProfilePrimaryHeader(),

            /// Details
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  /// User Profile Details
                  UserProfileTile(),
                  SizedBox(height: USizes.spaceBtwItems),

                  /// Account Settings Heading
                  USectionHeadingHome(title: 'Account Settings', showActionButton: false),

                  /// Settings Menu
                  SettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set shopping delivery addresses',
                      // onTap: () => Get.to(() => AddressScreen())
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    // onTap: () {},
                  ),
                  SettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In-progress and Completed Orders',
                      // onTap: () => Get.to(() => OrderScreen())
                  ),
                  SizedBox(height: USizes.spaceBtwSections),

                  /// Logout
                  SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: Text('Logout'))),
                  SizedBox(height: USizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
