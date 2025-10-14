import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: UAppTheme.lightTheme,
        darkTheme: UAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        // home: OnboardingScreen(),
        home: Scaffold(
          backgroundColor: UColors.primary,
          body: Center(
            child: CircularProgressIndicator(color: UColors.white),
          ),
        ),
    );
        }
}
