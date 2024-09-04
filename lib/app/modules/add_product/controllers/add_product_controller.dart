import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/data/models/product/product.dart';
import 'package:lofaz/app/data/models/product/product_unit.dart';
import 'package:lofaz/app/modules/add_product/views/select_source_bottomsheet.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:lofaz/app/modules/products/controllers/products_controller.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/services/vendor_services.dart';
import '../../../utils/T4Colors.dart';

class AddProductController extends GetxController {
  final VendorServices _services;
  final selectedImagePath = Rxn<String>();
  final isActive = true.obs;
  final units = <ProductUnit>[].obs;
  final catalogs = Get.find<HomeController>().catalogs;
  // form fields
  final productName = "".obs;
  final price = Rxn<double>();
  final salePrice = Rxn<double>();
  final unitCount = Rxn<double>();
  final description = "".obs;
  final selectedUnit = Rxn<ProductUnit>();
  final selectedCatalog = Rxn<Catalog>();
  final selectedLabel = Rx(ProductLabel.NONE);
  final stock = Rxn<int>();

  final formKey = GlobalKey<FormState>();

  // in edit mode
  Product? product;
  bool isEditMode = false;

  AddProductController(this._services);

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Product) {
      isEditMode = true;
      product = Get.arguments;
      initEditMode();
    }
    fetchUnits();
    super.onInit();
  }

  initEditMode() {
    productName.value = product!.title;
    price.value = product!.mrp;
    salePrice.value = product!.salesPrice;
    unitCount.value = product!.unitCount;
    description.value = product!.desc;
    selectedUnit.value =
        units.firstWhereOrNull((element) => element.id == product!.unit);
    selectedCatalog.value = catalogs
        .firstWhereOrNull((element) => product!.category.id == element.id);
    selectedLabel.value = getProductLabelfromString(product!.trends);
    stock.value = product!.stock;
  }

  ProductLabel getProductLabelfromString(String? label) {
    switch (label) {
      case "new":
        return selectedLabel.value = ProductLabel.NEW;
      case "hot":
        return selectedLabel.value = ProductLabel.HOT;
      default:
        return ProductLabel.NONE;
    }
  }

  fetchUnits() {
    _services.fetchAllUnits().then((value) {
      units.value = value;
    });
  }

  pickImage() async {
    final imageSource = await getImageSource();

    if (imageSource == null) return;

    final file = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 20,
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
              toolbarTitle: 'Crop Image',
              toolbarColor: t2_colorPrimary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
        ],
        compressFormat: ImageCompressFormat.png,
        compressQuality: 20,
      );

      if (croppedFile != null) {
        selectedImagePath.value = croppedFile.path;
        log(await Get.find<VendorServices>()
            .getFileSize(File(croppedFile.path)));
      }
    }
  }

  Future<ImageSource?> getImageSource() async {
    final result =
        await Get.dialog<ImageSource>(const SelectImageSourceDialog());

    return result;
  }

  addProduct() async {
    if (isEditMode) {
      editProduct();
      return;
    }

    if (selectedImagePath.value == null) {
      toastLong("Please select image");
      return;
    }

    if (!formKey.currentState!.validate()) {
      return;
    }
    EasyLoading.show(
      status: "Adding Product...",
      maskType: EasyLoadingMaskType.black,
    );

    await _services.addProduct(
      imagePath: selectedImagePath.value!,
      catalogId: selectedCatalog.value!.id,
      mrp: price.value!,
      salePrice: salePrice.value ?? price.value!,
      title: productName.value,
      trends: selectedLabel.value.value,
      unitId: selectedUnit.value!.id,
      unitCount: unitCount.value ?? 0,
      description: description.value,
      status: isActive.value,
      stock: stock.value,
    )
        .then((value) {
      if (value) {
        Get.back();
        Get.find<HomeController>().fetchAllProducts();
        setValue(productCreated, value);
        // Get.rootDelegate.toNamed(Routes.PRODUCTS);
      }
    });
    EasyLoading.dismiss();
  }

  editProduct() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    EasyLoading.show(
      status: "Updating Product...",
      maskType: EasyLoadingMaskType.black,
    );

    await _services
        .editProduct(
      product: product!,
      imagePath: selectedImagePath.value,
      catalogId: selectedCatalog.value!.id,
      mrp: price.value!,
      salePrice: salePrice.value ?? price.value!,
      title: productName.value,
      trends: selectedLabel.value.value,
      unitId: selectedUnit.value!.id,
      unitCount: unitCount.value ?? 0,
      description: description.value,
      status: isActive.value,
      stock: stock.value,
    )
        .then((value) {
      if (value) {
        Get.back();

        setValue(productCreated, value);
        if (Get.isRegistered<ProductsController>()) {
          Get.find<ProductsController>().fetchProducts();
        }
      }
    });
    EasyLoading.dismiss();
  }

  bool imageExistInOld() {
    if (selectedImagePath.value != null) {
      return false;
    }

    if (isEditMode &&
        product!.photo.isNotEmpty &&
        product!.photo.first != null) {
      return true;
    }
    return false;
  }

  String get getOldImageUrl {
    return product!.photo.first!.location;
  }

  getDiscount() {
    if (salePrice.value != null &&
        salePrice.value! > 0 &&
        price.value != null) {
      return (((price.value! - salePrice.value!) / price.value!) * 100)
          .toStringAsFixed(1);
    } else {
      return "0.0";
    }
  }
}
