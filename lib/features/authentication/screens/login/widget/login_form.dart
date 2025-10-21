import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commercee/features/authentication/screens/forget_password/forget_password.dart';
import 'package:e_commercee/features/authentication/screens/signup/signup.dart';
import 'package:e_commercee/navigation_menu.dart' show NavigationMenu;
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

//   @override
//   State<ULoginForm> createState() => _ULoginFormState();
// }
//
// class _ULoginFormState extends State<ULoginForm> {
  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TextFormField(
        controller: controller.email,
        validator: (value) => UValidator.validateEmail(value),
        decoration: InputDecoration(
          prefixIcon: Icon(Iconsax.direct_right),
          labelText: UTexts.email,
        ),
      ),
      SizedBox(height: USizes.spaceBtwInputFields),
      Obx(
            () =>
            TextFormField(
              validator: (value) => UValidator.validateEmptyText('password', value),
              controller: controller.password,
              obscureText: controller.isPasswordVisible.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UTexts.password,
                suffixIcon: IconButton(
                  onPressed: () =>
                  controller.isPasswordVisible.value =
                  !controller.isPasswordVisible.value,
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash,
                  ),
                ),
              ),
            ),
      ),
      SizedBox(height: USizes.spaceBtwInputFields / 2),

      //remember me & forgot password
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(
                      () =>
                      Checkbox(value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.toggle())
              ),
              Text(UTexts.rememberMe),
            ],
          ),
          //forgot password
          TextButton(
            onPressed: () => Get.to(() => ForgetPasswordScreen()),
            child: Text(UTexts.forgetPassword),
          ),
        ],
      ),

      SizedBox(height: USizes.spaceBtwSections),
      //Sign in
      UElevatedButton(onPressed: () => Get.to(() => NavigationMenu()),
          child: Text(UTexts.signIn)),
      SizedBox(height: USizes.spaceBtwItems / 2),
      //create Account
      SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: controller.loginWithEmailAndPassword,
          child: Text(UTexts.createAccount),
        ),
      ),
    ],
    ),
    );
  }
}