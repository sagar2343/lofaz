import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/data/models/social_links/social_links.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/models/shipping_charges/shipping_charge.dart';
import '../controllers/business_settings_controller.dart';

class BusinessSettingsView extends GetView<BusinessSettingsController> {
  const BusinessSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // CupertinoListTile(

          // ),
          Obx(() {
            return ListTile(
              leading: const Icon(Bootstrap.list_ul),
              title: const Text("Online order"),
              subtitle: const Text("Allow user to order online"),
              trailing: Switch(
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red,
                value: controller.storeSettings.value?.orderStatus ?? false,
                onChanged: (v) {
                  controller.changeOnlineOrderStatus(v);
                },
              ),
            );
          }),
          Obx(() {
            return ListTile(
              leading: const Icon(Bootstrap.whatsapp),
              title: const Text("Show WhatsApp number"),
              subtitle: const Text("Show whatsapp on product page"),
              trailing: Switch(
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red,
                value: controller.storeSettings.value?.whatsappStatus ?? false,
                onChanged: (v) {
                  controller.changeShowWhatsappNmuber(v);
                },
              ),
            );
          }),
          ListTile(
            onTap: () {
              if (controller.isShippingLoading.value) {
                toast("Please wait!! fetching shipping charge");
                return;
              }
              Get.toNamed(Routes.SHIPPING_CHARGE_INPUT,
                      arguments: controller.shippingCharges.value)
                  ?.then((value) {
                if (value is ShippingCharge) {
                  controller.shippingCharges.value = value;
                }
              });
            },
            leading: const Icon(Bootstrap.truck),
            title: const Text("Shipping charges"),
            subtitle: const Text("Local & area wise charges"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),

          ListTile(
            onTap: () {
              if (controller.isSocialLinkLoading.value) {
                toast("Please wait!! fetching shipping charge");
                return;
              }
              Get.toNamed(Routes.SOCIAL_LINKS,
                      arguments: controller.socialLinks.value)
                  ?.then((value) {
                if (value is SocialLinks) {
                  controller.socialLinks.value = value;
                }
              });
            },
            leading: const Icon(Bootstrap.share),
            title: const Text("Social media links"),
            subtitle: const Text("Facebook, Instagram, Linkedin, X"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(Routes.IMPORTANT_LINKS);
            },
            leading: const Icon(Bootstrap.link_45deg),
            title: const Text("Important links"),
            subtitle: const Text("Privacy policy, terms & Condition"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
