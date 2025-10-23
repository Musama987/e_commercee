
import 'package:e_commercee/common/home_banner_images/circular_image.dart' show UCircularImage;
import 'package:e_commercee/features/personalization/controllers/user_controller.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:flutter/material.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;

    return UCircularImage(image: isProfileAvailable ? controller.user.value.profilePicture : UImages.profile, height: 120.0, width: 120.0, borderWidth: 5.0, padding: 0,
    isNetworkImage: isProfileAvailable);
  }
}