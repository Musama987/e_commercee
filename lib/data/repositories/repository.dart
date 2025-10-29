import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commercee/shop/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../features/authentication/models/user_model.dart';
import '../../shop/models/product_model.dart';
import '../../utils/constants/keys.dart';
import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/formate_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';
import 'authentication_repository.dart';

class Repository extends GetxController {
  static Repository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


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
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection(UKeys.userCollection).doc(userId).delete();

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
  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  // Get popular products
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      final snapshot = await _db.collection('Popular_Products').get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}