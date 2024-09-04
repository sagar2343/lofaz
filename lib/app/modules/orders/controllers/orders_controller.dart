import 'package:get/get.dart';
import 'package:lofaz/app/data/models/orders/order.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';

import '../../../utils/AppConstant.dart';

class OrdersController extends GetxController {
  final Rx<OrderTabStates> selectedTab = OrderTabStates.all.obs;
  final orders = Get.find<HomeController>().orders;
  final searchString = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Order> getPendingOrders() {
    return getFilteredOrderWithSearch
        .where((order) => order.pendingStatus)
        .toList();
  }

  List<Order> getShippedOrders() {
    return getFilteredOrderWithSearch
        .where((order) => order.shippedStatus)
        .toList();
  }

  List<Order> getDeliveredOrders() {
    return getFilteredOrderWithSearch
        .where((order) => order.deliverStatus)
        .toList();
  }

  List<Order> getCanceledOrders() {
    return getFilteredOrderWithSearch
        .where((order) => order.cancelStatus)
        .toList();
  }

  List<Order> getAcceptedOrders() {
    return getFilteredOrderWithSearch
        .where((order) => order.acceptStatus)
        .toList();
  }

  List<Order> get getFilteredOrder {
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
        return getFilteredOrderWithSearch;

      default:
        return [];
    }
  }

  List<Order> get getFilteredOrderWithSearch {
    return orders.where((element) {
      if (element.shippingPhone != null &&
          element.shippingPhone!
              .toLowerCase()
              .contains(searchString.value.toLowerCase())) {
        return true;
      }
      if (element.grandTotal
          .toString()
          .toLowerCase()
          .contains(searchString.value.toLowerCase())) {
        return true;
      }
      return false;
    }).toList();
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
        if (getFilteredOrderWithSearch.isEmpty) {
          return "";
        }
        return " (${getFilteredOrderWithSearch.length})";

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
