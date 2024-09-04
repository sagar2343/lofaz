import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppColors.dart';

class AppThemeData {
  //
  AppThemeData._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: whiteColor,
    primaryColor: t2_colorPrimary_light,
    primaryColorDark: t4_colorPrimaryDark,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: const AppBarTheme(
      color: t2_colorPrimary_light,
      foregroundColor: Colors.white,
      // iconTheme: IconThemeData(color: textPrimaryColor),
      // systemOverlayStyle:
      //     SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    cardTheme: const CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)))),
    cardColor: cardLightColor,
    iconTheme: const IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: appColorPrimary),
      titleLarge: TextStyle(color: textPrimaryColor),
      titleSmall: TextStyle(color: textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.light(primary: t2_colorPrimary_light)
        .copyWith(error: Colors.red),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
        }),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: appBackgroundColorDark,
    highlightColor: appBackgroundColorDark,
    appBarTheme: const AppBarTheme(
      color: appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    primaryColor: color_primary_black,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: color_primary_black,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.openSans().fontFamily,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(
        titleLarge: primaryTextStyle(color: Colors.white),
        labelSmall: primaryTextStyle(color: Colors.white)),
    cardTheme: const CardTheme(color: cardBackgroundBlackDark),
    cardColor: appSecondaryBackgroundColor,
    iconTheme: const IconThemeData(color: whiteColor),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: color_primary_black),
      titleLarge: TextStyle(color: whiteColor),
      titleSmall: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark(
            primary: appBackgroundColorDark, onPrimary: cardBackgroundBlackDark)
        .copyWith(secondary: whiteColor)
        .copyWith(error: const Color(0xFFCF6676)),
  )
      // .copyWith(
      //   pageTransitionsTheme: const PageTransitionsTheme(
      //       builders: <TargetPlatform, PageTransitionsBuilder>{
      //         TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      //         TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      //         TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
      //         TargetPlatform.macOS: OpenUpwardsPageTransitionsBuilder(),
      //       }),
      // )
      ;
}
