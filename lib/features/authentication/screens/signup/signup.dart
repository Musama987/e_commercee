import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            // prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                      ),
                      SizedBox(width: USizes.spaceBtwInputFields),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: UTexts.lastName,
                            // prefixIcon: Icon(Iconsax.user),
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
                      prefixIcon: Icon(Iconsax.direct_right),
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

                  SizedBox(height: USizes.spaceBtwInputFields),
                  //checkbox
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(text: ' ${UTexts.iAgreeTo} '),
                            TextSpan(
                              text: ' ${UTexts.privacyPolicy} ',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: UColors.primary,
                                    decoration: TextDecoration.underline, decorationColor: UColors.primary
                                  ),
                            ),
                            TextSpan(text: '${UTexts.and} '),
                            TextSpan(
                              text: ' ${UTexts.termsOfUse} ',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                  color: UColors.primary,
                                  decoration: TextDecoration.underline, decorationColor: UColors.primary
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
