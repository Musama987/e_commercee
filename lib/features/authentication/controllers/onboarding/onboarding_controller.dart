import 'package:e_commercee/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends  GetxController{
  static OnBoardingController get instance => Get.find();

//variables
  final pageController  = PageController();
  RxInt currentIndex = 0.obs;


  ///update current index when page scroll
  void updatePageIndicator(index) {
    currentIndex.value = index;
  }

  ///jump to specific dot page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  //update current index and jump to next page
  void nextPage () {
    if(currentIndex.value == 2) {
      Get.offAll(()=>  LoginScreen());
      return;
    }
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);
  }

  //update current index and jump to last page
  void skipPage () {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }

}