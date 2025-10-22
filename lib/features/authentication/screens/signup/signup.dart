import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/common/widgets/button/login_social_button.dart';
import 'package:e_commercee/common/widgets/login_signup/login_divider.dart';
import 'package:e_commercee/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:e_commercee/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Header
              ///Title
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: USizes.spaceBtwSections),
              //Form
              Form(
                key: controller.signUpFormKey,
                child: Column(
                  children: [
                    //First Name & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.firstName,
                            validator: (value) => UValidator.validateEmptyText(
                              'First Name',
                              value,
                            ),
                            decoration: InputDecoration(
                              labelText: UTexts.firstName,
                              labelStyle: TextStyle(),
                              prefixIcon: Icon(Iconsax.user),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: USizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            controller: controller.lastName,
                            validator: (value) => UValidator.validateEmptyText(
                              'Last Name',
                              value,
                            ),
                            decoration: InputDecoration(
                              labelText: UTexts.lastName,
                              prefixIcon: Icon(Iconsax.user),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),

                    //Email Password
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => UValidator.validateEmail(value),
                      decoration: InputDecoration(
                        labelText: UTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          UValidator.validatePhoneNumber(value),
                      decoration: InputDecoration(
                        labelText: UTexts.phoneNumber,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    SizedBox(height: USizes.spaceBtwInputFields),
                    Obx(
                      () => TextFormField(
                        obscureText: controller.isPasswordVisible.value,
                        controller: controller.password,
                        validator: (value) =>
                            UValidator.validatePassword(value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: UTexts.password,
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.isPasswordVisible.value =
                                    !controller.isPasswordVisible.value,
                            icon: Icon(
                              controller.isPasswordVisible.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: USizes.spaceBtwInputFields / 2),
                    //checkbox
                    Row(
                      children: [
                        Obx(
                          ()=> Checkbox(
                            value: controller.privacyPolicy.value,
                            onChanged: (value)=>
                                controller.privacyPolicy.value = value!,
                          ),
                        ),
                        //privacy policy
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontSize: 12, wordSpacing: -2),
                              children: [
                                TextSpan(text: ' ${UTexts.iAgreeTo} '),
                                TextSpan(
                                  text: ' ${UTexts.privacyPolicy} ',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: dark
                                            ? UColors.white
                                            : UColors.primary,
                                        fontSize: 12,
                                        wordSpacing: -2,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? UColors.white
                                            : UColors.primary,
                                      ),
                                ),
                                TextSpan(text: '${UTexts.and} '),
                                TextSpan(
                                  text: ' ${UTexts.termsOfUse} ',
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: dark
                                            ? UColors.white
                                            : UColors.primary,
                                        fontSize: 12,
                                        wordSpacing: -2,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? UColors.white
                                            : UColors.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: USizes.spaceBtwItems),
                    //create Account
                    UElevatedButton(
                      // onPressed: ()=>Get.to(()=> VerifyEmailScreen()),
                      onPressed: controller.registerUser,
                      child: Text(UTexts.createAccount),
                    ),
                  ],
                ),
              ),
              SizedBox(height: USizes.spaceBtwSections),

              //Divider
              ULoginDivider(title: UTexts.orSignUpWith),
              SizedBox(height: USizes.spaceBtwSections),
              //footer
              ULoginSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
