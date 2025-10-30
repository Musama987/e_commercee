// import 'package:e_commercee/common/image_text/vertical_image_text.dart';
// import 'package:e_commercee/shop/screens/sub_category/sub_category.dart';
// import 'package:e_commercee/utils/constants/colors.dart';
// import 'package:e_commercee/utils/constants/images.dart';
// import 'package:e_commercee/utils/constants/sizes.dart';
// import 'package:e_commercee/utils/constants/texts.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class UHomeCategories extends StatelessWidget {
//   const UHomeCategories({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: USizes.spaceBtwSections),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             UTexts.hometitlecategory,
//             style: Theme.of(
//               context,
//             ).textTheme.headlineSmall!.apply(color: UColors.white),
//           ),
//           SizedBox(height: USizes.spaceBtwItems),
//           SizedBox(
//             height: 80,
//             child: ListView.separated(
//               separatorBuilder: (context, index) =>
//                   SizedBox(width: USizes.spaceBtwItems),
//               scrollDirection: Axis.horizontal,
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return UVerticalImageText(
//                   title: 'Sports Categories',
//                   image: UImages.runningIcon,
//                   textColor: UColors.white,
//                   onTap: ()=> Get.to(()=> SubCategoryScreen()),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:e_commercee/common/image_text/vertical_image_text.dart';
import 'package:e_commercee/shop/screens/home/home_controller.dart';
import 'package:e_commercee/shop/screens/sub_category/sub_category.dart';
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            UTexts.hometitlecategory,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),
          const SizedBox(height: USizes.spaceBtwItems),

          // Categories
          SizedBox(
            height: 80, // Added SizedBox to constrain the ListView height
            child: Obx(() {
              // // 1. Check if loading
              // if (categoryController.isLoading.value) {
              //   return const UCategoryShimmer();
              // }

              // 2. Check if list is empty
              if (controller.featuredCategories.isEmpty) {
                return Center(
                    child: Text('No Categories Found!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)));
              }

              // 3. Display categories
              return ListView.separated(
                itemCount: controller.featuredCategories.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: USizes.spaceBtwItems);
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // This line is safe now because of the checks above
                  final category = controller.featuredCategories[index];
                  return UVerticalImageText(
                    image: UImages.runningIcon,
                    title: category.name,
                    isNetworkImage: false,
                    onTap: () => Get.to(() => const SubCategoryScreen()),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

