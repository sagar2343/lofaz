import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/core/core.dart';
import 'package:lofaz/app/modules/products/controllers/products_controller.dart';
import 'package:lofaz/app/utils/AppColors.dart';
import 'package:lofaz/app/utils/T4Colors.dart';

class ProductFilterBottomSheet extends GetView<ProductsController> {
  const ProductFilterBottomSheet({super.key});

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
              title: const Text("Product Filter"),
              centerTitle: true,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).maybePop();
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            ListTile(
              title: const Text("Order By"),
              trailing: SizedBox(
                width: 180,
                child: DropdownButtonFormField<ProductSortOptions>(
                  value: controller.productSortOption.value,
                  items: ProductSortOptions.values
                      .map(
                        (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.displayName,
                                style: const TextStyle(color: Colors.black))),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.productSortOption.value = value;
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Sort"),
              trailing: SizedBox(
                width: 180,
                child: DropdownButtonFormField<SortBy>(
                  value: controller.productSortBy.value,
                  items: SortBy.values
                      .map(
                        (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name.capitalize!,
                              style: const TextStyle(color: Colors.black),
                            )),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.productSortBy.value = value;
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
                            controller.productResetFilterClicked();
                            Navigator.of(context).maybePop();
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
                            controller.productApplyFilterClicked();
                            Navigator.of(context).maybePop();
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
