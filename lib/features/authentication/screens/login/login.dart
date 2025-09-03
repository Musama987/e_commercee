import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/login_social_button.dart';
import 'package:e_commercee/common/widgets/login_signup/login_divider.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'widget/login_form.dart';
import 'widget/login_header.dart';


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
              ULoginHeader(),
              SizedBox(height: USizes.spaceBtwSections),
              //form
              ULoginForm(),
              SizedBox(height: USizes.spaceBtwSections),
              //Divider
              ULoginDivider(title: UTexts.orSignInWith,),
             SizedBox(height: USizes.spaceBtwSections),
              //social Button
              ULoginSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}


