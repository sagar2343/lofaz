import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:lofaz/app/data/models/shop_category/shop_category.dart';
import 'package:lofaz/app/utils/m_button.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/T4Colors.dart';
import '../controllers/register_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25,
        ),
        children: [
          // const SizedBox(
          //   height: 35,
          // ),
          // Center(
          //   child: Image.asset(
          //     Assets.images.lofaz1.path,
          //     width: Get.width * 0.2,
          //   ),
          // ),
          const SizedBox(
            height: 35,
          ),
          Text(
            "Store Details",
            style: Get.textTheme.displaySmall,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    controller.firstName.value = value;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
                  ],
                  style: primaryTextStyle(size: 18),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                    labelText: "First Name",
                    filled: true,
                    fillColor: t3_edit_background,
                    helperText: 'required',
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  onChanged: (value) {
                    controller.lastName.value = value;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
                  ],
                  style: primaryTextStyle(size: 18),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
                    labelText: "Last Name",
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
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            onChanged: (value) {
              controller.businessName.value = value;
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[A-Za-z0-9- ]")),
            ],
            style: primaryTextStyle(size: 18),
            // obscureText: isPassword,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
              labelText: "Enter Business Name",
              helperText: 'required',
              filled: true,
              fillColor: t3_edit_background,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: t4_textColorSecondary, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: t4_textColorSecondary, width: 0.0),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Your Store link"),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (value) {
              controller.userName.value = value;
            },
            style: primaryTextStyle(size: 18),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-z0-9-]")),
            ],

            // obscureText: isPassword,
            decoration: InputDecoration(
              hintText: "username",
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
              // labelText: "Enter Business Name",
              prefixIcon: Text(
                "  $mainUrl/",
                style: primaryTextStyle(size: 18),
              ),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 0,
                minWidth: 0,
              ),
              filled: true,
              fillColor: t3_edit_background,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: t4_textColorSecondary, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide:
                    const BorderSide(color: t4_textColorSecondary, width: 0.0),
              ),
            ),
          ),
          const Text("you can use a-z,0-9 and -"),
          const SizedBox(
            height: 15,
          ),
          // DropdownButtonFormField<String>(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: (value) {
          //     if (value == null) {
          //       return 'Please select category';
          //     }
          //     return null;
          //   },
          //   value: "Shop",
          //   decoration: InputDecoration(
          //     isDense: true,
          //     contentPadding: const EdgeInsets.fromLTRB(18, 8, 4, 8),
          //     labelText: "Select your store category",
          //     filled: true,
          //     fillColor: t3_edit_background,
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(6),
          //       borderSide:
          //           const BorderSide(color: t4_textColorSecondary, width: 0.0),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(6),
          //       borderSide:
          //           const BorderSide(color: t4_textColorSecondary, width: 0.0),
          //     ),
          //   ),
          //   elevation: 16,
          //   style: primaryTextStyle(),
          //   isExpanded: true,
          //   onChanged: (newValue) {
          //     // controller.selectedCatalog.value = newValue;
          //   },
          //   items: const [
          //     DropdownMenuItem<String>(
          //       value: "Shop",
          //       child: Text("Shop"),
          //     )
          //   ],
          // ),
          Obx(() {
            return Theme(
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
                    .map((element) => MultiSelectItem(element, element.title))
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
            );
          }),
          const SizedBox(
            height: 25,
          ),
          Obx(() {
            return MButton(
              label: "Create Store",
              verticalPadding: 10,
              onPressed: (controller.firstName.value.isEmpty ||
                      controller.businessName.value.isEmpty ||
                      controller.userName.value.isEmpty ||
                      controller.selectedShopCategories.isEmpty)
                  ? null
                  : () {
                      controller.createStoreClicked();
                    },
            );
          })
        ],
      ),

      // body: Container(
      //   color: context.scaffoldBackgroundColor,
      //   height: context.height(),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: <Widget>[
      //         SizedBox(
      //           height: (context.height()) / 3.5,
      //           child: Stack(
      //             children: <Widget>[
      //               Image.asset(
      //                 Assets.images.t3IcBackground.path,
      //                 fit: BoxFit.fill,
      //                 width: context.width(),
      //                 color: t4_colorPrimary,
      //               ),
      //               Container(
      //                 margin: const EdgeInsets.only(left: 16),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: <Widget>[
      //                     Text("Create Account",
      //                         style: boldTextStyle(size: 34, color: white)),
      //                     const SizedBox(height: 4),
      //                     Text("Recipe for Happiness...",
      //                         style: boldTextStyle(size: 20, color: white))
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         20.height,
      //         Container(
      //             alignment: Alignment.topRight,
      //             margin: const EdgeInsets.only(right: 45),
      //             transform: Matrix4.translationValues(0.0, -40.0, 0.0),
      //             child: Image.asset(Assets.images.t3IcIcon.path,
      //                 height: 70, width: 70)),
      //         t3EditTextField(
      //           "Enter Business Name",
      //           isPassword: false,
      //           onChanged: (p0) {
      //             controller.businessName.value = p0;
      //           },
      //         ),
      //         // const SizedBox(height: 16),
      //         // t3EditTextField("User Name", isPassword: false),
      //         const SizedBox(height: 25),
      //         Padding(
      //           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      //           child: T3AppButton(
      //               textContent: "Create Store",
      //               onPressed: () {
      //                 controller.createStoreClicked();
      //               }),
      //         ),
      //         const SizedBox(height: 60),
      //         // Row(
      //         //   mainAxisAlignment: MainAxisAlignment.center,
      //         //   children: <Widget>[
      //         //     Text(t3_lbl_already_have_account, style: primaryTextStyle()),
      //         //     Container(
      //         //       margin: const EdgeInsets.only(left: 4),
      //         //       child: GestureDetector(
      //         //           child: Text(t3_lbl_sign_in,
      //         //               style: TextStyle(
      //         //                   fontSize: 18.0,
      //         //                   decoration: TextDecoration.underline,
      //         //                   color: t3_colorPrimary)),
      //         //           onTap: () {}),
      //         //     )
      //         //   ],
      //         // ),
      //         Container(
      //           alignment: Alignment.bottomLeft,
      //           margin: const EdgeInsets.only(
      //               top: 50, left: 16, right: 16, bottom: 20),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Image.asset(Assets.images.t3IcSign2.path,
      //                   height: 50,
      //                   width: 70,
      //                   color: Get.find<AppStore>().iconColor.value),
      //               Container(
      //                   margin: const EdgeInsets.only(top: 25, left: 10),
      //                   child: Image.asset(Assets.images.t3IcSign4.path,
      //                       height: 50,
      //                       width: 70,
      //                       color: Get.find<AppStore>().iconColor.value)),
      //               Container(
      //                   margin: const EdgeInsets.only(top: 25, left: 10),
      //                   child: Image.asset(Assets.images.t3IcSign3.path,
      //                       height: 50,
      //                       width: 70,
      //                       color: Get.find<AppStore>().iconColor.value)),
      //               Image.asset(Assets.images.t3IcSign1.path,
      //                   height: 80,
      //                   width: 80,
      //                   color: Get.find<AppStore>().iconColor.value),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
