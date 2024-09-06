import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lofaz/app/utils/widgets/T4Button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../utils/T4Colors.dart';
import '../controllers/add_category_controller.dart';

class AddCategoryView extends GetView<AddCategoryController> {
  AddCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isEditMode ? 'Update Category' : 'Add Category'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: () {
                  controller.pickImage();
                },
                child: Card(
                  child: SizedBox(
                    width: 200,
                    child: Obx(() {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: controller.imageExistInOld()
                            ? CachedNetworkImage(
                                imageUrl: controller.getOldImageUrl)
                            : controller.selectedImagePath.value != null
                                ? Image.file(
                                    File(controller.selectedImagePath.value!),
                                    fit: BoxFit.fill)
                                : const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Bootstrap.camera,
                                            color: black,
                                            size: 50,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "Add category Image Recommended Size: 800x800",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            35.height,
            TextFormField(
              initialValue: controller.catalogName.value,
              onChanged: (value) {
                controller.catalogName.value = value;
                controller.urlTextFieldController.text =
                    controller.generateSlug(value);
              },
              style: primaryTextStyle(size: 18),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
              ],
              maxLength: 60,
              // obscureText: isPassword,
              decoration: InputDecoration(
                counterText: "",
                isDense: true,
                helperText: 'required',
                contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                labelText: "Category Name*",
                filled: true,
                fillColor: t3_edit_background,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
              ),
            ),
            20.height,
            TextFormField(
              initialValue: controller.metaTitle.value,
              onChanged: (value) {
                controller.metaTitle.value = value;
              },
              style: primaryTextStyle(size: 18),

              maxLength: 60,
              // obscureText: isPassword,
              decoration: InputDecoration(
                counterText: "",
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                labelText: "Meta title",
                filled: true,
                fillColor: t3_edit_background,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
              ),
            ),
            20.height,
            TextFormField(
              initialValue: controller.metaDescription.value,
              onChanged: (value) {
                controller.metaDescription.value = value;
              },
              style: primaryTextStyle(size: 18),
              maxLength: 160,
              maxLines: 4,
              // obscureText: isPassword,
              decoration: InputDecoration(
                counterText: "",
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                labelText: "Meta description",
                filled: true,
                fillColor: t3_edit_background,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
              ),
            ),
            20.height,
            TextFieldTags<String>(
              textfieldTagsController: controller.stringTagController,
              initialTags: const [],
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                if (controller.stringTagController.getTags != null &&
                    controller.stringTagController.getTags!.length > 4) {
                  return "Max 5 keywords allowed";
                }

                return null;
              },
              inputFieldBuilder: (context, inputFieldValues) {
                return TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
                  ],
                  onTap: () {
                    controller.stringTagController.getFocusNode?.requestFocus();
                  },
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                  readOnly: inputFieldValues.tags.length > 4,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    fillColor: t3_edit_background,
                    labelText: 'keywords',
                    counter: Text('${inputFieldValues.tags.length}/5'),
                    contentPadding: const EdgeInsets.fromLTRB(18, 18, 4, 8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: t4_textColorSecondary, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          color: t4_textColorSecondary, width: 0.0),
                    ),
                    isDense: true,
                    helperText: 'Max 5 keywords allowed',
                    hintText: inputFieldValues.tags.length > 4
                        ? ''
                        : inputFieldValues.tags.isEmpty
                            ? "Add keywords"
                            : "Add",
                    errorText: inputFieldValues.error,
                    prefixIconConstraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7),
                    prefixIcon: inputFieldValues.tags.isNotEmpty
                        ? SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            controller: inputFieldValues.tagScrollController,
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                                runSpacing: 4.0,
                                spacing: 4.0,
                                children:
                                    inputFieldValues.tags.map((String tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: Color.fromARGB(255, 74, 137, 92),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          tag,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                          ),
                                          onTap: () {
                                            inputFieldValues.onTagRemoved(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                          )
                        : null,
                  ),
                  onChanged: inputFieldValues.onTagChanged,
                  onFieldSubmitted: (value) {
                    inputFieldValues.onTagSubmitted(value);
                  },
                );
              },
            ),
            20.height,
            TextFormField(
              style: primaryTextStyle(size: 18),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-z0-9-]")),
              ],
              controller: controller.urlTextFieldController,
              decoration: InputDecoration(
                hintText: "unique-url",
                isDense: true,
                contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                labelText: 'Url',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // labelText: "Enter Business Name",

                prefixIcon: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "  ${controller.urlPrefix}/"
                            .replaceFirst('https://', ''),
                        style: primaryTextStyle(size: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '/',
                      style: primaryTextStyle(size: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                prefixIconConstraints: BoxConstraints(
                    minHeight: 0, minWidth: 0, maxWidth: Get.width * 0.5),
                filled: true,
                fillColor: t3_edit_background,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: t4_textColorSecondary, width: 0.0),
                ),
              ),
            ),
            20.height,
            Obx(() {
              return SwitchListTile(
                title: const Text("Active"),
                activeColor: Colors.green,
                inactiveTrackColor: Colors.red,
                value: controller.isActive.value,
                onChanged: (v) {
                  controller.isActive.value = v;
                },
              );
            }),
            25.height,
            T4Button(
              textContent: controller.isEditMode ? "Update" : "Add",
              onPressed: () {
                controller.addCatalog();
                Future.delayed(Duration(seconds: 2), () {
    _requestReview();
  });
              },
              borderRadius: 12,
            ),
            50.height,
          ],
        ),
      ),
    );
  }
  final InAppReview inAppReview = InAppReview.instance;

  Future<void> _requestReview() async {
    // Check if the in-app review feature is available
    if (await inAppReview.isAvailable()) {
      final prefs = await SharedPreferences.getInstance();
      final lastRequested = prefs.getInt('last_review_request') ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;

      // Check if 30 minutes (1800000 milliseconds) have passed since the last request
      if (now - lastRequested > 30 * 60 * 1000) { // 30 minutes
        inAppReview.requestReview();
        prefs.setInt('last_review_request', now);
      }
    }
  }
}
