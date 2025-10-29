import 'package:e_commercee/data/repositories/repository.dart';
import 'package:e_commercee/features/personalization/controllers/user_controller.dart';
import 'package:e_commercee/navigation_menu.dart';
import 'package:e_commercee/utils/helpers/network_manager.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNameController extends GetxController {

static ChangeNameController get instance => Get.find();

//Variables
  final _userController = UserController.instance;
final firstName = TextEditingController();
final lastName = TextEditingController();

final updateUserFormKey = GlobalKey<FormState>();


@override
  void onInit() {
  initializeNames();
    super.onInit();
  }

  void  initializeNames(){
  firstName.text = _userController.user.value.firstName;
  lastName.text = _userController.user.value.lastName;


  }

  Future<void> updateUserName() async{
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
    if (!updateUserFormKey.currentState!.validate()) {
      //UFullscreenLoader.stopLoading();
      return;
    }
    //Update UserName From fireStore
    Map<String, dynamic> map ={'firstName': firstName.text,
      'lastName': lastName.text};
    await Repository.instance.updateSingleField(map);

    //update User From Rx user
    _userController.user.value.firstName = firstName.text;
    _userController.user.value.lastName = lastName.text;

    //UFullscreenLoader.stopLoading();

    //Redirect
    Get.offAll(()=> NavigationMenu());
    
    //success message
    USnackBarHelpers.successSnackBar(title: 'Congratulations', message: 'your Name has been Updated');

  }catch(e){
    USnackBarHelpers.errorSnackBar(title: 'Update Name Failed', message: e.toString());
  }
  }


}