import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
             // Header
              Text(UTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: USizes.spaceBtwItems / 2),

              Text(UTexts.forgetPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium?.copyWith(
                height: 2,
              ),
              ),
              SizedBox(height: USizes.spaceBtwSections * 1.5),

              //Form
              Column(
                children: [
                  Form(
                    key: controller.forgetPasswordFormKey,
                    child: TextFormField(
                      controller: controller.email,
                      validator: (value)=> UValidator.validateEmail(value),
                      decoration: InputDecoration(
                        labelText: UTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwItems),
                   UElevatedButton(
                       onPressed: controller.sendPasswordResetEmail ,
                       child: Text(UTexts.submit)),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
