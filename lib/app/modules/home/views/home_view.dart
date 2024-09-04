import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lofaz/app/controllers/app_store.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/T4Colors.dart';
import '../../../utils/widgets/T2BubbleBotoomBar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  int getCurrentIndex(String route) {
    if (route == Routes.HOME) {
      return 0;
    } else if (route.contains(Routes.ORDERS)) {
      return 1;
    } else if (route.contains(Routes.PRODUCTS)) {
      return 2;
    } else if (route.contains(Routes.MANAGE)) {
      return 3;
    } else if (route.contains(Routes.SETTINGS)) {
      return 4;
    } else {
      return 0;
    }
  }

  goToRouteByIndex(int index) {
    if (index == 0) {
      Get.rootDelegate.toNamed(Routes.HOME);
    } else if (index == 1) {
      Get.rootDelegate.toNamed(Routes.ORDERS);
    } else if (index == 2) {
      Get.rootDelegate.toNamed(Routes.PRODUCTS);
    } else if (index == 3) {
      Get.rootDelegate.toNamed(Routes.MANAGE);
    } else if (index == 4) {
      Get.rootDelegate.toNamed(Routes.SETTINGS);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        log("will pop");
        if (Get.rootDelegate.currentConfiguration?.currentPage?.name == null) {
          return true;
        }

        if (Get.rootDelegate.currentConfiguration?.currentPage?.name ==
            Routes.HOME) {
          return true;
        }
        Get.rootDelegate.popRoute();

        return false;
      },
      child: Scaffold(
        bottomNavigationBar: GetRouterOutlet.builder(
            routerDelegate: Get.rootDelegate,
            builder: (context, _, navConfig) {
              log(navConfig?.locationString);

              return BubbleBottomBar(
                opacity: .2,
                currentIndex: getCurrentIndex(navConfig?.locationString ?? Routes.HOME),
                backgroundColor: Get.find<AppStore>().appBarColor.value,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                elevation: 8,
                onTap: goToRouteByIndex,
                hasNotch: false,
                hasInk: true,
                inkColor: t2_colorPrimaryLight,
                items: <BubbleBottomBarItem>[
                  tab(Bootstrap.house_door_fill, "Home"),
                  tab(Bootstrap.list_stars, "Orders"),
                  tab(Bootstrap.cart, "Catalog"),
                  tab(Bootstrap.clipboard, "Tools"),
                  tab(Bootstrap.gear, "Settings"),
                ],
              );
            }),
        body: GetRouterOutlet(
          // delegate: Get.rootDelegate,
          initialRoute: Routes.DASHBOARD,
        ),
      ),
    );
  }
}
