
import 'package:e_commercee/common/home_banner_images/user_profile_logo.dart';
import 'package:e_commercee/common/icons/circular_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class UserProfileWithEditIcon extends StatelessWidget {
  const UserProfileWithEditIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// User Profile Logo
        Center(child: UserProfileLogo()),

        /// Edit Icons
        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(child: UCircularIcon(icon: Iconsax.edit)))
      ],
    );
  }
}