import 'package:get/get.dart';

import '../controllers/root_view_controller.dart';

class RootViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootViewController>(
      () => RootViewController(),
    );
  }
}
