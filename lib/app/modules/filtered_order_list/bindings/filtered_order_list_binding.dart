import 'package:get/get.dart';

import '../controllers/filtered_order_list_controller.dart';

class FilteredOrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilteredOrderListController>(
      () => FilteredOrderListController(),
    );
  }
}
