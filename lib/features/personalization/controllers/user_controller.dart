import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/data/repositories/user/user_repository.dart';
import 'package:e_commercee/features/authentication/models/user_model.dart';
import 'package:e_commercee/features/authentication/screens/login/login.dart';
import 'package:e_commercee/features/personalization/screens/edit_profile/widgets/re_authenticate_user_form.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:e_commercee/utils/helpers/network_manager.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //variables
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel
      .empty()
      .obs;
  RxBool profileLoading = false.obs;

  //Re Authenticate Form Variable
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;


  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  } //Function to Save User Record

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      //first update Rx variable then check if user already data store
      await fetchUserDetails();
      if(user.value.id.isEmpty){

        //convert Full Name to first name and last name
        final nameParts = UserModel.nameParts(userCredential.user!.displayName);
        final username = '${userCredential.user!.displayName}234556';

        //user models
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          username: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        //save user Record
        await _userRepository.saveUserRecord(userModel);
      }

    } catch (e) {
      USnackBarHelpers.warningSnackBar(
        title: 'Data not Saved',
        message: 'Something Went Wrong while saving  Data',
      );
    }
  }

  //
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Delete Account warning popup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(USizes.md),
      title: 'Delete Account',
      middleText: 'Are You Sure You Want To Delete Your Account?',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: USizes.lg),
          child: Text('Delete'),
        ),

      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  //Future Delete user Account
  Future<void> deleteUserAccount() async {
    try {
      // stop Loading

      //Re_Authentication User
      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!
          .providerData
          .map((e) => e.providerId)
          .first;

      //If Google Provider
      if (provider == 'google.com') {
        await authRepository.signInWithGoogle();
        await authRepository.deleteAccount();
        //stop loading
        Get.offAll(() => LoginScreen());

        //If Email/Password Provider
      } else if (provider == 'password') {
        //stop loading
        Get.to(() => ReAuthenticateUserForm());
      }
    }
    catch (e) {
      //stop loading
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

//reAuthenticate User
  Future<void> reAuthenticateUser() async {
    try {
      //UFullscreen loader
      //check internet activity
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      //Form validation
      if (!reAuthFormKey.currentState!.validate()) {
        //UFullscreen loader
        return;
      }

// Re Authenticate user with Email And  Password
    await AuthenticationRepository.instance
        .reAuthenticateUserWithEmailAndPassword(email.text.trim(), password.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      //UFullscreen loader
      Get.offAll(() => LoginScreen());
    }
    catch(e) {
      //UFullscreen loader
    USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }
  }
}
