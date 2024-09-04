import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:lofaz/app/data/models/customer/customer.dart';
import 'package:lofaz/app/modules/customers/views/filter_option.dart';
import 'package:lofaz/app/modules/filtered_order_list/state/filtered_order_page_arguments.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../data/models/orders/order.dart';
import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithSearchSwitch(
          onChanged: controller.onSearchFieldChanged,
          appBarBuilder: (context) {
            return AppBar(
              centerTitle: true,
              title: const Text("Customers"),
              actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const CustomerFilterOption();
                          });
                    },
                    icon: const Icon(Icons.filter_list)),
                const AppBarSearchButton(),
              ],
            );
          },
          fieldHintText: "Search for customer...",
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          keepAppBarColors: true,
          clearOnClose: true,
        ),
        body: NotificationListener<OverscrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels != 0 &&
                notification.metrics.axis == Axis.vertical) {
              controller.fetchMore();
            }
            return false;
          },
          child: Obx(() {
            if (controller.customers.isEmpty && controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.customers.isEmpty) {
              return const Center(
                child: Text("No customers found"),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    itemCount: controller.customers.length,
                    itemBuilder: (context, index) {
                      final customer = controller.customers[index];
                      return CustomerListCard(customer: customer);
                    },
                  ),
                ),
                if (controller.isLoading.value) const LinearProgressIndicator(),
              ],
            );
          }),
        ));
  }
}

class CustomerListCard extends StatelessWidget {
  final List<Order> orders;
  CustomerListCard({
    super.key,
    required this.customer,
  }) : orders = Get.find<CustomersController>().getOrdersByCustomer(customer);

  final Customer customer;

  String get getTotalEarnings {
    return NumberFormat.simpleCurrency(decimalDigits: 1, name: "INR").format(
        orders.where((element) => element.deliverStatus).fold(
            0.0,
            (previousValue, element) =>
                previousValue + (double.tryParse(element.grandTotal) ?? 0)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.FILTERED_ORDER_LIST,
              arguments: FilteredOrderPageArguments(
                  title: customer.profile.fullName, order: orders));
        },
        child: Column(
          children: [
            ListTile(
              trailing: Column(
                children: [
                  Text(customer.profile.phone.toString()),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {
                            launchUrlString("tel:${customer.profile.phone}");
                          },
                          child: const Icon(Icons.call)),
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                          onTap: () {
                            launchUrlString(
                                "https://wa.me/+91${customer.profile.phone}");
                          },
                          child: const Icon(Bootstrap.whatsapp)),
                    ],
                  )
                ],
              ),
              // trailing: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     IconButton.filled(
              //         padding: EdgeInsets.zero,
              //         color: white,
              //         onPressed: () {
              //           launchUrlString("tel:${customer.phone}");
              //         },
              //         icon: const Icon(Icons.call)),
              //     IconButton.filled(
              //         padding: EdgeInsets.zero,
              //         style: IconButton.styleFrom(
              //           backgroundColor: whatsapp,
              //           foregroundColor: white,
              //         ),
              //         onPressed: () {
              //           launchUrlString("https://wa.me/+91${customer.phone}");
              //         },
              //         icon: const Icon(Bootstrap.whatsapp)),
              //   ],
              // ),
              // leading: const CircleAvatar(
              //   child: Icon(Bootstrap.person),
              // ),
              title: Text(customer.profile.fullName),
              subtitle: Text(
                  "${customer.address.address.firstOrNull ?? ''}, ${customer.address.city}, ${customer.address.state}"),
            ),
            if (orders.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Total Orders",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(orders.length.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                            )),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     const Text(
                    //       "Completed orders",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     Text(
                    //         orders
                    //             .where((element) => element.deliverStatus)
                    //             .length
                    //             .toString(),
                    //         style: const TextStyle(
                    //           fontSize: 16,
                    //         )),
                    //   ],
                    // ),
                    Column(
                      children: [
                        const Text(
                          "Total earnings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          getTotalEarnings,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
