import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:lofaz/app/modules/order_details/views/show_alert.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../data/models/orders/order.dart';
import '../../../utils/AppConstant.dart';
import '../../../utils/T4Colors.dart';

class OrderDetailsController extends GetxController {
  final VendorServices _vendorServices;
  final order = Rx<Order>(Get.arguments);

  OrderDetailsController(this._vendorServices);

  @override
  void onInit() {
    refressOrder();
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

  OrderTabStates getOrderState() {
    if (order.value.pendingStatus) {
      return OrderTabStates.pending;
    }
    if (order.value.acceptStatus) {
      return OrderTabStates.accepted;
    }
    if (order.value.shippedStatus) {
      return OrderTabStates.shipped;
    }
    if (order.value.deliverStatus) {
      return OrderTabStates.delivered;
    }
    if (order.value.cancelStatus) {
      return OrderTabStates.cancelled;
    }
    return OrderTabStates.pending;
  }

  Color getColorByOrderState() {
    if (order.value.pendingStatus) {
      return Colors.orange;
    }
    if (order.value.acceptStatus) {
      return Colors.greenAccent;
    }
    if (order.value.shippedStatus) {
      return t2_colorPrimary;
    }
    if (order.value.deliverStatus) {
      return Colors.green;
    }
    if (order.value.cancelStatus) {
      return Colors.red;
    }
    return t2_colorPrimary;
  }

  getButtonColorByOrderState() {
    if (order.value.pendingStatus) {
      return Colors.green;
    }
    if (order.value.acceptStatus) {
      return Colors.orange;
    }
    if (order.value.shippedStatus) {
      return t2_colorPrimary;
    }

    return t2_colorPrimary;
  }

  getButtonTextByOrderState() {
    if (order.value.pendingStatus) {
      return "Accept Order";
    }
    if (order.value.acceptStatus) {
      return "Ship Order";
    }
    if (order.value.shippedStatus) {
      return "Deliver";
    }

    return t2_colorPrimary;
  }

  onButtonClick() {
    if (order.value.pendingStatus) {
      acceptOrderClick();
      return;
    }
    if (order.value.acceptStatus) {
      shipOrderClick();
      return;
    }
    if (order.value.shippedStatus) {
      deliverOrderClick();
      return;
    }
  }

  refressOrder() {
    _vendorServices.getOrderById(order.value.id).then((value) {
      if (value != null) {
        order.value = value;
        Get.find<HomeController>().orders.value =
            Get.find<HomeController>().orders.map((element) {
          if (element.id == value.id) {
            return value;
          }

          return element;
        }).toList();
      }
    });
  }

  cancelOrderClick() async {
    final result = await Get.dialog<bool>(const CustomAlert(
      message: "Are you sure you want to mark this order as cancelled?",
      buttonColor: Colors.brown,
      buttonText: "Yes, CANCEL",
      negativeButtonText: "No",
    ));
    if (result != null && result) {
      EasyLoading.show(
        status: "Cancelling order...",
        maskType: EasyLoadingMaskType.black,
      );
      await _vendorServices
          .updateOrderStatus(order.value.id, "cancelled")
          .then((value) {
        if (value) {
          refressOrder();
        }
      });
      EasyLoading.dismiss();
    }
  }

  acceptOrderClick() async {
    final result = await Get.dialog<bool>(const CustomAlert(
      message: "Are you sure you want to accept this order?",
      buttonColor: Colors.greenAccent,
      buttonText: "Yes, ACCEPT",
      negativeButtonText: "No",
    ));
    if (result != null && result) {
      EasyLoading.show(
        status: "Accepting order...",
        maskType: EasyLoadingMaskType.black,
      );
      await _vendorServices
          .updateOrderStatus(order.value.id, "accepted")
          .then((value) {
        if (value) {
          refressOrder();
        }
      });
      EasyLoading.dismiss();
    }
  }

  shipOrderClick() async {
    final result = await Get.dialog<bool>(const CustomAlert(
      message: "Are you sure you want to mark this order as shipped?",
      buttonColor: Colors.orange,
      buttonText: "Yes, SHIPPED",
    ));
    if (result != null && result) {
      EasyLoading.show(
        status: "Shiping order...",
        maskType: EasyLoadingMaskType.black,
      );
      await _vendorServices
          .updateOrderStatus(order.value.id, "shipped")
          .then((value) {
        if (value) {
          refressOrder();
        }
      });
      EasyLoading.dismiss();
    }
  }

  deliverOrderClick() async {
    final result = await Get.dialog<bool>(const CustomAlert(
      message: "Are you sure you want to mark this order as delivered?",
      buttonColor: t2_colorPrimary,
      buttonText: "Yes",
    ));
    if (result != null && result) {
      EasyLoading.show(
        status: "Delivering order...",
        maskType: EasyLoadingMaskType.black,
      );
      await _vendorServices
          .updateOrderStatus(order.value.id, "delivered")
          .then((value) {
        if (value) {
          refressOrder();
        }
      });
      EasyLoading.dismiss();
    }
  }

  callCustomerClicked() {
    if (order.value.shippingPhone != null) {
      log(order.value);
      if (order.value.shippingPhone?.length == 10) {
        launchUrlString("tel:+91${order.value.shippingPhone}");
        return;
      }
      launchUrlString("tel:${order.value.shippingPhone}");
    }
  }

  whatsAppCustomerClicked() {
    if (order.value.shippingPhone != null) {
      log(order.value);
      if (order.value.shippingPhone?.length == 10) {
        launchUrlString(
            "https://wa.me/+91${order.value.shippingPhone}?text=Hi");
        return;
      }
      launchUrlString("https://wa.me/${order.value.shippingPhone}?text=Hi");
    }
  }
}
