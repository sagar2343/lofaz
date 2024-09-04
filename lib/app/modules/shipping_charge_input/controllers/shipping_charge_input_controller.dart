import 'package:get/get.dart';
import 'package:lofaz/app/data/models/shipping_charges/shipping_charge.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';

class ShippingChargeInputController extends GetxController {
  late final Rx<ShippingCharge> inputShippingCharge;

  @override
  void onInit() {
    if (Get.arguments is ShippingCharge) {
      inputShippingCharge = Rx<ShippingCharge>(Get.arguments);
    } else {
      inputShippingCharge = Rx<ShippingCharge>(const ShippingCharge());
    }

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

  updateShippingClicked() {
    Get.find<VendorServices>()
        .updateShippingCharges(
            shippingCharge: inputShippingCharge.value.shippingCost?.toInt(),
            freeShippingAfter:
                inputShippingCharge.value.freeShippingAfter?.toInt())
        .then((value) {
      if (value) {
        Get.back(
          result: inputShippingCharge.value,
        );
      }
    });
  }
}
