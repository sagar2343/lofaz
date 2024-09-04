import 'package:get/get.dart';

import '../controllers/business_settings_controller.dart';

class BusinessSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessSettingsController>(
      () => BusinessSettingsController(Get.find()),
    );
  }
}
