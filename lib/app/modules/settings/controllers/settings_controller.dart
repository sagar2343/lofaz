import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/gen/assets.gen.dart';

class SettingsController extends GetxController {
  // final vendor = Get.find<HomeController>().vendor;
  final vendorProfile = Get.find<HomeController>().vendorProfile;
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

  // getVendorProfileImage(){
  //   return vendorProfile.value?.photo ?? "";
  // }

  getProfileImage() {
    return (vendorProfile.value != null && vendorProfile.value!.photo != null)
        ? CachedNetworkImageProvider(vendorProfile.value!.photo!)
        : AssetImage(
            Assets.images.shopDefault.path,
          );
  }

  String get getUserName {
    return vendorProfile.value?.username ?? "lofaz";
  }

  launchStoreUrl() {
    launchUrlString(
      "$mainUrl/$getUserName",
      mode: LaunchMode.externalApplication,
    );
  }

  String get getPhoneNumber {
    return Get.find<AuthServices>().getPhoneNumber;
  }

  shareClick() {
    Share.share(
        "Hey! you can now order online from my website $getUserName\nusing this link: $mainUrl/$getUserName\nIf you need any help you can contact me on $getPhoneNumber\nThank You");
  }

  launchUrl(String url) {
    launchUrlString(url, mode: LaunchMode.inAppBrowserView);
  }

  launchWhatsAppSellerCommunity() {
    launchUrlString("https://bit.ly/lswcl",
        mode: LaunchMode.externalNonBrowserApplication);
  }

  launchVideoTutorial() {
    launchUrlString("https://bit.ly/lysalink",
        mode: LaunchMode.externalNonBrowserApplication);
  }

  launchHelpCenter() {
    launchUrlString("https://bit.ly/hllisapp",
        mode: LaunchMode.inAppBrowserView);
  }

  supportWhatsappClicked() {
    launchUrlString(
        "https://wa.me/+917272898947?text=Hello Lofaz support team, my business name is ${vendorProfile.value?.businessName} and website my is $mainUrl/${vendorProfile.value?.username} i need your help to grow my business!");
  }

  callSupportClicked() {
    launchUrlString("tel:+917272898947");
  }
}
