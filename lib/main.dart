import 'package:e_commercee/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  ///widget flutter binding
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// flutter native splash
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //portrait up the screen
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
