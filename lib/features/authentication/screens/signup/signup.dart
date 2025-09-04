import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/common/widgets/button/login_social_button.dart';
import 'package:e_commercee/common/widgets/login_signup/login_divider.dart';
import 'package:e_commercee/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool a = true;

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: [
                  //First Name & Last Name
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
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
                    decoration: InputDecoration(
                      labelText: UTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: UTexts.phoneNumber,
                      prefixIcon: Icon(Iconsax.call),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: UTexts.password,
                      suffixIcon: Icon(Iconsax.eye),
                    ),
                  ),

                  SizedBox(height: USizes.spaceBtwInputFields / 2),
                  //checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: a,
                        onChanged: (value) {
                          // print(a);
                          setState(() {
                            a = value ?? false;
                          });
                        },
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
                                      color: dark ? UColors.white : UColors.primary,
                                      fontSize: 12,
                                      wordSpacing: -2,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark ? UColors.white : UColors.primary,
                                    ),
                              ),
                              TextSpan(text: '${UTexts.and} '),
                              TextSpan(
                                text: ' ${UTexts.termsOfUse} ',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                     color: dark ? UColors.white : UColors.primary,
                                      fontSize: 12,
                                      wordSpacing: -2,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark ? UColors.white : UColors.primary,
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
                      onPressed: ()=>Get.to(()=> VerifyEmailScreen()),
                      child: Text(UTexts.createAccount)),
                ],
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
