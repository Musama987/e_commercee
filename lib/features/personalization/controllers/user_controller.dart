import 'package:e_commercee/data/repositories/user/user_repository.dart';
import 'package:e_commercee/features/authentication/models/user_model.dart';
import 'package:e_commercee/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  //variables
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;




  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  } //Function to Save User Record
  Future<void> saveUserRecord(UserCredential userCredential) async{
    try
        {
          //convert Full Name to first name and last name
          final nameParts =  UserModel.nameParts(userCredential.user!.displayName);
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


        }catch(e){
        USnackBarHelpers.warningSnackBar(title: 'Data not Saved', message: 'Something Went Wrong while saving  Data');
    }
  }


  //
Future<void> fetchUserDetails() async{
    try{
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    }
    catch(e){
         user(UserModel.empty());
    }
    finally{
      profileLoading.value = false;
    }
}
}