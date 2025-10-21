import 'dart:async';

import 'package:e_commercee/common/screens/success_screen.dart';
import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/texts.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //variables

  //Send Email Verification Link to Current User

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Please Check your inbox and verify email',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            title: UTexts.accountCreateTitle,
            subtitle: UTexts.accountCreateSubtitle,
            image: UImages.resetpasswordImage,
            onTap: () =>AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

//Manually check if email is verified
  Future<void> checkEmailVerificationStatus() async{
    try{
      final currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser!= null && currentUser.emailVerified){
        Get.off(
              () => SuccessScreen(
            title: UTexts.accountCreateTitle,
            subtitle: UTexts.accountCreateSubtitle,
            image: UImages.resetpasswordImage,
            onTap: () =>AuthenticationRepository.instance.screenRedirect(),
          ),
        );

      }
  }catch(e){

  }

}
}
