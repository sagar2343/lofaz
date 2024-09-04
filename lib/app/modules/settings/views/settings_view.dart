import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:lofaz/app/utils/m_button.dart';
// import 'package:lofaz/app/utils/extensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: MButton(
                icon: Icons.phone_in_talk,
                label: "Call Support",
                onPressed: controller.callSupportClicked,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: MButton(
                backgroundColor: whatsapp,
                icon: Bootstrap.whatsapp,
                label: "WhatsApp",
                onPressed: controller.supportWhatsappClicked,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                // horizontalTitleGap: 10,
                leading: Obx(() {
                  return CircleAvatar(
                    backgroundImage: controller.getProfileImage(),
                    radius: Get.width * 0.07,
                  );
                }),
                title: Text(controller.vendorProfile.value?.businessName ??
                    controller.vendorProfile.value?.fullName ??
                    "Lofaz"),
                subtitle: Text(
                  "@${controller.vendorProfile.value?.username ?? "Lofaz"}",
                ),
                trailing: Obx(() {
                  return MButton(
                    label: "Edit Profile",
                    onPressed: controller.vendorProfile.value == null
                        ? null
                        : () {
                            Get.toNamed(Routes.EDIT_VENDOR_PROFILE,
                                arguments: controller.vendorProfile.value);
                          },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  elevation: 2,
                  surfaceTintColor: Colors.transparent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Share your website link",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.launchStoreUrl();
                                },
                                child: Obx(() {
                                  return Text(
                                      "$mainDomain/${controller.getUserName}",
                                      style: primaryTextStyle(
                                        size: 16,
                                        color: Colors.indigo,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.indigo,
                                        textDecorationStyle:
                                            TextDecorationStyle.solid,
                                      ).copyWith(
                                        decorationThickness: 3,
                                      ));
                                }),
                              ),
                            ],
                          ),
                        ),
                        MButton(
                          label: "Share ",
                          icon: Icons.share,
                          onPressed: controller.shareClick,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.BUSINESS_SETTINGS);
                    },
                    dense: true,
                    title: const Text("Business Settings"),
                    subtitle:
                        const Text("Store timing, shipping, social media"),
                    leading: const Icon(Bootstrap.shop),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text("WhatsApp seller community"),
                    subtitle: const Text("Daily update, features, guide"),
                    leading: const Icon(Bootstrap.whatsapp),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: controller.launchWhatsAppSellerCommunity,
                  ),
                  ListTile(
                    onTap: controller.launchVideoTutorial,
                    dense: true,
                    title: const Text("Video tutorial"),
                    subtitle: const Text(
                        "Step by step on how to setup your business"),
                    leading: const Icon(Bootstrap.play_circle),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  ListTile(
                    onTap: controller.launchHelpCenter,
                    dense: true,
                    title: const Text("Help Center"),
                    subtitle:
                        const Text("Learn how to use Lofaz, fix a problem"),
                    leading: const Icon(Bootstrap.question_circle),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(Routes.MORE_INFORMATION);
                    },
                    dense: true,
                    title: const Text("More information"),
                    subtitle: const Text("Privacy policy, rate us, logout"),
                    leading: const Icon(Bootstrap.three_dots_vertical),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget t9Award(var icon, var bgColor) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    width: 35,
    height: 35,
    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: icon,
      ),
    ),
  );
}
