import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../data/models/orders/order.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../../../utils/T4Colors.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final int index;
  const OrderCard({
    super.key,
    required this.width,
    required this.index,
    required this.order,
  });

  final double width;

  OrderTabStates getOrderState() {
    if (order.pendingStatus) {
      return OrderTabStates.pending;
    }
    if (order.acceptStatus) {
      return OrderTabStates.accepted;
    }
    if (order.shippedStatus) {
      return OrderTabStates.shipped;
    }
    if (order.deliverStatus) {
      return OrderTabStates.delivered;
    }
    if (order.cancelStatus) {
      return OrderTabStates.cancelled;
    }
    return OrderTabStates.pending;
  }

  Color getColorByOrderState() {
    if (order.pendingStatus) {
      return Colors.orange;
    }
    if (order.acceptStatus) {
      return Colors.greenAccent;
    }
    if (order.shippedStatus) {
      return t2_colorPrimary;
    }
    if (order.deliverStatus) {
      return Colors.green;
    }
    if (order.cancelStatus) {
      return Colors.red;
    }
    return t2_colorPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.ORDER_DETAILS, arguments: order);
        },
        child: Container(
          decoration: BoxDecoration(
              color: context.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: defaultBoxShadow()),
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: context.scaffoldBackgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Order ID #${order.id}",
                        ),
                      ),
                      Text(DateFormat("dd-MM-yyyy").format(order.createdAt),
                          style: secondaryTextStyle())
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: CachedNetworkImage(
                                placeholder: placeholderWidgetFn() as Widget
                                    Function(BuildContext, String)?,
                                imageUrl: order.product.firstOrNull?.img ??
                                    defaultImage,
                                width: width / 3,
                                height: width / 2.8,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹${order.grandTotal}",
                                style: primaryTextStyle(
                                  color: t2_colorPrimary,
                                  weight: FontWeight.bold,
                                  size: 18,
                                ),
                              ),
                              Text(
                                "${order.product.length} items",
                                style: secondaryTextStyle(
                                  size: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  const Divider(
                    color: t4_textColorSecondary,
                    thickness: 0.5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: getColorByOrderState(),
                        size: 10,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      text(
                        getOrderState().name.capitalize!,
                      ),
                      const Spacer(),
                      text("View Details")
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
