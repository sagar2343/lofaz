import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:nb_utils/nb_utils.dart' hide IntExtensions;

import '../../../routes/app_pages.dart';

class LoginOtpController extends GetxController {
  final AuthServices authServices;
  late String verificationId;
  late int? resendToken;
  late String phone;
  String? otp;
  final secondsLeft = 30.obs;
  Timer? timer;

  LoginOtpController(this.authServices);
  @override
  void onInit() {
    if (Get.arguments != null) {
      verificationId = Get.arguments['verificationId'];
      phone = Get.arguments['phone'];
      resendToken = Get.arguments['resendToken'];
    }

    startTimer();

    super.onInit();
  }

  onOtpSubmit() async {
    if (otp != null) {
      EasyLoading.show(
          status: "Please wait...", maskType: EasyLoadingMaskType.black);
      final user = await authServices.verifyPhoneOtp(otp!, verificationId);
      EasyLoading.dismiss();
      if (user != null) {
        handleAuthSuccess(user);
        // Get.offAllNamed(Routes.HOME);
      }
    }
  }

  handleAuthSuccess(User user) {
    authServices.handleAuthSuccess(
      user,
      onAccountFound: () {
        Get.offAllNamed(Routes.HOME);
      },
      onAccountNotFound: () {
        Get.offAllNamed(Routes.REGISTER);
      },
    );
  }

  startTimer() {
    timer = Timer.periodic(1.seconds, (timer) {
      if (secondsLeft.value > 0) {
        secondsLeft.value--;
      } else {
        timer.cancel();
      }
    });
  }

  resendOtpClicked() {
    EasyLoading.show(
      status: "Please wait...",
      maskType: EasyLoadingMaskType.black,
    );
    authServices.loginWithPhone(
      forceResendingToken: resendToken,
      verificationCompleted: (p0) {
        EasyLoading.dismiss();
        handleAuthSuccess(p0);
      },
      phone: "+91$phone",
      onCodeSend: (p0, p1) {
        verificationId = p0;
        resendToken = p1;
        startTimer();
        EasyLoading.dismiss();
      },
      onError: (p0) {
        EasyLoading.dismiss();
        toast(p0.message);
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
