import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/features/personalization/screens/profile/profile.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'widgets/user_detail_row.dart';
import 'widgets/user_profile_with_edit_icon.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              UserDetailRow(title: 'Name', value: 'Usama Pro', onTap: (){}),
              UserDetailRow(title: 'Username', value: 'usamapro12', onTap: (){}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              /// Profile Section Heading
              USectionHeadingHome(title: 'Profile Settings', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),

              /// Profile Settings
              UserDetailRow(title: 'User ID', value: '312312', onTap: (){}),
              UserDetailRow(title: 'Email', value: 'unknownpro@gmail.com', onTap: (){}),
              UserDetailRow(title: 'Phone Number', value: '+923123456789', onTap: (){}),
              UserDetailRow(title: 'Gender', value: 'Male', onTap: (){}),
              SizedBox(height: USizes.spaceBtwItems),

              /// Divider
              Divider(),
              SizedBox(height: USizes.spaceBtwItems),

              TextButton(onPressed: ()=> Get.to(()=> ProfileScreen()), child: Text('Close Account', style: TextStyle(color: Colors.red),))

            ],
          ),
        ),
      ),

    );
  }
}