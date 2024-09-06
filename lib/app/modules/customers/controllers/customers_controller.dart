import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:lofaz/app/data/core/core.dart';
import 'package:lofaz/app/data/errors/api_failures.dart';
import 'package:lofaz/app/data/models/customer/customer.dart';
import 'package:lofaz/app/data/models/orders/order.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';

class CustomersController extends GetxController {
  final VendorServices _vendorServices;
  final customers = <Customer>[].obs;
  final isLoading = false.obs;
  final totalCustomers = 0.obs;
  final page = 1.obs;
  final searchString = "".obs;
  final sortOption = Rx(CustomerSortOption.updatedAt);
  final sortBy = Rx(SortBy.accending);

  final debounce = Debouncer(delay: 600.milliseconds);
  CustomersController(this._vendorServices);
  @override
  void onInit() {
    fetchCustomer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchCustomer() async {
    isLoading.value = true;
    await _vendorServices
        .fetchAllCustomer(
      page: page.value,
      searchString: searchString.value,
      sort: sortOption.value,
      sortBy: sortBy.value,
      limit: 10,
    )
        .then((value) {
      value.fold((l) {
        ScaffoldMessenger.maybeOf(Get.context!)?.showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(l.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }, (r) {
        customers.value = [...customers, ...r.data];
        totalCustomers.value = r.total;
        page.value++;
      });
    });
    isLoading.value = false;
  }

  List<Order> getOrdersByCustomer(Customer customer) {
    final orders = Get.find<HomeController>().orders;
    if (orders.isNotEmpty) {
      return orders.where((element) => element.custId == customer.id).toList();
    } else {
      return [];
    }
  }

  Future<void> fetchMore() async {
    if (!isLoading.value && (totalCustomers.value > customers.length)) {
      await fetchCustomer();
    }
  }

  onSearchFieldChanged(String value) {
    debounce.call(() {
      searchString.value = value;
      page.value = 1;
      customers.value = [];
      fetchCustomer();
    });
  }

  applyFilterClicked() {
    page.value = 1;
    customers.value = [];
    fetchCustomer();
  }

  void resetFilterClicked() {
    page.value = 1;
    customers.value = [];
    sortOption.value = CustomerSortOption.updatedAt;
    sortBy.value = SortBy.accending;
    fetchCustomer();
  }
}
