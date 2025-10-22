import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/features/authentication/screens/forget_password/reset_password.dart';
import 'package:e_commercee/utils/helpers/network_manager.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();


  //variables
final email = TextEditingController();
final forgetPasswordFormKey = GlobalKey<FormState>();

//Send Email to forget password
Future<void>sendPasswordResetEmail() async{
  try
  {
    // Start Loading
    // UFullScreenLoader.openLoadingDialog('We are processing your information...');

    // Check Internet Connectivity
    // print('--- [2] Checking internet connection... ---');
    bool isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      // UFullScreenLoader.stopLoading();
      USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
      return;
    }
    //Form validator
    if(!forgetPasswordFormKey.currentState!.validate()){
      // UFullScreenLoader.stopLoading();
      return;
    }

    //Send Email To Reset Password
    AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

    // UFullScreenLoader.stopLoading();

    //Success Message
    USnackBarHelpers.successSnackBar(title: 'Email Sent', message: 'Email Link  send to Reset your email');

    //Redirect
    Get.to(()=> ResetPasswordScreen(email: email.text.trim()));

  }catch(e){
    // UFullScreenLoader.stopLoading();
    USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
  }
}


  Future<void>resendPasswordResetEmail() async{
    try
    {
      // Start Loading
      // UFullScreenLoader.openLoadingDialog('We are processing your information...');

      // Check Internet Connectivity
      // print('--- [2] Checking internet connection... ---');
      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        // UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      //Send Email To Reset Password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text);

      // UFullScreenLoader.stopLoading();

      //Success Message
      USnackBarHelpers.successSnackBar(title: 'Email Sent', message: 'Email Link  send to Reset your email');
    }catch(e){
      // UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
    }
  }


}