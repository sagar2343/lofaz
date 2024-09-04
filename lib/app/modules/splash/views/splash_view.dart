import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/utils/gen/assets.gen.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                Assets.images.lofaz1.path,
                width: Get.width * 0.3,
              ),
            ),
          ),
          Obx(() {
            return Column(
              children: [
                Text(
                  "Version ${controller.appVersion.value}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
