import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/features/personalization/controllers/user_controller.dart';
import 'package:e_commercee/features/personalization/screens/change_name/change_name.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/user_detail_row.dart';
import 'widgets/user_profile_with_edit_icon.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Edit Profile', style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [

              /// User Profile with edit Icon
              UserProfileWithEditIcon(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              /// Account Settings Heading
              USectionHeadingHome(title: 'Account Settings', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              /// Account Details
              UserDetailRow(title: 'Name', value: controller.user.value.fullName, onTap: ()=> Get.to(()=>ChangeNameScreen())),
              UserDetailRow(title: 'Username', value: controller.user.value.username, onTap: (){}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              /// Profile Section Heading
              USectionHeadingHome(title: 'Profile Settings', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              /// Profile Settings
              UserDetailRow(title: 'User ID', value:controller.user.value.id, onTap: (){}),
              UserDetailRow(title: 'Email', value: controller.user.value.email, onTap: (){}),
              UserDetailRow(title: 'Phone Number', value: '+92 ${controller.user.value.phoneNumber}', onTap: (){}),
              UserDetailRow(title: 'Gender', value: 'Male', onTap: (){}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              TextButton(onPressed: (){}, child: Text('Close Account', style: TextStyle(color: Colors.red),))

            ],
          ),
        ),
      ),

    );
  }
}