import 'package:get/get.dart';

import '../controllers/shipping_charge_input_controller.dart';

class ShippingChargeInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShippingChargeInputController>(
      () => ShippingChargeInputController(),
    );
  }
}
