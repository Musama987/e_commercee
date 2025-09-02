import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

import 'package:e_commercee/common/widgets/button/elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //header title & subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    UTexts.loginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: USizes.sm),
                  Text(
                    UTexts.loginSubtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwSections),
              //form
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: UTexts.email,
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: UTexts.password,
                      suffixIcon: Icon(Iconsax.eye),
                    ),
                  ),
                  SizedBox(height: USizes.spaceBtwInputFields / 2),

                  //remember me & forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Text(UTexts.rememberMe),
                        ],
                      ),
                      //forgot password
                      TextButton(
                        onPressed: () {},
                        child: Text(UTexts.forgetPassword),
                      ),
                    ],
                  ),

                  SizedBox(height: USizes.spaceBtwSections),
                  //Sign in
                  UElevatedButton(onPressed: () {}, child: Text(UTexts.signIn)),
                  SizedBox(height: USizes.spaceBtwItems / 2),
                  //create Account
                  UElevatedButton(
                    onPressed: () {},
                    child: Text(UTexts.createAccount),
                  ),
                ],
              ),
              SizedBox(height: USizes.spaceBtwSections),
              //Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 60,
                      endIndent: 5,
                      thickness: 0.5,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Text(UTexts.orSignInWith, style: Theme.of(context).textTheme.labelMedium),
                  Expanded(
                    child: Divider(
                      indent: 5,
                      endIndent: 60,
                      thickness: 0.5,
                      color: Colors.grey.shade300,
                    ),
                  ),
          ],
              ),
             SizedBox(height: USizes.spaceBtwSections),
              //social Button

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: UColors.grey),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: IconButton(onPressed: (){}, icon: Image.asset(UImages.googleIcon, height: USizes.iconMd, width: USizes.iconMd,)),
                  ),
                  SizedBox(width: USizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: UColors.grey),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: IconButton(onPressed: (){}, icon: Image.asset(UImages.facebookIcon, height: USizes.iconMd, width: USizes.iconMd,)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
