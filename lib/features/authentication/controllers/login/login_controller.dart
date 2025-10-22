import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/features/personalization/controllers/user_controller.dart';
import 'package:e_commercee/utils/helpers/network_manager.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //variables
  final _userController = Get.put(UserController());
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();

  @override
  void onInit() {
   email.text= localStorage.read('Remember_email') ?? '';
   password.text= localStorage.read('Remember_password') ?? '';
    super.onInit();
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      //loader
      // UFullScreenLoader.openLoadingDialog('Logging You in...');

      //check internet activity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        //UFullscreenLoader.stopLoading();
        return;
      }
      //save Data If remember me check
      if (rememberMe.value) {
        localStorage.write('Remember_email', email.text.trim());
        localStorage.write('Remember_password', password.text.trim());
      }
      //Login User with Email nad password
      await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      //UFullscreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //UFullscreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(
        title: 'Login failed',
        message: e.toString(),
      );
    }
  }


  //Google Sign In With Authentications
Future<void> googleSignIn() async{
    try{
      //loader
      // UFullScreenLoader.openLoadingDialog('Logging You in...');

      //check internet activity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      //Google Authentication
     UserCredential userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      //Save user record
      await _userController.saveUserRecord(userCredential);


      //UFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      //UFullScreenLoader.stopLoading();

      //Error Snack Bar
      USnackBarHelpers.errorSnackBar(title: 'Login failed', message: e.toString());

    }
}
}
