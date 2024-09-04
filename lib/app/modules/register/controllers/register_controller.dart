import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/models/shop_category/shop_category.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterController extends GetxController {
  final AuthServices _authServices;

  RegisterController(this._authServices);
  final firstName = "".obs;
  final lastName = "".obs;
  final businessName = "".obs;
  final userName = "".obs;
  final shopCategories = <ShopCategory>[].obs;
  final selectedShopCategories = <ShopCategory>[].obs;
  final isFetchingShopCategories = true.obs;

  @override
  void onInit() async {
    fetchShopCategories();
    super.onInit();
  }

  fetchShopCategories() {
    _authServices.fetchShopCategories().then((value) {
      shopCategories.value = value;
      isFetchingShopCategories.value = false;
    });
  }

  createStoreClicked() async {
    EasyLoading.show(
        status: "Please wait...", maskType: EasyLoadingMaskType.black);
    final res = await _authServices.registerVendor(
      businessName: businessName.value,
      userName: userName.value,
      firstName: firstName.value,
      lastName: lastName.value,
      fullName: "$firstName ${lastName.isNotEmpty ? lastName : ""}",
      // ignore: invalid_use_of_protected_member
      selectedShopCategories: selectedShopCategories.value,
    );

    res.fold((l) {
      l.when(
        userNameAlreadyExist: () {
          Get.snackbar(
            "Error",
            "User Name Already Exist",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor.withOpacity(0.7),
            colorText: Colors.white,
          );
        },
        noInternet: () {
          Get.snackbar(
            "Error",
            "No Internet Connection",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor.withOpacity(0.7),
            colorText: Colors.white,
          );
        },
        unExpectedError: () {
          Get.snackbar(
            "Error",
            "Something went wrong",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor.withOpacity(0.7),
            colorText: Colors.white,
          );
        },
        serverError: (e) {
          Get.snackbar(
            "Error",
            e ?? 'Something went wrong',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor.withOpacity(0.7),
            colorText: Colors.white,
          );
        },
      );
    }, (r) {
      Get.offAllNamed(Routes.HOME);
    });

    EasyLoading.dismiss();
  }
}
