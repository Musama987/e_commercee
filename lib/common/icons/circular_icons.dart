import 'package:e_commercee/app_service.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UCircularIcon extends StatelessWidget {
  const UCircularIcon({
    super.key,
    required this.icon,
    this.size = USizes.iconMd,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.color,
    required this.appService,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;
  final AppService appService;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: (backgroundColor != null)
              ? backgroundColor
              : dark
              ? UColors.dark.withValues(alpha: 0.2)
              : UColors.light.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(1000)),
      child: IconButton(onPressed: (){
        appService.isWishListed.value =
        !appService.isWishListed.value;

      }, icon: Icon(icon, color: color, size: size)),
    );
  }
}