import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UBillingPaymentSection extends StatelessWidget {
  const UBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [

        /// [Text] - Payment Method
        USectionHeadingHome(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){}),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [

            /// Payment logo
            URoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? UColors.light : UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(image: AssetImage(UImages.mastercard),fit: BoxFit.contain),
            ),
            SizedBox(width: USizes.spaceBtwItems / 2),

            /// Payment Name
            Text('Master Card', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}