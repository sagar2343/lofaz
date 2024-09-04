import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/modules/products/controllers/products_controller.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../data/services/vendor_services.dart';
import '../../add_product/views/select_source_bottomsheet.dart';
import '../../home/controllers/home_controller.dart';

class AddCategoryController extends GetxController {
  final selectedImagePath = Rxn<String>();
  final catalogName = "".obs;
  final isActive = true.obs;
  final metaTitle = "".obs;
  final metaDescription = ''.obs;
  Catalog? oldCategory;
  bool isEditMode = false;
  // final imageChnagedOnEdit = false.obs;
  final stringTagController = StringTagController();
  final urlTextFieldController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Catalog) {
      isEditMode = true;
      oldCategory = Get.arguments;
      catalogName.value = oldCategory!.title;
      isActive.value = oldCategory!.status;
    }

    super.onInit();
  }

  String get urlPrefix {
    return 'https://lofaz.in/${Get.find<HomeController>().vendorProfile.value!.username}/category';
  }

  pickImage() async {
    final imageSource = await getImageSource();

    if (imageSource == null) return;

    final file = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 10,
    );

    if (file != null) {
      log(await Get.find<VendorServices>().getFileSize(File(file.path)));
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        maxHeight: 800,
        maxWidth: 800,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
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
        log(await Get.find<VendorServices>()
            .getFileSize(File(croppedFile.path)));
      }
    }
  }

  String generateSlug(String title) {
    // Convert to lowercase
    String slug = title.toLowerCase();

    // Remove non-alphanumeric characters (except spaces)
    slug = slug.replaceAll(RegExp(r'[^a-z0-9\s]'), '');

    // Replace spaces with hyphens
    slug = slug.replaceAll(RegExp(r'\s+'), '-');

    // Trim leading and trailing hyphens
    slug = slug.replaceAll(RegExp(r'(^-+|-+$)'), '');

    return slug;
  }

  Future<ImageSource?> getImageSource() async {
    final result =
        await Get.dialog<ImageSource>(const SelectImageSourceDialog());

    return result;
  }

  addCatalog() async {
    if (isEditMode) {
      editCatalog();
      return;
    }

    if (catalogName.value.isEmpty) {
      toastLong("Please enter catalog name");
      return;
    }
    if (selectedImagePath.value == null) {
      toastLong("Please select image");
      return;
    }
    EasyLoading.show(
      status: "Creating Catalog",
      maskType: EasyLoadingMaskType.black,
    );
    await Get.find<VendorServices>()
        .createCatelog(
      userId: Get.find<HomeController>().authSession.userId,
      title: catalogName.value,
      image: File(selectedImagePath.value!),
      active: isActive.value,
      metaTitle: metaTitle.value,
      metaDescription: metaDescription.value,
      keywords: (stringTagController.getTags ?? []),
      url: '$urlPrefix/${urlTextFieldController.text.trim()}',
    )
        .then((value) {
      if (value) {
        Get.back();
        setValue(catalogCreated, value);

        Future.delayed(
          GetNumUtils(2).seconds,
          () {
            if (Get.isRegistered<ProductsController>()) {
              Get.find<ProductsController>().initialFetchCategory();
            }
          },
        );
      }
    });
    EasyLoading.dismiss();
  }

  editCatalog() async {
    if (catalogName.value.isEmpty) {
      toastLong("Please enter catalog name");
      return;
    }
    // if (selectedImagePath.value == null) {
    //   toastLong("Please select image");
    //   return;
    // }

    EasyLoading.show(
      status: "Updating Catalog",
      maskType: EasyLoadingMaskType.black,
    );
    await Get.find<VendorServices>()
        .editCatalog(
      title: catalogName.value,
      active: isActive.value,
      catalog: oldCategory!,
      imageFilePath: selectedImagePath.value,
    )
        .then((value) {
      if (value) {
        Get.back();
        setValue(catalogCreated, value);
        Get.find<HomeController>().fetchAllCatalogs();
      }
    });
    EasyLoading.dismiss();
  }

  bool imageExistInOld() {
    if (selectedImagePath.value != null) {
      return false;
    }

    if (isEditMode && oldCategory!.photos.isNotEmpty) {
      return true;
    }
    return false;
  }

  String get getOldImageUrl {
    return oldCategory!.photos.first.location;
  }
}
