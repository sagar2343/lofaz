import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/controllers/app_store.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:lofaz/app/utils/gen/assets.gen.dart';
// import 'package:lofaz/app/routes/app_pages.dart';
// import 'package:lofaz/app/utils/extensions.dart';
import 'package:nb_utils/nb_utils.dart' hide white;
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/AppColors.dart';
import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  launchUrl(String url) {
    launchUrlString(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          color: context.scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Image.asset(Assets.images.lofaz1.path,
                  width: width / 4, height: width / 3),
              text("Get Started",
                  textColor: Get.find<AppStore>().textPrimaryColor.value,
                  fontFamily: fontBold,
                  fontSize: 22.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 10),
                child: text(
                    " Please enter your mobile number, then we will send OTP to verify",
                    textColor: t5TextColorSecondary,
                    fontFamily: fontMedium,
                    fontSize: textSizeMedium,
                    maxLine: 2,
                    isCentered: true),
              ),
              Container(
                margin: const EdgeInsets.all(24),
                decoration: boxDecoration(
                    bgColor: context.scaffoldBackgroundColor,
                    showShadow: true,
                    radius: 4.0),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    // const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: t5ViewColor, width: 0.5)),
                      child: Row(
                        children: <Widget>[
                          // CountryCodePicker(onChanged: print, showFlag: false),
                          text(
                            "+91",
                            textColor:
                                Get.find<AppStore>().textPrimaryColor.value,
                          ),
                          Expanded(
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                controller.phone.value = value;
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: const TextStyle(
                                  fontSize: textSizeLargeMedium,
                                  fontFamily: fontRegular),
                              decoration: const InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(16, 10, 16, 10),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: t5TextColorThird),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(double.maxFinite, 50),
                              backgroundColor: t2_colorPrimary,
                              foregroundColor: white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: (controller.phone.value.length != 10 ||
                                  controller.isLoading.value)
                              ? null
                              : () {
                                  controller.loginClicked();
                                },
                          child: text("Verify Phone Number",
                              textColor: white, isCentered: true));
                    }),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const Text(
                    //     "By tapping Verify Phone Number an sms may be sent. Message & data rate may apply"),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: Divider(
              //         color: t5TextColorThird,
              //         thickness: 2,
              //       )),
              //       Text(
              //         "  OR  ",
              //         style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.blueGrey,
              //         ),
              //       ),
              //       Expanded(
              //           child: Divider(
              //         color: t5TextColorThird,
              //         thickness: 2,
              //       ))
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: SizedBox(
              //     width: double.maxFinite,
              //     child: MaterialButton(
              //       shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(10))),
              //       color: white,
              //       textColor: black,
              //       onPressed: () {},
              //       disabledColor: Theme.of(context).disabledColor,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(vertical: 10),
              //         child: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             const Icon(
              //               Icons.call,
              //               size: 26,
              //               color: Colors.lightBlue,
              //             ),
              //             const SizedBox(
              //               width: 15,
              //             ),
              //             const Text(
              //               "Login with ",
              //               style: TextStyle(
              //                 fontSize: 18,
              //               ),
              //             ),
              //             const SizedBox(
              //               width: 8,
              //             ),
              //             SvgPicture.asset(
              //               Assets.svg.truecaller,
              //               width: 100,
              //               height: 20,
              //               color: Colors.lightBlue,
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: primaryTextStyle(),
                  text: "Read our",
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl("$mainUrl/privacy-policy");
                          },
                        text: " Privary Policy.",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                        )),
                    const TextSpan(
                        text: "Tap Verify Phone\nNumber to accept the "),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl("$mainUrl/terms-conditions");
                          },
                        text: "Terms & Conditions",
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
