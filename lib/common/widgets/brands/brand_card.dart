import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/home_banner_images/rounded_images.dart';
import 'package:e_commercee/common/texts/brand_title_with_verify_icons.dart';
import 'package:e_commercee/utils/constants/enums.dart' show TextSizes;
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key,
    this.showBorder = true
  });

  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return URoundedContainer(
      height: USizes.brandCardHeight,
      showBorder: showBorder,
      padding: EdgeInsets.all(USizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          /// Brand Image
          Flexible(child: URoundedImageHome(
            imageUrl: UImages.batalogo,
            backgroundColor: Colors.transparent,
          )),
          SizedBox(width: USizes.spaceBtwItems / 2),

          /// Right Portion
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Brand Name & verify Icon
                UBrandTitleWithVerifyIcon(title: 'Bata', brandTextSize: TextSizes.large),

                /// Text
                Text('172 products',
                    style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}