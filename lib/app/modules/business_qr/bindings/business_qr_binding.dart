import 'package:get/get.dart';

import '../controllers/business_qr_controller.dart';

class BusinessQrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessQrController>(
      () => BusinessQrController(),
    );
  }
}
