import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:lofaz/app/controllers/app_store.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:lofaz/app/utils/extensions.dart';
// import 'package:lofaz/app/utils/extensions.dart';
import 'package:lofaz/app/utils/gen/assets.gen.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../../../utils/widgets/pin_entry_text_field.dart';
import '../controllers/login_otp_controller.dart';

class LoginOtpView extends GetView<LoginOtpController> {
  const LoginOtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = context.width();
    final height = context.height();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    Assets.images.t5Verification.path,
                    width: width / 2.5,
                    height: width / 2.5,
                  ),
                  const SizedBox(height: 30),
                  text(" Verification",
                      textColor: Get.find<AppStore>().textPrimaryColor.value,
                      fontFamily: fontBold,
                      fontSize: 22.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 16),
                    child: text(
                        " Please enter code that sent to your phone number in the form below.This code will expired in 00:30 seconds",
                        textColor: t5TextColorSecondary,
                        fontFamily: fontMedium,
                        fontSize: textSizeMedium,
                        maxLine: 3,
                        isCentered: true),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    decoration: boxDecoration(
                        bgColor: context.scaffoldBackgroundColor,
                        showShadow: true,
                        radius: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: <Widget>[
                        const Text(
                          "Enter the 6 digit code we sent to",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "+91${controller.phone}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: t2_colorPrimary,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        SizedBox(
                          height: 45,
                          width: Get.width,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: PinEntryTextField(
                              fields: 6,
                              fontSize: textSizeNormal,
                              onSubmit: (p0) {
                                controller.otp = p0;
                                controller.onOtpSubmit();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        GestureDetector(
                          onTap: () {
                            controller.onOtpSubmit();
                            // T5SetPassword().launch(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: width / 8,
                            decoration: boxDecoration(
                                bgColor: t2_colorPrimary, radius: 8),
                            child: text("Verify",
                                textColor: white, isCentered: true),
                          ),
                        ),
                        Obx(() {
                          return TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: t2_colorPrimary,
                              ),
                              onPressed: controller.secondsLeft.value > 0
                                  ? null
                                  : controller.resendOtpClicked,
                              child: Text(
                                " Resend ${controller.secondsLeft.value > 0 ? "(${controller.secondsLeft.value})" : ""}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ));
                        }),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      // toasty(context, t5_resend);
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: text("Use another number?",
                          // textColor: t5ColorPrimary,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontSemibold),
                    ),
                  )
                ],
              ),
            ),
          ),
          // TopBar()
        ],
      ),
    );
  }
}
