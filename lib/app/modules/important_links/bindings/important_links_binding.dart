import 'package:get/get.dart';

import '../controllers/important_links_controller.dart';

class ImportantLinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportantLinksController>(
      () => ImportantLinksController(Get.find()),
    );
  }
}
