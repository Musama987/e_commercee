import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/features/personalization/controllers/change_name_controller.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true, title: Text('Update Name',style: Theme.of(context).textTheme.titleLarge)),

        //Body
        body:SingleChildScrollView(
          child: Padding(padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              //Text Heading
              Text('Update Your name to keep your profile accurate and personalized',style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: USizes.spaceBtwSections),

              Form(
                key: controller.updateUserFormKey,
                  child:Column(
                    children: [
                      //First Name
                    TextFormField(
                    controller: controller.firstName,
                    validator: (value) => UValidator.validateEmptyText('First Name', value),
                    decoration: InputDecoration(
                      labelText: UTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                      SizedBox(height: USizes.spaceBtwInputFields),

                      //Last Name
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) => UValidator.validateEmptyText('Last Name', value),
                        decoration: InputDecoration(
                            labelText: UTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                      ),
                      SizedBox(height: USizes.spaceBtwInputFields),
                      //Save Button

                      UElevatedButton(onPressed: controller.updateUserName, child: Text('Save')),
                    ],
                  )
              )


            ],

          ),
          ),
        ));
  }
}
