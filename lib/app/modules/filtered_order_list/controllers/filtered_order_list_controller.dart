import 'dart:async';

import 'package:get/get.dart';
import 'package:lofaz/app/modules/filtered_order_list/state/filtered_order_page_arguments.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';

import '../../../data/models/orders/order.dart';
import '../../../utils/AppConstant.dart';

class FilteredOrderListController extends GetxController {
  final Rx<OrderTabStates> selectedTab = OrderTabStates.all.obs;
  final orders = <Order>[].obs;
  final argument = Get.arguments as FilteredOrderPageArguments;
  StreamSubscription? orderChangeSubs;

  @override
  void onInit() {
    orders.value = argument.order;
    listenForOrderChange();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    orderChangeSubs?.cancel();
    super.onClose();
  }

  listenForOrderChange() {
    orderChangeSubs = Get.find<HomeController>().orders.listen((allOrders) {
      print("order state change");
      // p0 is total order and orders is list of order of current customer

      orders.value = orders.map((element) {
        if (allOrders.any((order) => order.id == element.id)) {
          return allOrders.firstWhere((order) => order.id == element.id);
        }
        return element;
      }).toList();
    });
  }

  List<Order> getPendingOrders() {
    return orders.where((order) => order.pendingStatus).toList();
  }

  List<Order> getShippedOrders() {
    return orders.where((order) => order.shippedStatus).toList();
  }

  List<Order> getDeliveredOrders() {
    return orders.where((order) => order.deliverStatus).toList();
  }

  List<Order> getCanceledOrders() {
    return orders.where((order) => order.cancelStatus).toList();
  }

  List<Order> getAcceptedOrders() {
    return orders.where((order) => order.acceptStatus).toList();
  }

  List<Order> getFilteredOrder() {
    switch (selectedTab.value) {
      case OrderTabStates.accepted:
        return getAcceptedOrders();

      case OrderTabStates.shipped:
        return getShippedOrders();

      case OrderTabStates.delivered:
        return getDeliveredOrders();

      case OrderTabStates.cancelled:
        return getCanceledOrders();

      case OrderTabStates.pending:
        return getPendingOrders();

      case OrderTabStates.all:
        return orders;

      default:
        return [];
    }
  }

  getOrderCountByState(OrderTabStates state) {
    switch (state) {
      case OrderTabStates.accepted:
        if (getAcceptedOrders().isEmpty) {
          return "";
        }
        return " (${getAcceptedOrders().length})";

      case OrderTabStates.shipped:
        if (getShippedOrders().isEmpty) {
          return "";
        }
        return " (${getShippedOrders().length})";

      case OrderTabStates.delivered:
        if (getDeliveredOrders().isEmpty) {
          return "";
        }
        return " (${getDeliveredOrders().length})";

      case OrderTabStates.cancelled:
        if (getCanceledOrders().isEmpty) {
          return "";
        }
        return " (${getCanceledOrders().length})";

      case OrderTabStates.pending:
        if (getPendingOrders().isEmpty) {
          return "";
        }
        return " (${getPendingOrders().length})";

      case OrderTabStates.all:
        if (orders.isEmpty) {
          return "";
        }
        return " (${orders.length})";

      default:
        return "";
    }
  }

  OrderTabStates getOrderState(Order order) {
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
}
