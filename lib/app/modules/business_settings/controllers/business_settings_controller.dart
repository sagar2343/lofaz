import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/models/shipping_charges/shipping_charge.dart';
import 'package:lofaz/app/data/models/social_links/social_links.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../home/controllers/home_controller.dart';

class BusinessSettingsController extends GetxController {
  final VendorServices _vendorServices;
  final storeSettings = Get.find<HomeController>().storeSettings;
  final shippingCharges = Rxn<ShippingCharge>();
  final socialLinks = Rxn<SocialLinks>();
  final isShippingLoading = false.obs;
  final isSocialLinkLoading = false.obs;
  BusinessSettingsController(this._vendorServices);

  @override
  void onInit() {
    fetchShippingCharges();
    fetchSocialLinks();
    super.onInit();
  }

  changeOnlineOrderStatus(bool status) async {
    if (storeSettings.value == null) return;

    final userId = Get.find<HomeController>().authSession.userId;
    EasyLoading.show(
      status: "Changing status...",
      maskType: EasyLoadingMaskType.black,
    );
    await _vendorServices
        .changeOnlineOrderStatus(userId, status)
        .then((value) async {
      if (value) {
        await Get.find<HomeController>().fetchStoreSettings();
        toastLong("Status changed successfully");
      }
    });
    EasyLoading.dismiss();
  }

  changeShowWhatsappNmuber(bool status) async {
    if (storeSettings.value == null) return;

    final userId = Get.find<HomeController>().authSession.userId;
    EasyLoading.show(
      status: "Changing status...",
      maskType: EasyLoadingMaskType.black,
    );
    await _vendorServices
        .changeShowWhatsappStatus(userId, status)
        .then((value) async {
      if (value) {
        await Get.find<HomeController>().fetchStoreSettings();
        toastLong("Status changed successfully");
      }
    });
    EasyLoading.dismiss();
  }

  fetchShippingCharges() async {
    isShippingLoading.value = true;
    await _vendorServices.fetchShippingCharges().then((value) {
      if (value != null) {
        shippingCharges.value = value;
      }
    });
    isShippingLoading.value = false;
  }

  fetchSocialLinks() async {
    final vendorProfile = Get.find<HomeController>().vendorProfile.value;

    if (vendorProfile == null) return;

    isSocialLinkLoading.value = true;
    await _vendorServices
        .fetchSocialLinks(vendorProfile.username)
        .then((value) {
      if (value != null) {
        socialLinks.value = value;
      }
    });
    isSocialLinkLoading.value = false;
  }
}
