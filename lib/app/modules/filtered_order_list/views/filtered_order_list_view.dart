import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/widgets/custom_tab.dart';
import '../../orders/views/order_card.dart';
import '../controllers/filtered_order_list_controller.dart';

class FilteredOrderListView extends GetView<FilteredOrderListController> {
  const FilteredOrderListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.argument.title),
        centerTitle: true,
        bottom: PreferredSize(
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
      ),
      body: Obx(() {
        if (controller.getFilteredOrder().isEmpty) {
          return const Center(child: Text('No Orders Found'));
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemCount: controller.getFilteredOrder().length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return OrderCard(
              width: Get.width,
              index: index,
              order: controller.getFilteredOrder()[index],
            );
          },
        );
      }),
    );
  }
}
