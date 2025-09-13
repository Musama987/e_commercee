import 'package:e_commercee/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key,
    this.height = 400,
   this.width = 400,
   this.backgroundColor = UColors.white,
    this.padding,
    this.margin,
    this.radius = 500,
    this.child,
  });
  final double height, width, radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry ? padding, margin;
  final Widget ? child;

  @override
  Widget build(BuildContext context) {

    return Container(
      // height: UDeviceHelper.getScreenHeight(context) * 0.4,
      // width: UDeviceHelper.getScreenWidth(context),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(500),
      //   color: UColors.white.withValues(alpha: 0.1),
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}