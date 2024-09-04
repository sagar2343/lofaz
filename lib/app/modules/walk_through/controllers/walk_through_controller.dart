import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/routes/app_pages.dart';

class WalkThroughController extends GetxController {
  final currentIndexPage = 0.obs;
  final PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  VoidCallback? onPrev() {
    if (currentIndexPage >= 1) {
      currentIndexPage.value = currentIndexPage.value - 1;
      pageController.jumpToPage(currentIndexPage.value);
    }
    return null;
  }

  VoidCallback? onNext() {
    if (currentIndexPage < 2) {
      currentIndexPage.value = currentIndexPage.value + 1;
      pageController.jumpToPage(currentIndexPage.value);
      return null;
    }
    Get.offAndToNamed(Routes.LOGIN);
    return null;
  }
}
