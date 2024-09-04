import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lofaz/app/data/errors/api_failures.dart';
import 'package:lofaz/app/data/models/vendor_stats/vendor_stats.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:nb_utils/nb_utils.dart' hide log;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/gen/assets.gen.dart';

class DashboardController extends GetxController {
  final VendorServices _vendorServices;
  final showStepper = true.obs;

  final homeController = Get.find<HomeController>();
  StreamSubscription? stepperSubs;
  final selectedDashboardStats = DashboardStatsTime.thisWeek.obs;
  final vendorStats = Rx<VendorStats>(VendorStats.empty());
  final isLoadingVendorStats = false.obs;

  DashboardController(this._vendorServices);

  @override
  void onInit() {
    showStepper.value = getShowStepper();

    if (showStepper.value) {
      stepperSubs = homeController.catalogs.listen((p0) {
        if (p0.isNotEmpty) {
          showStepper.value = false;
        }
      });
    }

    fetchVendorStats();
    super.onInit();
  }

  fetchVendorStats() async {
    isLoadingVendorStats.value = true;
    await _vendorServices
        .getVendorStats(startDate: selectedDashboardStats.value.fromDate)
        .then((value) {
      value.fold((l) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text(l.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }, (r) {
        vendorStats.value = r;
      });
    });

    isLoadingVendorStats.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    stepperSubs?.cancel();
    super.onClose();
  }

  String get getDisplayName {
    return homeController.authSession.businessName.capitalize ?? "Lofaz";
  }

  String get getUserName {
    return homeController.authSession.userName;
  }

  String get getPhoneNumber {
    return Get.find<AuthServices>().getPhoneNumber;
  }

  shareClick() {
    Share.share(
        "Hey! you can now order online from my website $getUserName\nusing this link: $mainUrl/$getUserName\nIf you need any help you can contact me on $getPhoneNumber\nThank You");
  }

  launchStoreUrl() {
    launchUrlString(
      "$mainUrl/$getUserName",
      mode: LaunchMode.externalApplication,
    );
  }

  bool getShowStepper() {
    return !(getBoolAsync(catalogCreated) && getBoolAsync(productCreated));
  }

  getProfileImage() {
    return (homeController.vendorProfile.value != null &&
            homeController.vendorProfile.value!.photo != null)
        ? CachedNetworkImageProvider(homeController.vendorProfile.value!.photo!)
        : AssetImage(Assets.images.shopDefault.path);
  }

  String getTotalOrderStats() {
    switch (selectedDashboardStats.value) {
      case DashboardStatsTime.lifetime:
        return NumberFormat.compact().format(homeController.orders.length);

      case DashboardStatsTime.thisDay:
        return NumberFormat.compact().format(homeController.orders
            .where((p0) => p0.createdAt
                .isAfter(DateTime.now().subtract(const Duration(days: 1))))
            .length);

      case DashboardStatsTime.thisWeek:
        return NumberFormat.compact().format(homeController.orders
            .where((p0) => p0.createdAt
                .isAfter(DateTime.now().subtract(const Duration(days: 7))))
            .length);

      case DashboardStatsTime.thisMonth:
        return NumberFormat.compact().format(homeController.orders
            .where((p0) => p0.createdAt
                .isAfter(DateTime.now().subtract(const Duration(days: 30))))
            .length);

      default:
        return NumberFormat.compact().format(homeController.orders.length);
    }
  }

  getTotalSalesStats() {
    switch (selectedDashboardStats.value) {
      case DashboardStatsTime.lifetime:
        return NumberFormat.simpleCurrency(name: "INR", decimalDigits: 1)
            .format(homeController.totalEarning.value);

      default:
        return NumberFormat.simpleCurrency(name: "INR", decimalDigits: 1)
            .format(homeController.totalEarning.value);
    }
  }
}

enum DashboardStatsTime {
  thisDay("24 hours"),
  thisWeek("7 days"),
  thisMonth("30 days"),
  lifetime("Life Time");

  const DashboardStatsTime(this.value);

  final String value;
}

extension DashboardStatsTimeX on DashboardStatsTime {
  DateTime get fromDate {
    switch (this) {
      case DashboardStatsTime.thisDay:
        return DateTime.now().subtract(const Duration(days: 1));
      case DashboardStatsTime.thisWeek:
        return DateTime.now().subtract(const Duration(days: 7));
      case DashboardStatsTime.thisMonth:
        return DateTime.now().subtract(const Duration(days: 30));
      default:
        return DateTime(2024);
    }
  }
}
