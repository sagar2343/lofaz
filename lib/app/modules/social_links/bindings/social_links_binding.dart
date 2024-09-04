import 'package:get/get.dart';

import '../controllers/social_links_controller.dart';

class SocialLinksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocialLinksController>(
      () => SocialLinksController(
        Get.find(),
      ),
    );
  }
}
