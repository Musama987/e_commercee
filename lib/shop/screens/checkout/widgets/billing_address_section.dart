import 'package:e_commercee/common/texts/section_heading.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// [Text] - Billing Address
        USectionHeadingHome(title: 'Billing Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Usama Ramzan', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.phone, size: USizes.iconSm, color: UColors.darkGrey),
            SizedBox(width: USizes.spaceBtwItems),
            Text('+92 3123456788')
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.location_history, size: USizes.iconSm, color: UColors.darkGrey),
            SizedBox(width: USizes.spaceBtwItems),
            Expanded(child: Text('House No.295, Multan, Punjab, Pakistan', softWrap: true))
          ],
        )
      ],
    );
  }
}