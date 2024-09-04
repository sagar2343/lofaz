import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/core/core.dart';
import 'package:lofaz/app/modules/products/controllers/products_controller.dart';
import 'package:lofaz/app/utils/AppColors.dart';
import 'package:lofaz/app/utils/T4Colors.dart';

class CatalogFilterBottomsheet extends GetView<ProductsController> {
  const CatalogFilterBottomsheet({super.key});

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
              title: const Text("Category Filter"),
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
                child: DropdownButtonFormField<CatalogSortOptions>(
                  value: controller.catalogSortOption.value,
                  items: CatalogSortOptions.values
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
                    controller.catalogSortOption.value = value;
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Sort"),
              trailing: SizedBox(
                width: 180,
                child: DropdownButtonFormField<SortBy>(
                  value: controller.catalogSortBy.value,
                  items: SortBy.values
                      .map(
                        (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.capitalize!,
                                style: const TextStyle(color: Colors.black))),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    controller.catalogSortBy.value = value;
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
                            controller.catalogResetFilterClicked();
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
                            controller.catalogApplyFilterClicked();
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
