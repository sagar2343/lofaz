import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/errors/api_failures.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/data/models/orders/order.dart';
import 'package:lofaz/app/data/models/vendor_profile.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/models/product/product.dart';
import '../../../data/models/shop_settings.dart';
import '../../../utils/AppConstant.dart';

class HomeController extends GetxController {
  final VendorServices _vendorServices;
  final authSession = Get.find<AuthServices>().authSession!;
  // final vendor = Rxn<Vendor>();
  final vendorProfile = Rxn<VendorProfile>();
  final catalogs = <Catalog>[].obs;
  final products = <Product>[].obs;
  final orders = <Order>[].obs;
  final storeView = 0.obs;
  final totalEarning = 0.0.obs;
  final productViews = 0.obs;
  final storeSettings = Rxn<ShopSettings>();
  final isOnline = true.obs;

  StreamSubscription? ordersChangeSubs;

  HomeController(this._vendorServices);

  @override
  Future<void> onInit() async {
    handleNotificationPermission();
    // await fetchCurrentVendor();
    await fetchVendorProfile();
    await fetchStoreSettings();
    await fetchAllCatalogs();
    await fetchAllProducts();
    await fetchAllOrders();
    // fetchAnalyticsData();

    ordersChangeSubs ??= orders.listen((p0) {
      fetchAnalyticsData();
    });

    super.onInit();
  }

  Future<void> fetchStoreSettings() async {
    if (vendorProfile.value == null) return;

    await _vendorServices
        .getStoreSettings(vendorProfile.value!.username)
        .then((value) {
      log("getStoreSettings $value");
      if (value != null) {
        storeSettings.value = value;
        isOnline.value = storeSettings.value!.shopStatus;
      }
    });
  }

  fetchAnalyticsData() {
    _vendorServices.fetchstoreView(authSession.userName).then((value) {
      storeView.value = value;
    });

    _vendorServices
        .fetchTotalEarnings(authSession.userId)
        .then((value) => totalEarning.value = value);
    _vendorServices
        .fetchProductView(authSession.userId)
        .then((value) => productViews.value = value);
  }

  // Future<void> fetchCurrentVendor() async {
  //   EasyLoading.show(
  //     status: "Setting up your store...",
  //     maskType: EasyLoadingMaskType.black,
  //   );
  //   await _vendorServices.fetchCurrentProfile().then((value) {
  //     if (value != null) {
  //       vendor.value = value;
  //       fetchVendorProfile();
  //     }
  //   });
  //   EasyLoading.dismiss();
  // }

  fetchVendorProfile() async {
    // if (vendor.value == null) return;
    await _vendorServices
        .fetchVendorProfile(authSession.userName)
        .then((value) {
      if (value != null) {
        vendorProfile.value = value;
      }
    });
  }

  fetchAllCatalogs() async {
    // if (vendor.value == null) return;

    final res = await _vendorServices.getAllCatelogs(limit: 1);

    res.fold((l) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(
            l.errorMessage,
          ),
          backgroundColor: redColor,
        ),
      );
    }, (r) {
      catalogs.value = r.data;
    });

    if (catalogs.isNotEmpty && !getBoolAsync(catalogCreated)) {
      setValue(catalogCreated, true);
    }
    log("catalogs: ${catalogs.length}");
  }

  fetchAllProducts() async {
    final res = await _vendorServices.getAllProducts(limit: 1);

    res.fold((l) => null, (r) {
      products.value = r.data;
    });

    if (products.isNotEmpty && !getBoolAsync(productCreated)) {
      setValue(productCreated, true);
    }
    log("products: ${products.length}");
  }

  handleNotificationPermission() async {
    await Get.find<FirebaseMessaging>().getToken().then((value) {
      log("fcmToken: $value");
    });
    await Get.find<FirebaseMessaging>().subscribeToTopic("everyone");
    NotificationSettings settings =
        await Get.find<FirebaseMessaging>().requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    log("Notification permission status: ${settings.authorizationStatus}");
  }

  Future<void> fetchAllOrders() async {
    // if (vendor.value == null) return;
    await _vendorServices.getAllOrders(authSession.userId).then((value) {
      orders.value = value;
    });
  }

  changeStoreStatus(bool status) async {
    if (status) {
      isOnline.value = status;
      _vendorServices
          .changeShopStatus(authSession.userId, status)
          .then((value) {
        if (value) {
          fetchStoreSettings();
        }
      });
    } else {
      isOnline.value = status;
      _vendorServices
          .changeShopStatus(authSession.userId, status, openAfter: 0)
          .then((value) {
        if (value) {
          fetchStoreSettings();
        }
      });
      // final result = await Get.bottomSheet<(bool, int?)>(
      //     StoreCloseBottomSheet(),
      //     isScrollControlled: true);
      // if (result != null && result.$1) {
      //   isOnline.value = status;
      //   _vendorServices
      //       .changeShopStatus(authSession.userId, status, openAfter: result.$2)
      //       .then((value) {
      //     if (value) {
      //       fetchStoreSettings();
      //     }
      //   });
      // }
    }
  }

  refreshStates() async {
    await fetchStoreSettings();
    await fetchVendorProfile();
    await fetchAllCatalogs();
    await fetchAllProducts();
    await fetchAllOrders();
    await fetchAnalyticsData();
  }
}
