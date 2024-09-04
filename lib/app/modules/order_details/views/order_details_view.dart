import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:lofaz/app/data/models/orders/order.dart';
import 'package:lofaz/app/utils/T4Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: [
          OrderTabStates.delivered,
          OrderTabStates.cancelled,
        ].contains(controller.getOrderState())
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(
                                  color: Colors.red,
                                )),
                            onPressed: controller.cancelOrderClick,
                            child: const Text("Cancel Order"))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  controller.getButtonColorByOrderState(),
                            ),
                            onPressed: controller.onButtonClick,
                            child:
                                Text(controller.getButtonTextByOrderState()))),
                  ],
                ),
              ),
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order ID",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              Text(
                "#${controller.order.value.id}",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                      "Date: ${DateFormat('dd-MMM-yy hh:mm a').format(controller.order.value.createdAt)}"),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: controller.getColorByOrderState(),
                        size: 10,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        controller.getOrderState().name.capitalize!,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Get.theme.hintColor,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  text("${controller.order.value.product.length} Items"),
                  ...controller.order.value.product
                      .map((e) => OrderProductItemCard(product: e)),
                  Divider(
                    thickness: 0.5,
                    color: Get.theme.hintColor,
                  ),
                  Row(children: [
                    const Text(
                      "Items total",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.simpleCurrency(name: "INR").format(controller
                          .order.value.product
                          .sumByDouble((p0) => p0.total)),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ]),
                  Row(children: [
                    const Text(
                      "Shipping Charge",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      (controller.order.value.shippingCharge == null ||
                              controller.order.value.shippingCharge!.type ==
                                  "free")
                          ? "Free shipping"
                          : NumberFormat.simpleCurrency(name: "INR").format(
                              controller.order.value.shippingCharge!.amount),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ]),
                  Row(children: [
                    const Text(
                      "Grand total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      NumberFormat.simpleCurrency(name: "INR")
                          .format(controller.order.value.grandTotal.toDouble()),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
                  Divider(
                    thickness: 0.5,
                    color: Get.theme.hintColor,
                  ),
                  text(
                    "CUSTOMER DETAILS",
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Name:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Text(
                              controller.order.value.shippingName?.capitalize ??
                                  ""))
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Mobile:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                      controller.order.value.shippingPhone ??
                                          "")),
                              IconButton.filled(
                                onPressed: controller.callCustomerClicked,
                                icon: const Icon(
                                  Bootstrap.telephone_forward,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton.filled(
                                style: IconButton.styleFrom(
                                  backgroundColor: whatsapp,
                                  foregroundColor: white,
                                ),
                                onPressed: controller.whatsAppCustomerClicked,
                                icon: const Icon(
                                  Bootstrap.whatsapp,
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Address:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Text(
                              "${controller.order.value.shippingAddress1}"))
                    ],
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text(
                          "Pincode:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 5,
                          child: Text(controller.order.value.shippingZip ?? ""))
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

class OrderProductItemCard extends StatelessWidget {
  final OrderProductInfo product;
  const OrderProductItemCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                elevation: 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: product.img != null
                      ? CachedNetworkImage(
                          imageUrl: product.img!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image),
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: t2_colorPrimary,
                    ),
                  ),
                  Text(
                    "${product.qty.toInt()} x ${NumberFormat.simpleCurrency(
                      name: "INR",
                    ).format(product.price)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            text(NumberFormat.simpleCurrency(name: "INR").format(product.total))
          ],
        ),
      ),
    );
  }
}
