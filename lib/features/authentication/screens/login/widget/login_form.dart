import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/features/authentication/screens/forget_password/forget_password.dart';
import 'package:e_commercee/features/authentication/screens/signup/signup.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class ULoginForm extends StatefulWidget {
  const ULoginForm({
    super.key,
  });

  @override
  State<ULoginForm> createState() => _ULoginFormState();
}

class _ULoginFormState extends State<ULoginForm> {
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return Column(
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
            prefixIcon: Icon(Iconsax.password_check),
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
                Checkbox(value: a, onChanged: (value) {
                  // print(a);
                  setState(() {
                    a = value ?? false;
                  });
                }),
                Text(UTexts.rememberMe),
              ],
            ),
            //forgot password
            TextButton(
              onPressed: ()=>Get.to(()=>ForgetPasswordScreen()),
              child: Text(UTexts.forgetPassword),
            ),
          ],
        ),

        SizedBox(height: USizes.spaceBtwSections),
        //Sign in
        UElevatedButton(onPressed: () {}, child: Text(UTexts.signIn)),
        SizedBox(height: USizes.spaceBtwItems / 2),
        //create Account
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: ()=>Get.to(()=>SignupScreen()),
            child: Text(UTexts.createAccount),
          ),
        ),
      ],
    );
  }
}