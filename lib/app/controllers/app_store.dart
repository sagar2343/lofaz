import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/AppColors.dart';
import '../utils/AppConstant.dart';

class AppStore extends GetxController {
  final textPrimaryColor = Rxn<Color>();
  final textSecondaryColor = Rxn<Color>();
  final scaffoldBackground = Rxn<Color>();
  final appBarColor = Rxn<Color>();
  final iconColor = Rxn<Color>();
  final backgroundColor = Rxn<Color>();
  final backgroundSecondaryColor = Rxn<Color>();
  final appColorPrimaryLightColor = Rxn<Color>();
  final iconSecondaryColor = Rxn<Color>();
  final textPrimaryColorGlobal = Rxn<Color>();
  final textSecondaryColorGlobal = Rxn<Color>();
  final shadowColorGlobal = Rxn<Color>();
  final isDarkModeOn = Rx(false);

  @override
  onInit() {
    toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
    super.onInit();
  }

  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn.value = value ?? !isDarkModeOn.value;

    if (isDarkModeOn.value) {
      scaffoldBackground.value = appBackgroundColorDark;

      appBarColor.value = appBackgroundColorDark;
      backgroundColor.value = Colors.white;
      backgroundSecondaryColor.value = Colors.white;
      appColorPrimaryLightColor.value = cardBackgroundBlackDark;

      iconColor.value = iconColorPrimary;
      iconSecondaryColor.value = iconColorSecondary;

      textPrimaryColor.value = Colors.white;
      textSecondaryColor.value = Colors.white54;

      textPrimaryColorGlobal.value = Colors.white;
      textSecondaryColorGlobal.value = Colors.white54;
      shadowColorGlobal.value = appShadowColorDark;
    } else {
      scaffoldBackground.value = Colors.white;

      appBarColor.value = Colors.white;
      backgroundColor.value = Colors.black;
      backgroundSecondaryColor.value = appSecondaryBackgroundColor;
      appColorPrimaryLightColor.value = appColorPrimaryLight;

      iconColor.value = iconColorPrimaryDark;
      iconSecondaryColor.value = iconColorSecondaryDark;

      textPrimaryColor.value = appTextColorPrimary;
      textSecondaryColor.value = appTextColorSecondary;

      textPrimaryColorGlobal.value = appTextColorPrimary;
      textSecondaryColorGlobal.value = appTextColorSecondary;
      shadowColorGlobal.value = appShadowColor;
    }
    setStatusBarColor(scaffoldBackground.value!);

    setValue(isDarkModeOnPref, isDarkModeOn.value);
  }
}
