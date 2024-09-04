import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/data/models/shop_category/shop_category.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:lofaz/app/utils/widgets/t3_app_button.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/edit_vendor_profile_controller.dart';

class EditVendorProfileView extends GetView<EditVendorProfileController> {
  const EditVendorProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Center(
            child: Obx(() {
              return InkWell(
                onTap: () {
                  controller.pickImage();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: controller.getProfileImage(),
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Icon(
                      Bootstrap.camera_fill,
                      size: 30,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            initialValue: controller.businessName.value,
            onChanged: (value) {
              controller.businessName.value = value;
            },
            decoration: const InputDecoration(
                isDense: true,
                labelText: "Business Name",
                border: OutlineInputBorder()),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            initialValue: controller.fullName.value,
            onChanged: (value) {
              controller.fullName.value = value;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            decoration: const InputDecoration(
                isDense: true,
                labelText: "Full Name",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            readOnly: true,
            initialValue: controller.vendorProfile.username,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            decoration: const InputDecoration(
                enabled: false,
                isDense: true,
                labelText: "Username",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() {
            return Skeletonizer(
              enabled: controller.isFetchingShopCategories.value,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: "Shop Categories",
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  isDense: true,
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      chipTheme: const ChipThemeData(
                          color: MaterialStatePropertyAll(t2_colorPrimary),
                          checkmarkColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ))),
                  child: MultiSelectBottomSheetField<ShopCategory?>(
                    isDismissible: false,
                    searchable: true,
                    buttonText: const Text("Select your shop categories"),
                    title: const Text("Select your shop categories"),
                    items: controller.shopCategories
                        .map((element) =>
                            MultiSelectItem(element, element.title))
                        .toList(),
                    initialValue: [...controller.selectedShopCategories],
                    onSelectionChanged: (value) {
                      if (value.any((element) => element == null)) {
                        return;
                      }
                      controller.selectedShopCategories.value =
                          (value).map<ShopCategory>((e) => e!).toList();
                    },
                    onConfirm: (value) {
                      if (value.any((element) => element == null)) {
                        return;
                      }
                      controller.selectedShopCategories.value =
                          (value).map<ShopCategory>((e) => e!).toList();
                    },
                    initialChildSize: 0.5,
                    maxChildSize: 0.9,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            initialValue: controller.email.value,
            validator: (value) {
              if (value != null && value.isNotEmpty && !value.isEmail) {
                return "Invalid Email";
              }
              return null;
            },
            onChanged: (value) {
              controller.email.value = value;
            },
            decoration: const InputDecoration(
                isDense: true,
                labelText: "Email",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            initialValue: controller.vendorProfile.phone,
            readOnly: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(
                enabled: false,
                isDense: true,
                labelText: "Phone Number",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            initialValue: controller.address1.value,
            onChanged: (value) {
              controller.address1.value = value;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            decoration: const InputDecoration(
                isDense: true,
                labelText: "Address Line 1",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            textInputAction: TextInputAction.next,
            initialValue: controller.address2.value,
            onChanged: (value) {
              controller.address2.value = value;
            },
            decoration: const InputDecoration(
                isDense: true,
                labelText: "Address Line 2",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            initialValue: controller.city.value,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            onChanged: (value) {
              controller.city.value = value;
            },
            decoration: const InputDecoration(
                isDense: true, labelText: "City", border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            textInputAction: TextInputAction.next,
            initialValue: controller.state.value,
            onChanged: (value) {
              controller.state.value = value;
            },
            decoration: const InputDecoration(
                isDense: true,
                labelText: "State",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            textInputAction: TextInputAction.next,
            initialValue: controller.zipCode.value,
            onChanged: (value) {
              controller.zipCode.value = value;
            },
            maxLength: 6,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: "",
              isDense: true,
              labelText: "Zip",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            textInputAction: TextInputAction.next,
            initialValue: controller.country.value,
            onChanged: (value) {
              controller.country.value = value;
            },
            decoration: const InputDecoration(
                isDense: true,
                labelText: "Country",
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 20,
          ),
          // TextFormField(
          //   initialValue: controller.aboutMe.value,
          //   onChanged: (value) {
          //     controller.aboutMe.value = value;
          //   },
          //   decoration: const InputDecoration(
          //     isDense: true,
          //     labelText: "About Me",
          //     border: OutlineInputBorder(),
          //   ),
          //   maxLines: 4,
          // ),
          InputDecorator(
            decoration: const InputDecoration(
              isDense: true,
              labelText: "About Me",
              border: OutlineInputBorder(),
            ),
            child: Column(
              children: [
                ToolBar(
                  toolBarColor: Colors.cyan.shade50,
                  activeIconColor: Colors.green,
                  padding: const EdgeInsets.all(8),
                  iconSize: 20,
                  controller: controller.htmlEditorController,
                  toolBarConfig: const [
                    ToolBarStyle.bold,
                    ToolBarStyle.italic,
                    ToolBarStyle.underline,
                    ToolBarStyle.headerOne,
                    ToolBarStyle.headerTwo,
                    ToolBarStyle.undo,
                    ToolBarStyle.redo,
                    ToolBarStyle.image,
                    ToolBarStyle.blockQuote,
                  ],
                ),
                QuillHtmlEditor(
                  text: controller.aboutMe.value,
                  hintText: 'Write something about yourself',
                  controller: controller.htmlEditorController,
                  isEnabled: true,
                  minHeight: 200,

                  // textStyle: _editorTextStyle,
                  hintTextStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  hintTextAlign: TextAlign.start,
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  hintTextPadding: EdgeInsets.zero,
                  // backgroundColor: _backgroundColor,
                  onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
                  onTextChanged: (text) => controller.aboutMe.value = text,
                  onEditorCreated: () => debugPrint('Editor has been loaded'),
                  onEditingComplete: (s) => debugPrint('Editing completed $s'),
                  onEditorResized: (height) =>
                      debugPrint('Editor resized $height'),
                  onSelectionChanged: (sel) =>
                      debugPrint('${sel.index},${sel.length}'),
                  loadingBuilder: (context) {
                    return const Center(
                        child: CircularProgressIndicator(
                      strokeWidth: 0.4,
                    ));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          T3AppButton(
              textContent: "Update Profile",
              onPressed: () {
                controller.updateProfile();
              })
        ],
      ),
    );
  }
}
