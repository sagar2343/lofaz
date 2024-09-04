import 'package:flutter/material.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:lofaz/app/utils/AppWidget.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:lofaz/app/utils/m_button.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Container(
          padding: const EdgeInsets.fromLTRB(16, 42, 16, 38),
          margin: const EdgeInsets.only(bottom: 8, top: 8),
          child: Row(
            children: [
              Obx(() {
                return CircleAvatar(
                  backgroundImage: controller.getProfileImage(),
                  radius: 22,
                );
              }),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hello, ${controller.getDisplayName}",
                    style: primaryTextStyle(color: white),
                  ),
                  Text(
                    controller.homeController.authSession.userName,
                    style: primaryTextStyle(color: white),
                  ),
                ],
              ).expand(),
              Obx(() {
                return Switch(
                    value: controller.homeController.isOnline.value,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.red,
                    onChanged: (val) {
                      controller.homeController.changeStoreStatus(val);
                    });
              })
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Get.find<HomeController>().onInit();
        },
        child: Obx(() {
          return ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    decoration:
                        const BoxDecoration(color: t2_colorPrimary_light),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 30, 16, 8),
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: defaultBoxShadow(),
                      backgroundColor: context.cardColor,
                    ),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Share Link on Whatsapp",
                                  style: primaryTextStyle(size: 18))
                              .paddingOnly(left: 8, top: 8),
                          Text("Your customer can visit  your online store and place orders from this link.",
                                  style: primaryTextStyle(size: 15))
                              .paddingOnly(left: 8, top: 8)
                              .expand(),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    controller.launchStoreUrl();
                                  },
                                  child: Text(
                                      "$mainDomain/${controller.getUserName}",
                                      style: primaryTextStyle(
                                        size: 18,
                                        color: Colors.indigo,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.indigo,
                                        textDecorationStyle:
                                            TextDecorationStyle.solid,
                                      ).copyWith(
                                        decorationThickness: 3,
                                      )),
                                ),
                              ),
                              // const Spacer(),
                              MButton(
                                backgroundColor: whatsapp,
                                forgroundColor: white,
                                onPressed: () {
                                  controller.shareClick();
                                },
                                icon: Icons.share,
                                label: "Share",
                              )
                            ],
                          ).paddingOnly(
                              // bottom: 18,
                              left: 8,
                              right: 8)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.showStepper.value)
                const StepperWidget()
              else
                Skeletonizer(
                  enabled: controller.isLoadingVendorStats.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 16),
                    child: Card(
                      color: context.cardColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                text("Overview"),
                                const Spacer(),
                                Obx(() {
                                  return DropdownButton<DashboardStatsTime>(
                                    value:
                                        controller.selectedDashboardStats.value,
                                    elevation: 16,
                                    style: primaryTextStyle(),
                                    isExpanded: false,
                                    underline: Container(
                                      height: 0,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (newValue) {
                                      if (newValue == null) {
                                        return;
                                      }
                                      controller.selectedDashboardStats.value =
                                          newValue;
                                      controller.fetchVendorStats();
                                    },
                                    items: DashboardStatsTime.values.map<
                                        DropdownMenuItem<
                                            DashboardStatsTime>>((value) {
                                      return DropdownMenuItem<
                                          DashboardStatsTime>(
                                        value: value,
                                        child: Text(value.value),
                                      );
                                    }).toList(),
                                  );
                                })
                              ],
                            ),
                            10.height,
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.spaceBetween,
                              children: [
                                Obx(() {
                                  return DashboadOverviewCard(
                                    title: "Orders",
                                    price: controller
                                        .vendorStats.value.totalOrder
                                        .toString(),
                                    icon: Bootstrap.basket,
                                  );
                                }),
                                Obx(() {
                                  return DashboadOverviewCard(
                                    title: "Total Sales",
                                    price: NumberFormat.simpleCurrency(
                                            name: "INR", decimalDigits: 1)
                                        .format(controller
                                            .vendorStats.value.totalAmount),
                                    icon: Bootstrap.graph_up,
                                  );
                                }),
                                Obx(() {
                                  return DashboadOverviewCard(
                                    title: "Total Cart",
                                    price: NumberFormat.compact().format(
                                        controller.vendorStats.value.totalCart),
                                    icon: Bootstrap.bar_chart,
                                  );
                                }),
                                Obx(() {
                                  return DashboadOverviewCard(
                                    title: "Wishlist",
                                    price: NumberFormat.compact().format(
                                        controller
                                            .vendorStats.value.totalWishlist),
                                    icon: Bootstrap.pie_chart,
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

class DashboadOverviewCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String price;
  const DashboadOverviewCard({
    super.key,
    required this.icon,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() / 2 - 40,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: radius(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: secondaryTextStyle(color: Colors.black)),
          Text(price, style: boldTextStyle(size: 18, color: Colors.black)),
        ],
      ),
    );
  }
}

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int currStep = 1;

  late List<Step> steps;

  @override
  initState() {
    if (getBoolAsync(catalogCreated)) {
      currStep++;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    steps = [
      Step(
        title: Text('Create Your Store', style: primaryTextStyle()),
        isActive: currStep == 0,
        subtitle: const Text(
            "Congratulations you have successfully create your store."),
        state: currStep > 0 ? StepState.complete : StepState.indexed,
        content: Align(
            alignment: Alignment.centerLeft,
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Submit"))),
      ),
      Step(
        title: Text('Create your catelog', style: primaryTextStyle()),
        subtitle: const Text(
            "Congratulations you have successfully create your store."),
        isActive: currStep == 1,
        state: currStep > 1 ? StepState.complete : StepState.indexed,
        content: Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.ADD_CATEGORY);
                  setState(() {
                    currStep++;
                  });
                },
                child: const Text("Add Catalog"))),
      ),
      Step(
        title: Text('Add multiple product', style: primaryTextStyle()),
        subtitle: const Text(
            "Add your first product by adding the product image and information."),
        isActive: currStep == 2,
        state: currStep > 2 ? StepState.complete : StepState.indexed,
        content: Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.ADD_PRODUCT);
                  setState(() {
                    currStep++;
                  });
                },
                child: const Text("Add Product"))),
      ),
      Step(
        title: Text('Share profile to anywhere', style: primaryTextStyle()),
        subtitle: const Text(
            "You can share your profile to any of your social media account"),
        isActive: currStep == 3,
        state: StepState.indexed,
        content: Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
                onPressed: () {
                  if (currStep < steps.length - 1) {
                    setState(() {
                      currStep++;
                    });
                  } else {
                    Get.find<DashboardController>().showStepper.value = false;
                  }
                },
                child: const Text("Share"))),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      child: Stepper(
        steps: steps,
        type: StepperType.vertical,
        currentStep: currStep,
        controlsBuilder: (context, details) => const SizedBox(),
      ),
    );
  }
}
