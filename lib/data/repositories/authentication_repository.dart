import 'package:e_commercee/features/authentication/screens/login/login.dart';
import 'package:e_commercee/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final storage = GetStorage();
  // final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // Remove the splash screen
    FlutterNativeSplash.remove();
  }
  /// Function to redirect to the right screen
  void screenRedirect() {
    // write isFirstTime If Null
    storage.writeIfNull('isFirstTime', true);

    // Check if user is first time
    storage.read('isFirstTime') != true
        ? Get.to(() => LoginScreen()) // If not first time, go to login screen
        : Get.to(() => OnboardingScreen()); // if first time, go to onboarding screen
  }
}