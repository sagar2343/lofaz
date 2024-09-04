import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginController extends GetxController {
  final authServices = Get.find<AuthServices>();
  final phone = "".obs;
  final isLoading = false.obs;

  loginClicked() async {
    if (phone.value.length == 10 && phone.value.isNumericOnly) {
      EasyLoading.show(
        status: "Please wait...",
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
      );
      isLoading.value = true;
      await authServices.loginWithPhone(
          verificationCompleted: (user) {
            EasyLoading.dismiss();
            authServices.handleAuthSuccess(
              user,
              onAccountFound: () {
                Get.offAllNamed(Routes.HOME);
              },
              onAccountNotFound: () {
                Get.offAllNamed(Routes.REGISTER);
              },
            );
          },
          onError: (p0) {
            toastLong(p0.message);
            isLoading.value = false;
            EasyLoading.dismiss();
          },
          phone: "+91${phone.value}",
          onCodeSend: (verificationId, resendToken) {
            EasyLoading.dismiss();

            isLoading.value = false;

            Get.toNamed(Routes.LOGIN_OTP, arguments: {
              "phone": phone.value,
              "verificationId": verificationId,
              "resendToken": resendToken,
            });
          });
    } else {
      toast("Enter a valid phone number");
    }
  }
}
