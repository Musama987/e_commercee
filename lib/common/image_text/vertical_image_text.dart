// import 'package:e_commercee/common/custom_shapes/circular_container_home.dart';
// import 'package:e_commercee/utils/constants/colors.dart' show UColors;
// import 'package:e_commercee/utils/constants/sizes.dart';
// import 'package:e_commercee/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
//
// class UVerticalImageText extends StatelessWidget {
//   const UVerticalImageText({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.textColor,
//     this.backgroundColor,
//     this.onTap,
//   });
//
//   final String title, image;
//   final Color textColor;
//   final Color? backgroundColor;
//   final VoidCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     bool dark = UHelperFunctions.isDarkMode(context);
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           //Image
//           UCircularContainer(
//             height: 56,
//             width: 56,
//             backgroundColor:
//                 backgroundColor ?? (dark ? UColors.black : UColors.light),
//             padding: EdgeInsets.all(USizes.sm),
//             child: Image(image: AssetImage(image), fit: BoxFit.cover),
//           ),
//           SizedBox(height: USizes.spaceBtwItems / 2),
//
//           //textCategory
//           SizedBox(
//             width: 55,
//             child: Text(
//               title,
//               style: Theme.of(
//                 context,
//               ).textTheme.labelSmall!.apply(color: textColor),
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = UColors.white,
    this.backgroundColor, // Removed default white to allow dark mode logic to work
    this.onTap,
    this.isNetworkImage = false, // Add this flag
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage; // Add this flag
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(USizes.sm),
              decoration: BoxDecoration(
                  color:
                  backgroundColor ?? (dark ? UColors.dark : UColors.light),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  // Use NetworkImage if isNetworkImage is true, else AssetImage
                  image: isNetworkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider, // Cast to common type
                  fit: BoxFit.cover,
                  // Don't tint network images, but do tint local asset icons
                  // color: isNetworkImage ? null : (dark ? UColors.light : UColors.dark),
                ),
              ),
            ),

            //text
            const SizedBox(height: USizes.spaceBtwItems / 2),
            Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
    );
  }
}