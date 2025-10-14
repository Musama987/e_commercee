import 'package:e_commercee/common/custom_shapes/circular_container_home.dart';
import 'package:e_commercee/common/custom_shapes/rounded_edges_container.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UPrimaryHeaderContainerHome extends StatelessWidget {
  const UPrimaryHeaderContainerHome({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return URoundedEdges(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -70,
              right: -70,
              child: UCircularContainer(
                height: 230,
                width: 200,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),

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

