import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commercee/data/repositories/authentication_repository.dart';
import 'package:e_commercee/features/authentication/models/user_model.dart';
import 'package:e_commercee/utils/constants/keys.dart';
import 'package:e_commercee/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commercee/utils/exceptions/firebase_exceptions.dart' show UFirebaseException;
import 'package:e_commercee/utils/exceptions/formate_exceptions.dart';
import 'package:e_commercee/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  // final _cloudinaryServices = Get.put(CloudinaryServices());


  /// Function to Store User Data
  Future<void> saveUserRecord(UserModel user) async{
    try{

      // await _db.collection(UKeys.userCollection).doc(user.id).set(user.toJson());
      print(user.toJson());
      await _db.collection(UKeys.userCollection).doc(user.id).set(user.toJson());

    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Read] - Function to fetch user details based on current user
  Future<UserModel> fetchUserDetails() async{
    try{

      final documentSnapshot = await _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).get();

      if(documentSnapshot.exists){
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }

      return UserModel.empty();

    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  // /// [Update] - Function to update user single field
  Future<void> updateSingleField(Map<String, dynamic> map) async{
    try{

      await _db.collection(UKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
    } on FirebaseAuthException catch(e){
      throw UFirebaseAuthException(e.code).message;
    } on FirebaseException catch(e){
      throw UFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw UFormatException();
    } on PlatformException catch(e){
      throw UPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
  //
  // /// [Delete] - Function to delete user record
  // Future<void> removeUserRecord(String userId) async{
  //   try{
  //     await _db.collection(UKeys.userCollection).doc(userId).delete();
  //
  //   } on FirebaseAuthException catch(e){
  //     throw UFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch(e){
  //     throw UFirebaseException(e.code).message;
  //   } on FormatException catch(_){
  //     throw UFormatException();
  //   } on PlatformException catch(e){
  //     throw UPlatformException(e.code).message;
  //   } catch(e){
  //     throw 'Something went wrong. Please try again';
  //   }
  // }
  //
  // /// [UploadImage] - Function to upload user profile picture
  // Future<dio.Response> uploadImage(File image) async{
  //   try{
  //
  //     dio.Response response = await _cloudinaryServices.uploadImage(image, UKeys.profileFolder);
  //     return response;
  //
  //   }catch(e){
  //     throw 'Failed to upload profile picture. Please try again';
  //   }
  // }
  //
  // /// [DeleteImage] - Function to delete profile picture
  // Future<dio.Response> deleteProfilePicture(String publicId) async{
  //   try{
  //
  //     dio.Response response = await _cloudinaryServices.deleteImage(publicId);
  //     return response;
  //
  //   }catch(e){
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

}