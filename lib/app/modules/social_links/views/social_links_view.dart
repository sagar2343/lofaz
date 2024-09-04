import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/data/models/social_links/social_links.dart';

import '../../../utils/m_button.dart';
import '../controllers/social_links_controller.dart';

class SocialLinksView extends GetView<SocialLinksController> {
  const SocialLinksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Links'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return (value.contains("https://") && value.isURL)
                      ? null
                      : "Invalid URL";
                }
                return null;
              },
              initialValue: controller.socialLinks.value.facebook?.url,
              onChanged: (value) {
                if (value.isEmpty) {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(facebook: null);
                } else {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(
                    facebook: SocialLinkItem(
                        url: value,
                        count:
                            controller.socialLinks.value.facebook?.count ?? 1),
                  );
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Facebook Link",
                hintText: "paste your facebook link here",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: controller.socialLinks.value.instagram?.url,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return value.contains("https://") && value.isURL
                      ? null
                      : "Invalid URL";
                }
                return null;
              },
              onChanged: (value) {
                if (value.isEmpty) {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(instagram: null);
                } else {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(
                    instagram: SocialLinkItem(
                        url: value,
                        count:
                            controller.socialLinks.value.instagram?.count ?? 1),
                  );
                }
              },
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Instagram Link",
                hintText: "paste your instagram link here",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: controller.socialLinks.value.twitter?.url,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return value.contains("https://") && value.isURL
                      ? null
                      : "Invalid URL";
                }
                return null;
              },
              onChanged: (value) {
                if (value.isEmpty) {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(twitter: null);
                } else {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(
                    twitter: SocialLinkItem(
                        url: value,
                        count:
                            controller.socialLinks.value.twitter?.count ?? 1),
                  );
                }
              },
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "X Link",
                hintText: "paste your X(twitter) link here",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: controller.socialLinks.value.linkedin?.url,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return value.contains("https://") && value.isURL
                      ? null
                      : "Invalid URL";
                }
                return null;
              },
              onChanged: (value) {
                if (value.isEmpty) {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(linkedin: null);
                } else {
                  controller.socialLinks.value =
                      controller.socialLinks.value.copyWith(
                    linkedin: SocialLinkItem(
                        url: value,
                        count:
                            controller.socialLinks.value.linkedin?.count ?? 1),
                  );
                }
              },
              keyboardType: TextInputType.url,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                labelText: "Linkedin Link",
                hintText: "paste your linkedin link here",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: Obx(() {
                return MButton(
                  label: "Submit",
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.updateSocialLinks();
                        },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
