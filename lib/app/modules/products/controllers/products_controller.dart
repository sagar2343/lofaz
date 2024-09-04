import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:lofaz/app/data/core/core.dart';
import 'package:lofaz/app/data/errors/api_failures.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/data/models/product/product.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';

import '../../home/controllers/home_controller.dart';

class ProductsController extends GetxController {
  final VendorServices _vendorServices;

  final products = <Product>[].obs;
  final catalogs = <Catalog>[].obs;

  final totalProducts = 0.obs;
  final totalCatalogs = 0.obs;
  final productPageCount = 1.obs;
  final catalogPageCount = 1.obs;
  final isProductLoading = false.obs;
  final isCatalogLoading = false.obs;

  final searchString = "".obs;
  final productSortOption = Rx(ProductSortOptions.updatedAt);
  final productSortBy = Rx(SortBy.decending);
  final catalogSortOption = Rx(CatalogSortOptions.updatedAt);
  final catalogSortBy = Rx(SortBy.decending);

  final debounce = Debouncer(delay: 600.milliseconds);

  ProductsController(this._vendorServices);
  @override
  void onInit() {
    fetchAllCategories();
    fetchProducts();
    super.onInit();
  }


  void showSingleSnackbar(String message, {Color backgroundColor = Colors.red}) {
    final currentContext = Get.context;
    if (currentContext != null && ScaffoldMessenger.of(currentContext).mounted) {
      ScaffoldMessenger.of(currentContext).clearSnackBars(); // Clear existing Snackbars
      ScaffoldMessenger.of(currentContext).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 1),
      ));
    }
  }


  fetchProducts() async {
    isProductLoading.value = true;
    await _vendorServices
        .getAllProducts(
      page: productPageCount.value,
      searchString: searchString.value,
      sort: productSortOption.value,
      sortBy: productSortBy.value,
      limit: 10,
    )
        .then((value) {
      value.fold((l) {
        // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        //   content: Text(l.errorMessage),
        //   backgroundColor: Colors.red,
        // ));
        showSingleSnackbar(l.errorMessage);
      }, (r) {
        products.value = [...products, ...r.data];
        totalProducts.value = r.total;
        productPageCount.value++;
      });
    });
    isProductLoading.value = false;
  }

  fetchAllCategories() async {
    isCatalogLoading.value = true;
    await _vendorServices
        .getAllCatelogs(
      page: catalogPageCount.value,
      searchString: searchString.value,
      sort: catalogSortOption.value,
      sortBy: catalogSortBy.value,
      limit: 10,
    )
        .then((value) {
      value.fold((l) {
        // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        //   content: Text(l.errorMessage),
        //   backgroundColor: Colors.red,
        // ));
        showSingleSnackbar(l.errorMessage);
      }, (r) {
        catalogs.value = [...catalogs, ...r.data];
        totalCatalogs.value = r.total;
        catalogPageCount.value++;
      });
    });

    isCatalogLoading.value = false;
  }

  // openSortBottomSheet<T>() async {
  //   if (T == ProductSortOptions) {
  //     final result = await Get.bottomSheet<ProductSortOptions>(
  //         SortBottomSheet<ProductSortOptions>(
  //       initialValue: selectedProductSortOption.value,
  //     ));

  //     if (result != null) {
  //       selectedProductSortOption.value = result;
  //     }
  //     return;
  //   }

  //   if (T == CategorySortOptions) {
  //     final result = await Get.bottomSheet<CategorySortOptions>(
  //         SortBottomSheet<CategorySortOptions>(
  //       initialValue: selectedCategorySortOption.value,
  //     ));

  //     if (result != null) {
  //       selectedCategorySortOption.value = result;
  //     }
  //     return;
  //   }
  // }

  Future<void> deleteCatalog(String catalogId) async {
    EasyLoading.show(
      status: "Deleting category...",
      maskType: EasyLoadingMaskType.black,
    );
    await _vendorServices.deleteCatalog(catalogId: catalogId).then((value) {
      if (value) {
        Get.find<HomeController>().fetchAllCatalogs();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text("Category deleted successfully"),
            backgroundColor: Colors.green,
          ),
        );
      } else {}
    });
    EasyLoading.dismiss();
  }

  Future<void> deleteProduct(String id) async {
    EasyLoading.show(
      status: "Deleting product...",
      maskType: EasyLoadingMaskType.black,
    );
    await _vendorServices.deleteProduct(productId: id).then((value) {
      if (value) {
        Get.find<HomeController>()
            .products
            .removeWhere((element) => element.id == id);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text("Product deleted successfully"),
            backgroundColor: Colors.green,
          ),
        );
      } else {}
    });
    EasyLoading.dismiss();
  }

  // List<Product> get getSortedProduct {
  //   switch (selectedProductSortOption.value) {
  //     case ProductSortOptions.Relevance:
  //       return products;
  //     case ProductSortOptions.PriceL:
  //       return [...products]..sort((a, b) => a.getPrice.compareTo(b.getPrice));

  //     case ProductSortOptions.PriceH:
  //       return [...products]..sort((a, b) => b.getPrice.compareTo(a.getPrice));

  //     case ProductSortOptions.Name:
  //       return [...products]..sort(
  //           (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

  //     default:
  //       return products;
  //   }
  // }

  // List<Catalog> get getSortedCategory {
  //   switch (selectedCategorySortOption.value) {
  //     case CategorySortOptions.Relevance:
  //       return catalogs;
  //     case CategorySortOptions.DateL2N:
  //       return [...catalogs]
  //         ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

  //     case CategorySortOptions.DateN2L:
  //       return [...catalogs]
  //         ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  //     case CategorySortOptions.Name:
  //       return [...catalogs]..sort(
  //           (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()));

  //     default:
  //       return catalogs;
  //   }
  // }

  void productResetFilterClicked() {
    productPageCount.value = 1;
    products.value = [];
    productSortOption.value = ProductSortOptions.createdAt;
    productSortBy.value = SortBy.accending;
    fetchProducts();
  }

  void productApplyFilterClicked() {
    productPageCount.value = 1;
    products.value = [];
    fetchProducts();
  }

  void catalogResetFilterClicked() {
    catalogPageCount.value = 1;
    catalogs.value = [];
    catalogSortOption.value = CatalogSortOptions.createdAt;
    catalogSortBy.value = SortBy.accending;
    fetchAllCategories();
  }

  void catalogApplyFilterClicked() {
    catalogPageCount.value = 1;
    catalogs.value = [];
    fetchAllCategories();
  }

  onProductSearchFieldChanged(String value) {
    if (value == searchString.value) {
      return;
    }
    debounce.call(() {
      searchString.value = value;
      productPageCount.value = 1;
      products.value = [];
      fetchProducts();
    });
  }

  onCatalogSearchFieldChanged(String value) {
    if (value == searchString.value) {
      return;
    }

    debounce.call(() {
      searchString.value = value;
      catalogPageCount.value = 1;
      catalogs.value = [];
      fetchAllCategories();
    });
  }

  fetchMoreProducts() async {
    if (!isProductLoading.value && (totalProducts.value > products.length)) {
      await fetchProducts();
    }
  }

  fetchMoreCatalogs() async {
    if (!isCatalogLoading.value && (totalCatalogs.value > catalogs.length)) {
      await fetchAllCategories();
    }
  }

  initialFetchCategory() async {
    catalogPageCount.value = 1;
    catalogs.value = [];
    fetchAllCategories();
  }
}
