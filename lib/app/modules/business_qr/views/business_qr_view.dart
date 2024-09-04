import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/utils/AppColors.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:lofaz/app/utils/gen/assets.gen.dart';
import 'package:lofaz/app/utils/m_button.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:screenshot/screenshot.dart';

import '../../../utils/AppConstant.dart';
import '../controllers/business_qr_controller.dart';

class BusinessQrView extends GetView<BusinessQrController> {
  const BusinessQrView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: MButton(
                onPressed: controller.saveClicked,
                label: "Save",
                icon: Bootstrap.download,
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: MButton(
                  backgroundColor: white,
                  forgroundColor: t2_colorPrimary,
                  onPressed: controller.shareClicked,
                  label: "Share via",
                  icon: Bootstrap.share),
            ),
          ],
        ),
      ),
      backgroundColor: t2_colorPrimary_light,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: t2_colorPrimary_light),
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text('Business Qr'),
        centerTitle: true,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Screenshot(
            controller: controller.screenshotController,
            child: Container(
              color: t2_colorPrimary_light,
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 15),
              child: Card(
                surfaceTintColor: Colors.white,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Transform.translate(
                  offset: const Offset(0, -24),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          Assets.images.lofaz1.path,
                          width: 60,
                        ),
                      ),
                      const Text(
                        "LOFAZ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: t2_colorPrimary_light,
                        ),
                      ),
                      Text(
                        controller.vendor.value?.businessName ?? "Lofaz",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.vendor.value?.phone ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: PrettyQrView(
                          qrImage: QrImage(QrCode(
                            8,
                            QrErrorCorrectLevel.H,
                          )..addData(
                              '$mainUrl/${controller.vendor.value?.username ?? ""}')),
                          decoration: PrettyQrDecoration(
                            image: PrettyQrDecorationImage(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              scale: 0.25,
                              image: AssetImage(Assets.images.lofaz1.path),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      const Text(
                        "Scan the Above QR Code to Shop Online",
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Bootstrap.printer,
                        size: 35,
                        color: Colors.white,
                      ),
                      Text(
                        "Get print out and paste this QR code in your shop",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                const Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Bootstrap.qr_code_scan,
                        size: 35,
                        color: Colors.white,
                      ),
                      Text(
                        "Ask Customer to scan and place orders",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height*0.1,
          )
        ],
      ),
    );
  }
}
