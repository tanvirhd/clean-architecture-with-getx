import 'package:cleanwithgetx/config/color/app_color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: AppColor.lightPrimary,
        primaryColorDark: AppColor.darkPrimary,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'SFProText',
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android:  FadeUpwardsPageTransitionsBuilder(),
        }));
  }
}
