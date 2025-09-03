import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ULoginDivider extends StatelessWidget {
  const ULoginDivider({
    super.key,
   required this.title,
  });

 final String title;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.5,
            color: dark ? UColors.darkGrey : UColors.grey,
          ),
        ),
        Text(title, style: Theme.of(context).textTheme.labelMedium),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            thickness: 0.5,
            color: dark ? UColors.darkGrey : UColors.grey,
          ),
        ),
      ],
    );
  }
}