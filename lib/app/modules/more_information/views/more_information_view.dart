import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../data/services/auth_services.dart';
import '../../../routes/app_pages.dart';
import '../controllers/more_information_controller.dart';

class MoreInformationView extends GetView<MoreInformationController> {
  const MoreInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Information'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: controller.launchPrivacyPolicy,
            leading: const Icon(Bootstrap.file_text),
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: controller.rateUsClicked,
            leading: const Icon(Bootstrap.star),
            title: const Text("Rate Us"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {
              Get.find<AuthServices>().logOut().then((_) {
                Get.offAllNamed(Routes.LOGIN);
              });
            },
            leading: const Icon(Bootstrap.box_arrow_right),
            title: const Text("Logout"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
