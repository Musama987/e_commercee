import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/cart/cart_counter_icon.dart';
import 'package:e_commercee/features/personalization/controllers/user_controller.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title $ Subtitle
          Text(
            UHelperFunctions.getGreetingMessage(),
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.white),
          ),
          Obx(
            (){
              if(controller.profileLoading.value){
                return const CircularProgressIndicator();
              }
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: UColors.white),
              );
            }
          ),
        ],
      ),

      actions: [
        UCartCounterIcon(),
      ],
    );
  }
}