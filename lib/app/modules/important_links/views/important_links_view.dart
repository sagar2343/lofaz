import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/modules/important_links/views/content_input_dailog.dart';
import 'package:lofaz/app/modules/important_links/views/content_input_screen.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/important_links_controller.dart';

class ImportantLinksView extends GetView<ImportantLinksController> {
  const ImportantLinksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Important Links'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Obx(() {
            return ListTile(
              onTap: () {
                if (controller.isPrivacyLoading.value) {
                  toast("Please wait!! loading privacy policy");
                  return;
                }
                Get.to(() => ContentInputScreen(
                  title: "Privacy Policy",
                  onSubmit: (p0) {
                    print(p0);
                    controller.updatePrivacyPolicy(p0);
                  },
                  initialValue: controller.privacyPolicy.value ??
                      "Add Your Own Privacy Policy",
                )
                // Get.dialog(ContentInputDialog(
                //   title: "Privacy Policy",
                //   onSubmit: (p0) {
                //     print(p0);
                //     controller.updatePrivacyPolicy(p0);
                //     Get.back();
                //   },
                //   initialValue: controller.privacyPolicy.value ??
                //       "Add Your Own Privacy Policy",
                // )
                );
              },
              title: const Text("Privacy Policy"),
              leading: const Icon(Bootstrap.lock),
              trailing: controller.isPrivacyLoading.value
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.arrow_forward_ios),
            );
          }),
          Obx(() {
            return ListTile(
              onTap: () {
                if (controller.isTermsLoading.value) {
                  toast("Please wait!! loading terms & conditions");
                  return;
                }
                Get.dialog(ContentInputScreen(
                  title: "Terms & Conditions",
                  onSubmit: (p0) {
                    print(p0);
                  },
                  initialValue: controller.termsPolicy.value ??
                      "Add Your Own Terms & Conditions",
                ));
              },
              title: const Text("Terms & Conditions"),
              leading: const Icon(Bootstrap.receipt),
              trailing: controller.isTermsLoading.value
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.arrow_forward_ios),
            );
          }),
          Obx(() {
            return ListTile(
              onTap: () {
                if (controller.isRefundLoading.value) {
                  toast("Please wait!! loading refund policy");
                  return;
                }
                Get.dialog(ContentInputScreen(
                  title: "Refund Policy",
                  onSubmit: (p0) {
                    print(p0);
                  },
                  initialValue: controller.refundPolicy.value ??
                      "Add Your Own Refund Policy",
                ));
              },
              title: const Text("Refund Policy"),
              leading: const Icon(Bootstrap.arrow_repeat),
              trailing: controller.isRefundLoading.value
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.arrow_forward_ios),
            );
          }),
          Obx(() {
            return ListTile(
              onTap: () {
                if (controller.isCancellationLoading.value) {
                  toast("Please wait!! loading cancellation policy");
                  return;
                }
                Get.dialog(ContentInputScreen(
                  title: "Cancellation Policy",
                  onSubmit: (p0) {
                    print(p0);
                  },
                  initialValue: controller.cancellationPolicy.value ??
                      "Add Your Own Cancellation Policy",
                ));
              },
              title: const Text("Cancellation Policy"),
              leading: const Icon(Bootstrap.x_circle),
              trailing: controller.isCancellationLoading.value
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.arrow_forward_ios),
            );
          }),
          Obx(() {
            return ListTile(
              onTap: () {
                if (controller.isShippingLoading.value) {
                  toast("Please wait!! loading shipping policy");
                  return;
                }
                Get.dialog(ContentInputScreen(
                  title: "Shipping Policy",
                  onSubmit: (p0) {
                    print(p0);
                  },
                  initialValue: controller.shippingPolicy.value ??
                      "Add Your Own Shipping Policy",
                ));
              },
              title: const Text("Shipping Policy"),
              leading: const Icon(Bootstrap.truck),
              trailing: controller.isShippingLoading.value
                  ? const SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(),
                    )
                  : const Icon(Icons.arrow_forward_ios),
            );
          }),
        ],
      ),
    );
  }
}
