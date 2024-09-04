import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/models/social_links/social_links.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';

class SocialLinksController extends GetxController {
  final VendorServices _vendorServices;
  late final Rx<SocialLinks> socialLinks;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  SocialLinksController(this._vendorServices);

  @override
  void onInit() {
    if (Get.arguments is SocialLinks) {
      socialLinks = Rx<SocialLinks>(Get.arguments);
    } else {
      socialLinks = Rx<SocialLinks>(const SocialLinks());
    }

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

  updateSocialLinks() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    await _vendorServices
        .updateSocialLinks(socialLinks: socialLinks.value)
        .then((value) {
      if (value) {
        Get.back(
          result: socialLinks.value,
        );
      }
    });
    isLoading.value = false;
  }
}
