import 'package:clock_app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static AppBarTheme appBarTheme = const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
  );

  static ThemeData light(BuildContext context) {
    return ThemeData(
      appBarTheme: AppThemeData.appBarTheme,
      primaryColor: AppColors.primaryColor,
      // accentColor: AppColors.accentLightColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLightColor,
      colorScheme: ColorScheme.light(
        secondary: AppColors.secundaryLightColor,
        surface: AppColors.surfaceLightColor,
      ),
      backgroundColor: AppColors.backgroundLightColor,
      iconTheme: IconThemeData(color: AppColors.bodyTextColorLight),
      // accentIconTheme: IconThemeData(color: AppColors.accentIconLightColor),
      primaryIconTheme: IconThemeData(color: AppColors.primaryIconLightColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: TextStyle(color: AppColors.bodyTextColorLight),
        bodyText2: TextStyle(color: AppColors.bodyTextColorLight),
        headline4:
            TextStyle(color: AppColors.titleTextLightColor, fontSize: 32),
        headline1:
            TextStyle(color: AppColors.titleTextLightColor, fontSize: 80),
      ),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData(
      appBarTheme: AppThemeData.appBarTheme,
      primaryColor: AppColors.primaryColor,
      // accentColor: AppColors.accentLightColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDarkColor,
      colorScheme: ColorScheme.dark(
        secondary: AppColors.secundaryDarkColor,
        surface: AppColors.surfaceDarkColor,
      ),
      backgroundColor: AppColors.backgroundDarkColor,
      iconTheme: IconThemeData(color: AppColors.bodyTextColorDark),
      // accentIconTheme: IconThemeData(color: AppColors.accentIconDarkColor),
      primaryIconTheme: IconThemeData(color: AppColors.primaryIconDarkColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodyText1: TextStyle(color: AppColors.bodyTextColorDark),
        bodyText2: TextStyle(color: AppColors.bodyTextColorDark),
        headline4: TextStyle(color: AppColors.titleTextDarkColor, fontSize: 32),
        headline1: TextStyle(color: AppColors.titleTextDarkColor, fontSize: 80),
      ),
    );
  }
}
