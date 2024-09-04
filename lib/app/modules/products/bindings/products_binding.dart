import 'package:get/get.dart';

import '../controllers/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(
      ProductsController(Get.find()),
    );
  }
}
