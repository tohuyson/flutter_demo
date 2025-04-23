import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static final AppTheme instance = AppTheme._();

  // Our light/Primary Theme
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      appBarTheme: appBarTheme,
      primaryColor: AppColor.instance.kClockPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
        secondary: AppColor.instance.kClockSecondaryLightColor,
        background: Colors.white,
        // on light theme surface = Colors.white by default
      ),
      iconTheme: IconThemeData(color: AppColor.instance.kClockBodyTextColorLight),
      primaryIconTheme: IconThemeData(color: AppColor.instance.kClockPrimaryIconLightColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodySmall: TextStyle(color: AppColor.instance.kClockBodyTextColorLight),
        bodyMedium: TextStyle(color: AppColor.instance.kClockBodyTextColorLight),
        bodyLarge: TextStyle(color: AppColor.instance.kClockBodyTextColorLight),
        headlineMedium: TextStyle(color: AppColor.instance.kClockTitleTextLightColor, fontSize: 32),
        displayLarge: TextStyle(color: AppColor.instance.kClockTitleTextLightColor, fontSize: 80),
      ),
    );
  }

  // Dark Them
  ThemeData darkThemeData(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: AppColor.instance.kClockPrimaryColor,
      scaffoldBackgroundColor: const Color(0xFF0D0C0E),
      appBarTheme: appBarTheme,
      colorScheme: ColorScheme.light(
        secondary: AppColor.instance.kClockSecondaryDarkColor,
        surface: AppColor.instance.kClockSurfaceDarkColor,
        background: AppColor.instance.kClockBackgroundDarkColor,
      ),
      iconTheme: IconThemeData(color: AppColor.instance.kClockBodyTextColorDark),
      primaryIconTheme: IconThemeData(color: AppColor.instance.kClockPrimaryIconDarkColor),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        bodySmall: TextStyle(color: AppColor.instance.kClockBodyTextColorDark),
        bodyMedium: TextStyle(color: AppColor.instance.kClockBodyTextColorDark),
        bodyLarge: TextStyle(color: AppColor.instance.kClockBodyTextColorDark),
        headlineMedium: TextStyle(color: AppColor.instance.kClockTitleTextDarkColor, fontSize: 32),
        displayLarge: TextStyle(color: AppColor.instance.kClockTitleTextDarkColor, fontSize: 80),
      ),
    );
  }

  AppBarTheme appBarTheme = const AppBarTheme(color: Colors.transparent, elevation: 0);
}
