import 'package:e_commercee/common/home_banner_images/user_profile_logo.dart';
import 'package:e_commercee/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProfilePrimaryHeader extends StatelessWidget {
  const UProfilePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Total Height
        SizedBox(height: USizes.profilePrimaryHeaderHeight + 60),

        /// Primary Header
        UPrimaryHeaderContainerHome(height: USizes.profilePrimaryHeaderHeight, child: Container()),

        /// User Profile
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(child: UserProfileLogo()),
        ),
      ],
    );
  }
}