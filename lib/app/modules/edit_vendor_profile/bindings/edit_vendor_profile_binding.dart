import 'package:get/get.dart';

import '../controllers/edit_vendor_profile_controller.dart';

class EditVendorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditVendorProfileController>(
      () => EditVendorProfileController(),
    );
  }
}
