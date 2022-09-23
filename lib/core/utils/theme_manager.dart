import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task_posbank/core/utils/colors_manager.dart';
import 'package:task_posbank/core/utils/fonts_manager.dart';
import 'package:task_posbank/core/utils/styles_manager.dart';
import 'package:task_posbank/core/utils/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// Main Colors
    primaryColor: ColorManager.primaryColor,
    ///ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ColorManager.primaryColor))),

    /// Scaffold
    scaffoldBackgroundColor: ColorManager.white,
    /// Floating Action Button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.primaryColor),

    ///TEXT THEME
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          fontSize: FontSize.s22,
          color: ColorManager.white,
        ),
        displayMedium:
            getSemiBoldStyle(color: Colors.black87, fontSize: FontSize.s16),
        displaySmall:
            getSemiBoldStyle(fontSize: FontSize.s18, color: ColorManager.white)),
  );
}
