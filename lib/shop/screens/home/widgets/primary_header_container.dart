import 'package:e_commercee/common/custom_shapes/circular_container_home.dart';
import 'package:e_commercee/common/custom_shapes/rounded_edges_container.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UPrimaryHeaderContainerHome extends StatelessWidget {
  const UPrimaryHeaderContainerHome({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return URoundedEdges(
      child: Container(
        height: USizes.primaryHeaderHeight,
        color: UColors.primary,
        child: Stack(
          children: [
          //circular container
          // Positioned(
          //   top: -148,
          //   left: 237,
          //   child: UCircularContainer(
          //     height: UDeviceHelper.getScreenHeight(context) * 0.4,
          //     width: UDeviceHelper.getScreenWidth(context) * 0.5,
          //     backgroundColor: UColors.white.withValues(alpha: 0.1),
          //     radius: 500,
          //   ),
          // ),
          //circular container
            Positioned(
              top: -70,
              right: -70,
              child: UCircularContainer(
                height: 230,
                width: 200,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
          // Positioned(
          //   top: 100,
          //   left: 290,
          //   child: UCircularContainer(
          //     height: UDeviceHelper.getScreenHeight(context) * 0.4,
          //     width: UDeviceHelper.getScreenWidth(context) * 0.4,
          //     backgroundColor: UColors.white.withValues(alpha: 0.1),
          //     radius: 500,
          //   ),
          // ),
            Positioned(
              top: 90,
              right: -150,
              child: UCircularContainer(
                height: 250,
                width: 230,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
          //child
          child
        ],
        ),
      ),
    );
  }
}

