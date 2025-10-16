// import 'package:e_commercee/utils/constants/colors.dart';
// import 'package:e_commercee/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class UFullScreenLoader{
//
//   static void openLoadingDialog(String text, String animation){
//     class UFullScreenLoader {
//     static void openLoadingDialog(String text) {
//     showDialog(
//
//     context: Get.overlayContext!,
//     barrierDismissible: false,
//     builder: (_) => PopScope(
//     canPop: false,
//     // canPop: false,
//     child: Container(
//     color: UHelperFunctions.isDarkMode(Get.context!) ? UColors.dark : UColors.white,
//     // color: UHelperFunctions.isDarkMode(Get.context!) ? UColors.dark : UColors.white,
//     width: double.infinity,
//     height: double.infinity,
//     child: Column(
//     children: [
//     const SizedBox(height: 250,),
//     /// Extra Space
//     const SizedBox(height: 250),
//
//     HkAnimationLoader(text: text, animation: animation)
//     /// Animation
//     UAnimationLoader(text: text)
//     ],
//     ),
//     )
//     )
//     );
//     )));
//     }
//
//     static stopLoading(){
//
//     static stopLoading() {
//     Navigator.of(Get.overlayContext!).pop();
//     }
//     }
//     }