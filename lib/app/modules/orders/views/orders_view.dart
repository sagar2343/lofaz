import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:lofaz/app/modules/orders/views/order_card.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/widgets/custom_tab.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Theme(
          data: Get.theme.copyWith(
            textTheme: const TextTheme(
              headlineSmall: TextStyle(color: Colors.white),
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white,
            ),
          ),
          child: AppBarWithSearchSwitch(
            onChanged: (value) {
              controller.searchString.value = value;
            },
            appBarBuilder: (context) {
              return AppBar(
                centerTitle: true,
                title: const Text("Orders"),
                actions: const [
                  AppBarSearchButton(),
                ],
              );
            },
            clearOnClose: true,
            fieldHintText: "Search by Order No, Phone or Total",
            foregroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              color: Colors.white,
            ),
            keepAppBarColors: true,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Get.find<HomeController>().fetchAllOrders();
        },
        child: Obx(() {
          controller.searchString.value;
          return Column(
            children: [
              PreferredSize(
                  preferredSize: Size(Get.width, 50),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: Colors.white,
                    height: 50,
                    width: Get.width,
                    child: Obx(() {
                      final selectedTab = controller.selectedTab.value;

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        separatorBuilder: (__, _) => const SizedBox(
                          width: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final orderState = OrderTabStates.values[index];

                          return Obx(() {
                            return CustomTab(
                                label: orderState.name.capitalize! +
                                    controller.getOrderCountByState(orderState),
                                isActive: orderState == selectedTab,
                                onTap: () {
                                  controller.selectedTab.value = orderState;
                                });
                          });
                        },
                        itemCount: OrderTabStates.values.length,
                      );
                    }),
                  )),
              if (controller.getFilteredOrder.isEmpty)
                const Expanded(child: Center(child: Text('No Orders Found')))
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    itemCount: controller.getFilteredOrder.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        width: Get.width,
                        index: index,
                        order: controller.getFilteredOrder[index],
                      );
                    },
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
