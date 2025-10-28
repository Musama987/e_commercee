import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/features/personalization/controllers/user_controller.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUserForm extends StatelessWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: UAppBar(
          showBackArrow: true, title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
          child: Padding(padding: UPadding.screenPadding,
            child: Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      validator: UValidator.validateEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: UTexts.email
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),

                    Obx(
                          () =>
                          TextFormField(
                            controller: controller.password,
                            obscureText: controller.isPasswordVisible.value,
                            validator: (value) =>
                                UValidator.validateEmptyText('password', value),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Iconsax.password_check),
                                labelText: UTexts.password,
                                suffixIcon: IconButton(onPressed: () =>
                                    controller.isPasswordVisible.toggle(),
                                    icon: Icon(controller.isPasswordVisible.value
                                        ? Iconsax.eye_slash
                                        : Iconsax.eye))
                            ),
                          ),
                    ),
                    SizedBox(height: USizes.spaceBtwSections),
                    //login button to verify
                    ElevatedButton(onPressed: controller.reAuthenticateUser, child: Text('Verify')),
                  ],
                )),
          )
      ),
    );
  }
}
