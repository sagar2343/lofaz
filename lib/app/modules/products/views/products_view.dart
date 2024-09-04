import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:get/get.dart' hide ContextExtensionss;
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/data/models/product/product.dart';
import 'package:lofaz/app/modules/products/views/catalog_filter.dart';
import 'package:lofaz/app/modules/products/views/product_filter.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:lofaz/app/utils/gen/assets.gen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../controllers/app_store.dart';
import '../../../data/services/vendor_services.dart';
import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../../../utils/T4Colors.dart';
import '../../home/controllers/home_controller.dart';
import '../../order_details/views/show_alert.dart';
import '../controllers/products_controller.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';

class ProductsView extends GetView<ProductsController> {
  ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = context.width();

    return DefaultTabController(
      length: 2,
      child: Theme(
        data: Get.theme.copyWith(
            textTheme: const TextTheme(
              headlineSmall: TextStyle(color: Colors.white),
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white,
            )),
        child: Builder(builder: (context) {
          return AnimatedBuilder(
              animation: DefaultTabController.of(context),
              child: Column(
                children: [
                  const TabBar(
                      labelColor: t2_colorPrimary,
                      indicatorColor: t2_colorPrimary,
                      labelStyle: TextStyle(
                        fontSize: 16,
                      ),
                      tabs: [
                        Tab(
                          text: "Products",
                        ),
                        Tab(
                          text: "Categories",
                        ),
                      ]),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Obx(() {
                          return ProductListPage(
                              width: width,
                              isLoading: controller.isProductLoading.value,
                              fetchMore: controller.fetchMoreProducts,
                              // ignore: invalid_use_of_protected_member
                              products: controller.products.value);
                        }),
                        Obx(() {
                          return CatalogListPage(
                            fetchMore: controller.fetchMoreCatalogs,
                            isLoading: controller.isCatalogLoading.value,
                            width: width,
                            // ignore: invalid_use_of_protected_member
                            catalog: controller.catalogs.value,
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
              builder: (context, child) {
                return Scaffold(
                    appBar: AppBarWithSearchSwitch(
                      onChanged: DefaultTabController.of(context).index == 0
                          ? controller.onProductSearchFieldChanged
                          : controller.onCatalogSearchFieldChanged,
                      clearOnClose: true,
                      appBarBuilder: (context) {
                        return AppBar(
                          centerTitle: true,
                          title: const Text("Catalog"),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  if (DefaultTabController.of(context).index ==
                                      0) {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const ProductFilterBottomSheet();
                                        });
                                  } else {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const CatalogFilterBottomsheet();
                                        });
                                  }
                                },
                                icon: const Icon(Icons.filter_list)),
                            const AppBarSearchButton(),
                          ],
                        );
                      },
                      fieldHintText: "Search for Products...",
                      foregroundColor: Colors.white,
                      titleTextStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      keepAppBarColors: true,
                    ),
                    body: child);
              });
        }),
      ),
    );
  }
}

class CatalogListPage extends StatelessWidget {
  final List<Catalog> catalog;
  final isScrolling = false.obs;
  final VoidCallback fetchMore;
  final bool isLoading;
  CatalogListPage({
    super.key,
    required this.width,
    required this.catalog,
    required this.fetchMore,
    required this.isLoading,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        return FloatingActionButton.extended(
          isExtended: !isScrolling.value,
          onPressed: () {
            Get.toNamed(
              Routes.ADD_CATEGORY,
            );
          },
          label: const Text("Add Category"),
          icon: const Icon(Icons.add),
        );
      }),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if ([ScrollDirection.forward, ScrollDirection.reverse]
              .contains(notification.direction)) {
            isScrolling.value = true;
          } else {
            isScrolling.value = false;
          }

          return true;
        },
        child: NotificationListener<OverscrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels != 0 &&
                notification.metrics.axis == Axis.vertical) {
              fetchMore();
            }
            return false;
          },
          child: Builder(builder: (_) {
            if (isLoading && catalog.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (catalog.isEmpty) {
              return const Center(
                child: Text(
                  "No Categories Found",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 60,top: 10),
                    itemCount: catalog.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CatalogCard(
                        width: width,
                        index: index,
                        catalog: catalog[index],
                      );
                    },
                  ),
                ),
                if (isLoading) const LinearProgressIndicator(),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final isScrolling = false.obs;
  final VoidCallback fetchMore;
  final bool isLoading;
  ProductListPage({
    super.key,
    required this.width,
    required this.products,
    required this.fetchMore,
    required this.isLoading,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        return FloatingActionButton.extended(
          isExtended: !isScrolling.value,
          label: const Text("Add Product"),
          onPressed: () {
            Get.toNamed(Routes.ADD_PRODUCT);
          },
          icon: const Icon(Icons.add),
        );
      }),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if ([ScrollDirection.forward, ScrollDirection.reverse].contains(notification.direction)) {
            isScrolling.value = true;
          } else {
            isScrolling.value = false;
          }

          return true;
        },
        child: NotificationListener<OverscrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels != 0 &&
                notification.metrics.axis == Axis.vertical) {
              fetchMore();
            }
            return false;
          },
          child: Builder(builder: (_) {
            if (isLoading && products.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (products.isEmpty) {
              return const Center(
                child: Text(
                  "No Products Found",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 60),
                    itemCount: products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        width: width,
                        index: index,
                        product: product,
                      );
                    },
                  ),
                ),
                if (isLoading) const LinearProgressIndicator(),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  final RxBool isActive;
  ProductCard({
    super.key,
    required this.width,
    required this.index,
    required this.product,
  }) : isActive = RxBool(product.status);

  final double width;

  String? getProductImage() {
    if (product.photo.isNotEmpty && product.photo.first != null) {
      return product.photo.first!.location;
    }

    return null;
  }

  Color get getTrendColor {
    if (product.trends == "new") {
      return t2_colorPrimary;
    }
    if (product.trends == "hot") {
      return t2_red;
    }
    return t2_colorPrimaryLight;
  }

  calculateDiscountPercent() {
    if (product.mrp == 0 || product.salesPrice == 0) {
      return "0";
    }

    return (((product.mrp - product.salesPrice) / product.mrp) * 100)
        .toStringAsFixed(1);
  }

  deleteProductClicked() async {
    final result = await Get.dialog<bool>(CustomAlert(
      message:
          "Are you sure you want to delete this product?\nProduct: ${product.title}",
      buttonColor: Colors.blue,
      buttonText: "YES,DELETE",
      icon: Bootstrap.trash,
    ));
    if (result != null) {
      if (result) {
        Get.find<ProductsController>().deleteProduct(product.id);
      }
    }
  }

  shareProduct() async {
    final vendorProfile = Get.find<HomeController>().vendorProfile.value;
    if (vendorProfile == null) return;
    final textToShare =
        '''Item Name: ${product.title} \n\nPrice: ${getProductPricing()}\n\nCheck out the product: $mainUrl/${vendorProfile.username}/category/${product.category.url}/product/${product.url}   \n\nFeel free to call us on ${vendorProfile.phone} if you need any help!\n\nThank you\n${vendorProfile.businessName}''';

    if (product.photo.isNotEmpty && product.photo.first != null) {
      final url = product.photo.first!.location;
      final file = await DefaultCacheManager().getSingleFile(url);

      Share.shareXFiles(
        [
          XFile.fromData(
            await file.readAsBytes(),
            mimeType: "image/png",
          ),
        ],
        text: textToShare,
      );
    } else {
      Share.share(textToShare);
    }
  }

  getProductPricing() {
    if (product.salesPrice != 0.0) {
      return NumberFormat.simpleCurrency(name: "INR", decimalDigits: 1)
          .format(product.salesPrice);
    } else {
      return NumberFormat.simpleCurrency(name: "INR", decimalDigits: 1)
          .format(product.mrp);
    }
  }

  shareToWhatsapp() {
    final vendorProfile = Get.find<HomeController>().vendorProfile.value;
    if (vendorProfile == null) return;

    final textToShare =
        '''Item Name: ${product.title} \n\nPrice: ${getProductPricing()}\n\nCheck out the product: $mainUrl/product/${product.url}   \n\nFeel free to call us on ${vendorProfile.phone} if you need any help!\n\nThank you\n${vendorProfile.businessName}''';

    launchUrlString(Uri.encodeFull("https://wa.me/?text=$textToShare"));
  }

  Future<void> changeProductStatus(bool status) async {
    isActive.value = status;
    await Get.find<VendorServices>()
        .changeProductStatus(
      product: product,
      status: status,
    )
        .then((value) {
      if (value) {
        Get.find<HomeController>().products.value =
            Get.find<HomeController>().products.map((element) {
          if (element.id == product.id) {
            return element.copyWith(
              status: status,
            );
          }

          return element;
        }).toList();
      } else {
        isActive.value = !status;
        toastLong("Please Try again later!!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: defaultBoxShadow()),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: context.scaffoldBackgroundColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.all(0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  if (getProductImage() != null)
                    CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(
                            BuildContext, String)?,
                        imageUrl: getProductImage()!,
                        width: width / 3.5,
                        height: width / 3.5,
                        fit: BoxFit.fill)
                  else
                    Image.asset(
                      Assets.images.productDefault.path,
                      width: width / 3.5,
                      height: width / 3.5,
                    ),
                  Container(
                    decoration: BoxDecoration(
                      color: getTrendColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                    ),
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text(product.trends?.capitalize ?? "",
                        style: primaryTextStyle(color: white, size: 12)),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                child: Text(product.title,
                                    style: primaryTextStyle(
                                        color: Get.find<AppStore>()
                                            .textPrimaryColor
                                            .value,
                                        size: 18)),
                              ),
                              PopupMenuButton(
                                  surfaceTintColor: Colors.white,
                                  position: PopupMenuPosition.under,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                  ),
                                  child: const Icon(Icons.more_vert),
                                  itemBuilder: (_) => [
                                        PopupMenuItem(
                                          height: 0,
                                          padding: const EdgeInsets.only(
                                              left: 4, right: 4, bottom: 4),
                                          onTap: () {
                                            Get.toNamed(Routes.ADD_PRODUCT,
                                                arguments: product);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  // color: t2_colorPrimary,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Edit",
                                                  // style: TextStyle(
                                                  //   color: t2_colorPrimary,
                                                  // ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: 0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          onTap: deleteProductClicked,
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete_outline,
                                                  // color: Colors.red,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Delete",
                                                  // style: TextStyle(
                                                  //   color: Colors.red,
                                                  // ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: 0,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          onTap: shareProduct,
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.share,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Share",
                                                  style: TextStyle(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ])
                            ],
                          ),
                          const SizedBox(height: 4),
                          RichText(
                              text: TextSpan(
                                  style: primaryTextStyle(
                                    weight: FontWeight.bold,
                                  ),
                                  children: [
                                if (product.salesPrice != 0.0 &&
                                    product.mrp != product.salesPrice) ...[
                                  TextSpan(
                                    text:
                                        "${NumberFormat.simpleCurrency(name: "INR", decimalDigits: 1).format(product.salesPrice)} ",
                                  ),
                                  TextSpan(
                                      text: NumberFormat().format(product.mrp),
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2,
                                        color: t4_textColorSecondary,
                                      )),
                                  TextSpan(
                                      text:
                                          " ${calculateDiscountPercent()} % Off",
                                      style: const TextStyle(
                                        color: Colors.green,
                                      )),
                                ] else
                                  TextSpan(
                                    text: NumberFormat.simpleCurrency(
                                            name: "INR", decimalDigits: 1)
                                        .format(product.mrp),
                                  ),
                              ])),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Obx(() {
                          return Switch(
                              activeColor: Colors.green,
                              inactiveTrackColor: Colors.red,
                              value: isActive.value,
                              onChanged: (v) {
                                changeProductStatus(v);
                              });
                        }),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogCard extends StatelessWidget {
  final Catalog catalog;
  final int index;
  final RxBool isActive;
  CatalogCard({
    super.key,
    required this.width,
    required this.index,
    required this.catalog,
  }) : isActive = RxBool(catalog.status);

  final double width;

  String? getProductImage() {
    if (catalog.photos.isNotEmpty) {
      return catalog.photos.first.location;
    } else {
      return null;
    }
  }

  categoryStatusChange(bool state) async {
    isActive.value = state;
    await Get.find<VendorServices>()
        .changeCategoryStatus(
      active: state,
      catalog: catalog,
    )
        .then((value) {
      if (value) {
        Get.find<HomeController>().fetchAllCatalogs();
      }
    });
  }

  deleteCatalogClicked() async {
    final result = await Get.dialog<bool>(CustomAlert(
      message:
          "Are you sure you want to delete this catalog?\nCatalog: ${catalog.title}",
      buttonColor: Colors.blue,
      buttonText: "YES,DELETE",
      icon: Bootstrap.trash,
    ));
    if (result != null) {
      if (result) {
        Get.find<ProductsController>().deleteCatalog(catalog.id);
      }
    }
  }

  shareCatalog() async {
    final vendorProfile = Get.find<HomeController>().vendorProfile.value;
    if (vendorProfile == null) return;

    final textToShare =
        '''Category Name: ${catalog.title}\n\nCheck all the products from ${catalog.title} here\n$mainUrl/${vendorProfile.username}/category/${catalog.url} \n\nFeel free to call us on ${vendorProfile.phone} if you need any help!\n\nThank you\n${vendorProfile.businessName}''';

    if (catalog.photos.isNotEmpty) {
      final url = catalog.photos.first.location;
      final file = await DefaultCacheManager().getSingleFile(url);

      Share.shareXFiles(
        [
          XFile.fromData(
            await file.readAsBytes(),
            mimeType: "image/png",
          ),
        ],
        text: textToShare,
      );
    } else {
      Share.share(textToShare);
    }
  }

  shareToWhatsapp() {
    final vendorProfile = Get.find<HomeController>().vendorProfile.value;
    if (vendorProfile == null) return;

    final textToShare =
        '''Category Name: ${catalog.title}\n\nCheck all the products from ${catalog.title} here\n$mainUrl/${vendorProfile.username}/catalog/${catalog.url} \n\nFeel free to call us on ${vendorProfile.phone} if you need any help!\n\nThank you\n${vendorProfile.businessName}''';

    // print(Uri.encodeFull("https://wa.me/?text=$textToShare"));

    launchUrlString(Uri.encodeFull("https://wa.me/?text=$textToShare"));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        decoration: BoxDecoration(
            color: context.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: defaultBoxShadow()),
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: context.scaffoldBackgroundColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.all(0),
          child: Row(
            children: <Widget>[
              if (getProductImage() != null)
                CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(
                        BuildContext, String)?,
                    imageUrl: getProductImage()!,
                    width: width / 3.5,
                    height: width / 4,
                    fit: BoxFit.fill)
              else
                Image.asset(
                  Assets.images.categoryDefault.path,
                  width: width / 3.5,
                  height: width / 4,
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(catalog.title,
                                style: primaryTextStyle(
                                    color: Get.find<AppStore>()
                                        .textPrimaryColor
                                        .value,
                                    size: 18)),
                          ),
                          PopupMenuButton(
                              splashRadius: 0,
                              padding: EdgeInsets.zero,
                              child: const Icon(Icons.more_vert),
                              itemBuilder: (_) => [
                                    PopupMenuItem(
                                      height: 0,
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 8),
                                      onTap: () {
                                        Get.toNamed(Routes.ADD_CATEGORY,
                                            arguments: catalog);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              // color: t2_colorPrimary,
                                            ),
                                            Text(
                                              "Edit",
                                              // style: TextStyle(
                                              //   color: t2_colorPrimary,
                                              // ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      height: 0,
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, bottom: 8),
                                      onTap: () {
                                        deleteCatalogClicked();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.delete_outline,
                                              // color: Colors.red,
                                            ),
                                            Text(
                                              "Delete",
                                              style: TextStyle(
                                                  // color: Colors.red,
                                                  ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      height: 0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      onTap: shareCatalog,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.share,
                                              // color: Colors.red,
                                            ),
                                            Text(
                                              "Share",
                                              style: TextStyle(
                                                  // color: Colors.red,
                                                  ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx(() {
                          return Switch(
                              activeColor: Colors.green,
                              inactiveTrackColor: Colors.red,
                              value: isActive.value,
                              onChanged: (v) {
                                categoryStatusChange(v);
                              });
                        }),
                      )
                      // Row(
                      //   children: [
                      //     SizedBox(
                      //       height: 35,
                      //       child: FittedBox(
                      //         child: Obx(() {
                      //           return SegmentedButton(
                      //             showSelectedIcon: false,
                      //             multiSelectionEnabled: false,
                      //             onSelectionChanged: (p0) {
                      //               categoryStatusChange(p0.first);
                      //             },
                      //             style: ButtonStyle(
                      //               foregroundColor:
                      //                   MaterialStateProperty.resolveWith(
                      //                       (states) {
                      //                 if (states
                      //                     .contains(MaterialState.selected)) {
                      //                   return Colors.white;
                      //                 } else {
                      //                   return Colors.black;
                      //                 }
                      //               }),
                      //               backgroundColor:
                      //                   MaterialStateProperty.resolveWith(
                      //                       (states) {
                      //                 if (states
                      //                     .contains(MaterialState.selected)) {
                      //                   return isActive.value
                      //                       ? Get.theme.primaryColor
                      //                       : Colors.red;
                      //                 } else {
                      //                   return Get.theme.dividerColor;
                      //                 }
                      //               }),
                      //               maximumSize: const MaterialStatePropertyAll(
                      //                   Size(0, 20)),
                      //               fixedSize: const MaterialStatePropertyAll(
                      //                   Size(0, 20)),
                      //               minimumSize: const MaterialStatePropertyAll(
                      //                   Size.zero),
                      //               padding: const MaterialStatePropertyAll(
                      //                   EdgeInsets.symmetric(
                      //                 horizontal: 8,
                      //               )),
                      //             ),
                      //             segments: const [
                      //               ButtonSegment(
                      //                   value: true,
                      //                   label: Text(
                      //                     "Active",
                      //                     style: TextStyle(
                      //                       fontSize: 18,
                      //                     ),
                      //                   )),
                      //               ButtonSegment(
                      //                   value: false,
                      //                   label: Text(
                      //                     "Inactive",
                      //                     style: TextStyle(
                      //                       fontSize: 18,
                      //                     ),
                      //                   )),
                      //             ],
                      //             selected: {
                      //               isActive.value,
                      //             },
                      //           );
                      //         }),
                      //       ),
                      //     ),
                      //     const Spacer(),
                      //     IconButton.filled(
                      //       style: IconButton.styleFrom(
                      //         padding: EdgeInsets.zero,
                      //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //       ),
                      //       onPressed: shareCatalog,
                      //       icon: const Icon(
                      //         Bootstrap.share,
                      //         color: Colors.white,
                      //         size: 18,
                      //       ),
                      //     ),
                      //     IconButton.filled(
                      //       style: IconButton.styleFrom(
                      //         backgroundColor: whatsapp,
                      //         foregroundColor: white,
                      //       ),
                      //       onPressed: shareToWhatsapp,
                      //       icon: const Icon(
                      //         Bootstrap.whatsapp,
                      //       ),
                      //     ),
                      //   ],
                      // )
                      // Row(
                      //   children: [
                      //     Text("Active"),
                      //     Switch(value: true, onChanged: (v) {})
                      //   ],
                      // )
                      // const SizedBox(height: 4),
                      // Text("Views: ${catalog.view}",
                      //     style: primaryTextStyle(size: 14)),
                      // const SizedBox(height: 4),

                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
