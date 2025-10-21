import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: AuthenticationRepository.instance.logout, icon: Icon(CupertinoIcons.clear)),
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
                Text(UTexts.verifyEmailTitle, style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: USizes.spaceBtwItems),
                //Email
                Text(email ?? '', style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: USizes.spaceBtwItems),
                //Subtitle
                Text(UTexts.verifyEmailSubtitle, style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
                SizedBox(height: USizes.spaceBtwSections),
                //Continue
                UElevatedButton(
                    // onPressed: ()=>Get.to(()=> SuccessScreen(
                    //   title: UTexts.accountCreateTitle,
                    //   subtitle: UTexts.accountCreateSubtitle,
                    //   image: UImages.accountcreatedImage,
                    //   onTap: (){},
                  onPressed: controller.checkEmailVerificationStatus,
                    child: Text('Continue')),
                // Resend Email
                SizedBox(
                    width: double.infinity,
                    child: TextButton(onPressed: controller.sendEmailVerification, child: Text('Resend Email'))),
              ],
            ),
          ),
        )
    );
  }
}
