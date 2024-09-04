import 'package:get/get.dart';

import '../controllers/more_information_controller.dart';

class MoreInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreInformationController>(
      () => MoreInformationController(),
    );
  }
}
