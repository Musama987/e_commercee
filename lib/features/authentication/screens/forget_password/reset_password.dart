import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commercee/features/authentication/screens/login/login.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController.instance);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=>Get.offAll(()=>LoginScreen()), icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
           //Image
              Image.asset(UImages.resetpasswordImage, height: UDeviceHelper.getScreenWidth(context) * 0.6),
              SizedBox(height: USizes.spaceBtwItems),
              //Title
              Text(UTexts.resetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: USizes.spaceBtwItems),
              //Email
              Text(email, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: USizes.spaceBtwItems),
              //Subtitle
              Text(UTexts.resetPasswordSubtitle, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
              SizedBox(height: USizes.spaceBtwSections),
              //Done
              UElevatedButton(onPressed: ()=> Get.offAll(()=> LoginScreen()), child: Text('Done')),
              // Resend Email
              SizedBox(
                width: double.infinity,
                  child: TextButton(onPressed: controller.resendPasswordResetEmail, child: Text('Resend Email'))),
            ],
          ),
        ),
      )
    );
  }
}
