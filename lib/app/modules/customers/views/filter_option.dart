import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/core/core.dart';
import 'package:lofaz/app/data/models/customer/customer.dart';
import 'package:lofaz/app/modules/customers/controllers/customers_controller.dart';
import 'package:lofaz/app/utils/AppColors.dart';
import 'package:lofaz/app/utils/T4Colors.dart';

class CustomerFilterOption extends GetView<CustomersController> {
  const CustomerFilterOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: const Text("Filter"),
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            ListTile(
              title: const Text("Order By"),
              trailing: SizedBox(
                width: 180,
                child: DropdownButtonFormField<CustomerSortOption>(
                  value: controller.sortOption.value,
                  items: CustomerSortOption.values
                      .map(
                        (e) => DropdownMenuItem(
                            value: e, child: Text(e.displayName)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.sortOption.value = value;
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Sort"),
              trailing: SizedBox(
                width: 180,
                child: DropdownButtonFormField<SortBy>(
                  value: controller.sortBy.value,
                  items: SortBy.values
                      .map(
                        (e) => DropdownMenuItem(
                            value: e, child: Text(e.name.capitalize!)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.sortBy.value = value;
                  },
                ),
              ),
            ),
            // const Spacer(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {
                            controller.resetFilterClicked();
                            Get.back();
                          },
                          child: const Text("Reset"))),
                  const SizedBox(width: 15),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: white,
                            backgroundColor: t2_colorPrimary,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            controller.applyFilterClicked();
                            Get.back();
                          },
                          child: const Text("Apply")))
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
