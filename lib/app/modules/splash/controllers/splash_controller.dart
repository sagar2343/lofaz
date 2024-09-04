import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:nb_utils/nb_utils.dart' hide IntExtensions;

import '../../../data/models/auth_session.dart';

class SplashController extends GetxController {
  final AuthServices authServices;
  final appVersion = "".obs;
  Completer<void>? _completer;
  SplashController(this.authServices);
  @override
  Future<void> onInit() async {
    authServices.fetchUserIpInfoAndSend();

    _completer = Completer();
    Future.delayed(2.seconds).then((value) {
      _completer?.complete();
    });
    getAppVersion();

    if (authServices.isLoggedIn &&
        authServices.getCurrentUser!.phoneNumber != null) {
      checkForLogin();
    } else {
      await _completer?.future;
      Get.offAndToNamed(Routes.WALK_THROUGH);
    }
    checkForUpdate();
    // Future.delayed(1.seconds, () {
    //   if (authServices.isLoggedIn &&
    //       authServices.getCurrentUser!.phoneNumber != null) {
    //     checkForLogin();
    //   } else {
    //     Get.offAndToNamed(Routes.WALK_THROUGH);
    //   }
    // });

    super.onInit();
  }

  checkForLogin() async {
    if (authServices.authToken.isNotEmpty && authServices.authSession != null) {
      log(authServices.authToken);
      await _completer?.future;
      Get.offAllNamed(Routes.HOME);
      return;
    }

    final (token, vendor) = await authServices.checkPhoneAlreadyRegistered(
        phone: authServices.getCurrentUser!.phoneNumber!);
    if (token != null) {
      if (token.isNotEmpty) {
        setValue(authTokenPref, token);
        if (vendor != null) {
          await authServices.createAuthSession(AuthSession(
              authToken: token,
              userId: vendor.id,
              businessName: vendor.businessName,
              userName: vendor.username));
        }
        await _completer?.future;
        Get.offAllNamed(Routes.HOME);
      } else {
        await _completer?.future;
        Get.offAllNamed(Routes.REGISTER);
      }
    }
  }

  getAppVersion() async {
    final packageInfo = await getPackageInfo();
    appVersion.value = packageInfo.versionName ?? "0.0.0";
  }

  checkForUpdate() async {
    if (kReleaseMode && Platform.isAndroid) {
      InAppUpdate.checkForUpdate().then(
        (value) {
          if (value.updateAvailability == UpdateAvailability.updateAvailable) {
            InAppUpdate.performImmediateUpdate().then((value) {
              if (value == AppUpdateResult.inAppUpdateFailed) {
                InAppUpdate.startFlexibleUpdate().then((value) {
                  if (value == AppUpdateResult.success) {
                    InAppUpdate.completeFlexibleUpdate();
                  }
                });
              }
            });
          }
        },
      );
    }
  }
}
