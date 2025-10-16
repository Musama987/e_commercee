import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/data/repositories/user/user_repository.dart';
import 'package:e_commercee/features/authentication/models/user_model.dart';
import 'package:e_commercee/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commercee/utils/helpers/network_manager.dart';
import 'package:e_commercee/utils/popups/full_screen_loader.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart' show UserCredential;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final _authRepository = Get.put(AuthenticationRepository());
  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  /// Function to register the user with email and password
  Future<void> registerUser() async {
    try {
      print('--- [1] Create Account button pressed. ---');
      // Start Loading
      // UFullScreenLoader.openLoadingDialog('We are processing your information...');

      // Check Internet Connectivity
      print('--- [2] Checking internet connection... ---');
      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        // UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // Check Privacy Policy
      print('--- [3] Checking privacy policy... Status: ${privacyPolicy.value} ---');
      if(!privacyPolicy.value){
        // UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Form Validation
      print('--- [4] Validating form... ---');
      if (!signUpFormKey.currentState!.validate()) return;

      // Register the user using Firebase Authentication
      print('--- [5] Calling Authentication Repository to create user... ---');

      // UserCredential userCredential = await AuthenticationRepository.instance.registerUser(email.text.trim(), password.text.trim());
      UserCredential userCredential = await _authRepository.registerUser(email.text.trim(), password.text.trim());
      // create user model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text}${lastName.text}716283',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      // save user record
      print('--- [6] Saving user data to Firestore... ---');
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);
      print('--- [SUCCESS] User data saved to Firestore. ---');

      // success message
      USnackBarHelpers.successSnackBar(title: 'Congratulations!', message: 'Your account has been created! Verify email to continue');

      // stop loading
      // UFullScreenLoader.stopLoading();

      // redirect to verify email screen
      Get.to(() => VerifyEmailScreen());
    }catch(e){
      // stop loading
      // UFullScreenLoader.stopLoading();
      print('--- [ERROR] An exception occurred: ${e.toString()} ---');
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
