import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lofaz/app/data/errors/api_failures.dart';
import 'package:lofaz/app/data/models/shop_category/shop_category.dart';
import 'package:lofaz/app/data/models/vendor_profile.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../data/services/vendor_services.dart';
import '../../../utils/T4Colors.dart';
import '../../../utils/gen/assets.gen.dart';

class EditVendorProfileController extends GetxController {
  final selectedImagePath = Rxn<String>();
  final vendorProfile = Get.arguments as VendorProfile;

  final businessName = "".obs;
  final fullName = "".obs;
  final email = "".obs;
  final address1 = "".obs;
  final address2 = "".obs;
  final city = "".obs;
  final state = "".obs;
  final country = "".obs;
  final zipCode = "".obs;
  final aboutMe = "".obs;

  final shopCategories = <ShopCategory>[].obs;
  final selectedShopCategories = <ShopCategory>[].obs;
  final isFetchingShopCategories = true.obs;
  final QuillEditorController htmlEditorController = QuillEditorController();
  // final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initValue();
    fetchShopCategories();

    super.onInit();
  }

  fetchShopCategories() {
    Get.find<AuthServices>().fetchShopCategories().then((value) {
      shopCategories.value = value;
      isFetchingShopCategories.value = false;
      selectedShopCategories.value = value
          .where(
              (element) => vendorProfile.shopCategoryIds.contains(element.id))
          .toList();
    });
  }

  initValue() {
    businessName.value = vendorProfile.businessName;
    fullName.value = vendorProfile.fullName;
    email.value = vendorProfile.email ?? "";
    address1.value = vendorProfile.addressLine1 ?? "";
    address2.value = vendorProfile.addressLine2 ?? "";
    city.value = vendorProfile.city ?? "";
    state.value = vendorProfile.state ?? "";
    country.value = vendorProfile.country ?? "";
    zipCode.value = vendorProfile.zip ?? "";
    aboutMe.value = vendorProfile.about ?? "";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  pickImage() async {
    final file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);

    if (file != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        maxHeight: 512,
        maxWidth: 512,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: t2_colorPrimary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
        ],
        compressFormat: ImageCompressFormat.png,
        compressQuality: 10,
      );

      if (croppedFile != null) {
        selectedImagePath.value = croppedFile.path;
        print(await Get.find<VendorServices>()
            .getFileSize(File(croppedFile.path)));
      }
    }
  }

  imageExist() {
    if (selectedImagePath.value != null) {
      return false;
    }

    if (vendorProfile.photo != null) {
      return true;
    }
    return false;
  }

  getProfileImage() {
    return (imageExist()
        ? CachedNetworkImageProvider(vendorProfile.photo!)
        : selectedImagePath.value != null
            ? FileImage(
                File(selectedImagePath.value!),
              )
            : AssetImage(
                Assets.images.placeholder.path,
              ));
  }

  updateProfile() async {
    EasyLoading.show(
      status: "Updating your profile...",
      maskType: EasyLoadingMaskType.black,
    );
    await Get.find<VendorServices>()
        .updateVendorProfile(
      businessName: businessName.value,
      fullName: fullName.value,
      email: email.value,
      address1: address1.value,
      address2: address2.value,
      city: city.value,
      state: state.value,
      country: country.value,
      zipCode: zipCode.value,
      aboutMe: aboutMe.value,
      imagePath: selectedImagePath.value,
      selectedCategoryIds:
          selectedShopCategories.map((element) => element.id).toList(),
    )
        .then((value) {
      value.fold((l) {
        Get.snackbar(
          "Error Updating Profile",
          l.errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: redColor.withOpacity(0.7),
          colorText: Colors.white,
        );
      }, (r) {
        Get.back();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text("Profile Updated"),
            backgroundColor: greenColor,
          ),
        );
        Get.find<HomeController>().fetchVendorProfile();
      });
    });
    EasyLoading.dismiss();
  }
}
