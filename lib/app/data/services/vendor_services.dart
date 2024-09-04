import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:dartz/dartz.dart' hide Order;
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:intl/intl.dart';
import 'package:lofaz/app/data/core/core.dart';
import 'package:lofaz/app/data/errors/api_failures.dart';
import 'package:lofaz/app/data/models/catalog/catalog.dart';
import 'package:lofaz/app/data/models/customer/customer.dart';
import 'package:lofaz/app/data/models/orders/order.dart';
import 'package:lofaz/app/data/models/orders/order_info.dart'
    hide RemoteOrder, OrderShippingCharge;
import 'package:lofaz/app/data/models/orders/single_order_response.dart';
import 'package:lofaz/app/data/models/product/product.dart';
import 'package:lofaz/app/data/models/product/product_unit.dart';
import 'package:lofaz/app/data/models/shipping_charges/shipping_charge.dart';
import 'package:lofaz/app/data/models/shop_settings.dart';
import 'package:lofaz/app/data/models/social_links/social_links.dart';
import 'package:lofaz/app/data/models/vendor.dart';
import 'package:lofaz/app/data/models/vendor_profile.dart';
import 'package:lofaz/app/data/models/vendor_stats/vendor_stats.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/AppConstant.dart';
// import 'package:nb_utils/nb_utils.dart';

class VendorServices extends GetxService {
  final AuthServices _authServices;
  final FirebaseCrashlytics _crashlytics;

  late Dio client;

  VendorServices(this._authServices, this._crashlytics);

  @override
  onInit() {
    if (_authServices.isLoggedIn && _authServices.authToken.isNotEmpty) {
      client = Dio(BaseOptions(
        baseUrl: apiEndpoint,
        headers: {"Authorization": "Bearer ${_authServices.authToken}"},
      ));
    } else {
      client = Dio(BaseOptions(
        baseUrl: apiEndpoint,
      ));
      throw Exception("No Auth Token Found");
    }

    super.onInit();
  }

  Future<Vendor?> fetchCurrentProfile() async {
    try {
      final res = await client.get(
          "/api/vendor/check_number/${_authServices.getCurrentUser!.phoneNumber!}");

      if (res.statusCode == 201 && res.data['data'] != null) {
        final vendor = Vendor.fromJson(res.data['data']);
        // log(vendor);
        return vendor;
      } else {
        return null;
      }
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }

      _crashlytics.recordError(e, s, reason: "Error in create catalog");
      toastLong(e.message ?? "Please Try again later!!");
      return null;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in create catalog");

      return null;
    }
  }

  Future<bool> createCatelog({
    required String userId,
    required String title,
    required File image,
    required bool active,
    required String metaTitle,
    required String metaDescription,
    required List<String> keywords,
    required String url,
  }) async {
    try {
      log("create catalog");
      log("auth token: ${_authServices.authToken}");
      log("userId: $userId");

      FormData form = FormData.fromMap({
        "title": title,
        "photos": await MultipartFile.fromFile(image.path,
            contentType: MediaType("image", "png")),
        "status": active,
        "url": url,
        "meta": [
          {
            "name": "title",
            "content": metaTitle,
          },
          {
            "name": "description",
            "content": metaDescription,
          },
          {
            "name": "keywords",
            "content": keywords,
          },
        ],
      });

      final res = await client.post(
        "/api/category/shop",
        data: form,
      );
      log(res);

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      if (e.response?.data != null && e.response!.data['msg'] != null) {
        toastLong(e.response!.data['msg']);
        return false;
      }
      _crashlytics.recordError(e, s,
          reason: "Error in create catalog ${e.response}");

      toastLong(e.message ?? "Please Try again later!!");
      return false;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in create catalog");

      return false;
    }
  }

  createProduct() {}

  Future<Either<ApiFailure, CatalogResponse>> getAllCatelogs({
    String searchString = '',
    CatalogSortOptions sort = CatalogSortOptions.createdAt,
    SortBy sortBy = SortBy.accending,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      log("get all catalogs");

      final res = await client.get(
        "/api/category/shop",
        queryParameters: {
          "search": searchString,
          "sort": sort.value,
          "sortBy": sortBy.value,
          "page": page,
          "limit": limit,
        },
      );

      if (res.statusCode == 200) {
        final catalogs = CatalogResponse.fromJson(res.data);
        return right(catalogs);
      }
      if (res.statusCode == 204) {
        return left(const ApiFailure.noData());
      }

      return left(const ApiFailure.unExpectedError());
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return left(const ApiFailure.noInternet());
      }

      if (e.response?.statusCode == 404) {
        return left(const ApiFailure.noData());
      }
      _crashlytics.recordError(e, s, reason: "Error in get all catalog");
      toastLong(e.message ?? "Please Try again later!!");
      return left(ApiFailure.serverError(
          errorMessage:
              e.response?.data['error'] ?? e.message ?? "Server Error"));
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in get all catalog");
      return left(const ApiFailure.unExpectedError());
    }
  }

  Future<Either<ApiFailure, ProductsResponse>> getAllProducts({
    String searchString = '',
    int page = 1,
    int limit = 10,
    ProductSortOptions sort = ProductSortOptions.createdAt,
    SortBy sortBy = SortBy.accending,
  }) async {
    try {
      final res = await client.get(
        "/api/product/shop/v1",
        queryParameters: {
          "search": searchString,
          "page": page,
          "limit": limit,
          "sort": sort.value,
          "sort_by": sortBy.value,
        },
      );

      if (res.statusCode == 200) {
        final products = ProductsResponse.fromJson(res.data);

        return right(products);
      }

      if (res.statusCode == 204) {
        return left(const ApiFailure.noData());
      }

      return left(const ApiFailure.unExpectedError());
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return left(const ApiFailure.noInternet());
      }
      if (e.response?.statusCode == 404) {
        return left(const ApiFailure.noData());
      }
      _crashlytics.recordError(e, s, reason: "Error in create catalog");
      toastLong(e.message ?? "Please Try again later!!");
      printError(info: e.message ?? "");
      return left(ApiFailure.serverError(
          errorMessage:
              e.response?.data['error'] ?? e.message ?? "Server Error"));
    }
  }

  Future<String> convertImageToBase64({required File image}) async {
    log(await getFileSize(image));

    final bytes = await image.readAsBytes();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";

    return base64Image;
  }

  Future<bool> addProduct({
    required String imagePath,
    required String catalogId,
    String description = "",
    required double mrp,
    required double salePrice,
    bool status = true,
    int? stock,
    required String title,
    required String trends,
    required String unitId,
    required double unitCount,
  }) async {
    try {
      log("add products");

      log("auth token: ${_authServices.authToken}");

      FormData form = FormData.fromMap({
        "photo": await MultipartFile.fromFile(imagePath,
            contentType: MediaType("image", "png")),
        "title": title,
        "status": status,
        "cat_id": catalogId,
        "mrp": mrp,
        "sales_price": salePrice,
        "stock": stock,
        "trends": trends,
        "unit": unitId,
        "unit_count": unitCount,
        "desc": description,
      });

      final res = await client.post(
        "/api/vendor/catalog/product/create",
        data: form,
      );
      log(res);

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      _crashlytics.recordError(e, s, reason: "Error in create catalog");
      log((e.requestOptions.data as FormData).fields);
      toastLong(e.message ?? "Please Try again later!!");
      return false;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in create catalog");

      return false;
    }
  }

  Future<bool> editProduct({
    required String? imagePath,
    required String catalogId,
    String description = "",
    required double mrp,
    required double salePrice,
    bool status = true,
    int? stock,
    required String title,
    required String trends,
    required String unitId,
    required double unitCount,
    required Product product,
  }) async {
    try {
      log("add products");

      log("auth token: ${_authServices.authToken}");
      log("productId:${product.id}");

      final data = {
        "title": title,
        "status": status,
        "cat_id": catalogId,
        "mrp": mrp,
        "sales_price": salePrice,
        "trends": trends,
        "unit": unitId,
        "unit_count": unitCount,
        "desc": description,
        // "photo": null,
        "stock": stock ?? 0,
      };
      if (imagePath != null) {
        data['photo'] = await MultipartFile.fromFile(imagePath,
            contentType: MediaType("image", "png"));
      }
      // if (stock != null) {
      //   data['stock'] = stock;
      // }
      FormData form = FormData.fromMap(data);

      final res = await client.put("/api/vendor/catalog/product/${product.id}",
          data: form,
          options: Options(headers: {
            // "Authorization": "Bearer ${_authServices.authToken}",
          }));
      log(res);

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      log(e.response?.data);
      _crashlytics.recordError(e, s, reason: "Error in create catalog");
      log((e.requestOptions.data as FormData).fields);
      toastLong(e.message ?? "Please Try again later!!");
      return false;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in create catalog");

      return false;
    }
  }

  Future<bool> changeProductStatus({
    required bool status,
    required Product product,
  }) async {
    try {
      final res = await client.patch(
        "/api/product/shop/status/${product.id}",
        data: FormData.fromMap({
          "status": status,
        }),
      );
      log(res);

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      log(e.response?.data);
      _crashlytics.recordError(e, s, reason: "Error in change product status");
      log((e.requestOptions.data as FormData).fields);
      toastLong(e.message ?? "Please Try again later!!");
      return false;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in change product status");

      return false;
    }
  }

  Future<List<ProductUnit>> fetchAllUnits() async {
    try {
      final res = await client.get(
        "/api/unit",
      );

      if (res.statusCode == 201) {
        final units = (res.data['data'] as List)
            .map((e) => ProductUnit.fromJson(e))
            .toList();
        return units;
      } else {
        return [];
      }
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return [];
      }

      _crashlytics.recordError(e, s, reason: "Error in fetchAllUnits");
      toastLong(e.message ?? "Please Try again later!!");
      return [];
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in fetchAllUnits");

      return [];
    }
  }

  getFileSize(
    File file,
  ) async {
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (math.log(bytes) / math.log(1024)).floor();
    return '${(bytes / math.pow(1024, i)).toStringAsFixed(1)} ${suffixes[i]}';
  }

  Future<bool> editCatalog({
    required String title,
    required String? imageFilePath,
    required bool active,
    required Catalog catalog,
  }) async {
    try {
      final data = {
        "photos": json.encode(catalog.photos.map((e) => e.toJson()).toList()),
        "title": title,
        "status": active,
      };

      if (imageFilePath != null) {
        data['photos'] = await MultipartFile.fromFile(imageFilePath,
            contentType: MediaType("image", "png"));
      } else {
        // data['photos'] = [];
      }

      FormData form = FormData.fromMap(data);

      final res = await client.put(
        "/api/vendor/catalog/${catalog.id}",
        data: form,
      );
      log(res);

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      log(e.response?.data);
      _crashlytics.recordError(e, s, reason: "Error in Edit catalog");
      toastLong(e.message ?? "Please Try again later!!");
      return false;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in Edit catalog");

      return false;
    }
  }

  Future<bool> changeCategoryStatus({
    required bool active,
    required Catalog catalog,
  }) async {
    try {
      final data = {
        "status": active,
      };

      final res = await client.patch(
        "/api/catalog/shop/status/${catalog.id}",
        data: data,
      );
      log('change catalog status :$res');

      if (res.statusCode == 200) {
        return true;
      }

      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      log(e.response?.data);
      _crashlytics.recordError(e, s, reason: "Error in Change catalog Status");
      toastLong(e.message ?? "Please Try again later!!");
      return false;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in Change catalog Status");

      return false;
    }
  }

  Future<VendorProfile?> fetchVendorProfile(String username) async {
    try {
      final res = await client.get(
        "/api/shop",
      );
      log(res);

      if (res.statusCode == 200) {
        final profile = VendorProfile.fromJson(res.data);
        log(profile);
        return profile;
      }

      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      log(e.response?.data);
      _crashlytics.recordError(e, s, reason: "Error in Fetch Vendor Profile");
      toastLong(e.message ?? "Please Try again later!!");
      return null;
    } catch (e, s) {
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in Fetch Vendor Profile");

      return null;
    }
  }

  Future<Either<ApiFailure, Unit>> updateVendorProfile({
    required String? businessName,
    required String? fullName,
    required String? email,
    required String? imagePath,
    required String? address1,
    required String? address2,
    required String? city,
    required String? state,
    required String? country,
    required String? zipCode,
    required String? aboutMe,
    required List<String>? selectedCategoryIds,
  }) async {
    try {
      final Map<String, dynamic> data = {
        "business_name": businessName,
        "full_name": fullName,
        "email": email,
        "address_line1": address1,
        "address_line2": address2,
        "city": city,
        "state": state,
        "country": country,
        "zip": zipCode,
        "about": aboutMe,
        "shop_category_id": selectedCategoryIds,
      };

      data.removeWhere((key, value) => value == null);
      data.removeWhere((key, value) => value == "");

      if (imagePath != null) {
        data['photo'] = await MultipartFile.fromFile(imagePath,
            contentType: MediaType("image", "png"));
      }

      log(data);

      FormData form = FormData.fromMap(data);

      final res = await client.patch(
        "/api/profile/shop",
        data: form,
      );
      log(res);

      if (res.statusCode == 200) {
        return right(unit);
      }

      return left(const ApiFailure.unExpectedError());
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        // toastLong(
        //   "Please check your internet connection",
        // );
        return left(const ApiFailure.noInternet());
      }
      log(e.response?.data);
      _crashlytics.recordError(e, s, reason: "Error in update Vendor Profile");
      toastLong(e.message ?? "Please Try again later!!");
      return left(ApiFailure.serverError(
          errorMessage: e.response?.data['error'] ??
              e.message ??
              "Please Try again later!!"));
    } catch (e, s) {
      // toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in update Vendor Profile");

      return left(const ApiFailure.unExpectedError(
          errorMessage: "Please Try again later!!"));
    }
  }

  Future<List<Order>> getAllOrders(String userId) async {
    try {
      final res = await client.get("/api/order/vendor/list");

      if (res.statusCode == 200) {
        final orders = (res.data as List)
            .where((element) {
              try {
                OrderInfo.fromJson(element);
                return true;
              } catch (e, s) {
                _crashlytics.recordError(e, s,
                    reason: "Error parsing OrderInfo: $element");
                return false;
              }
            })
            .map((e) => OrderInfo.fromJson(e).getOrder())
            .toList();
        log("orders: ${orders.length}");
        return orders;
      }
      return [];
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return [];
      }
      if (e.response?.statusCode == 404) {
        return [];
      }
      toastLong("Please Try again later!!");
      _crashlytics.recordError(e, s, reason: "Error in getAllOrders");

      printError(info: e.message ?? "");
      return [];
    }
  }

  Future<Order?> getOrderById(String orderId) async {
    try {
      final res = await client.get("/api/order/vendor/$orderId");

      if (res.statusCode == 200) {
        final List<SingleProductOrderResponse> data = (res.data as List)
            .map((e) => SingleProductOrderResponse.fromJson(e))
            .toList();

        // log("order: $order");
        return data.getOrder();
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      return null;
    }
  }

  Future<bool> acceptOrder(String orderId) async {
    try {
      final res = await client.put("/api/customer/order/accept/$orderId");

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in Accept Order");

      return false;
    }
  }

  Future<bool> shipOrder(String orderId) async {
    try {
      final res = await client.put("/api/customer/order/shipped/$orderId");

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in Ship Order");

      return false;
    }
  }

  Future<bool> deliverOrder(String orderId) async {
    try {
      final res = await client.put("/api/customer/order/deliver/$orderId");

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in deliver Order");

      return false;
    }
  }

  Future<bool> cancelOrder(String orderId) async {
    try {
      final res = await client.put("/api/customer/order/cancel/$orderId");

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in cancel Order");

      return false;
    }
  }

  Future<double> fetchTotalEarnings(String userId) async {
    try {
      final res = await client.get("/api/vendor/count/earning/$userId");

      log(res);
      if (res.statusCode == 200) {
        final totalEarning = (res.data['total_earning']);

        if (totalEarning is int) {
          return totalEarning.toDouble();
        }

        return totalEarning;
      }
      return 0;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return 0;
      }
      if (e.response?.statusCode == 404) {
        return 0;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in fetch Total Earning");

      return 0;
    }
  }

  Future<int> fetchstoreView(String userName) async {
    try {
      final res = await client.get("/api/vendor/count/store/$userName");

      log(res);
      if (res.statusCode == 200) {
        final views = res.data['views'] as int;
        return views;
      }
      return 0;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return 0;
      }
      if (e.response?.statusCode == 404) {
        return 0;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in fetch store view");

      return 0;
    }
  }

  Future<int> fetchProductView(String userId) async {
    try {
      final res = await client.get("/api/vendor/count/product/$userId");

      log(res);
      if (res.statusCode == 200) {
        final views = res.data['views'] as int;
        return views;
      }
      return 0;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return 0;
      }
      if (e.response?.statusCode == 404) {
        return 0;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in fetch store view");

      return 0;
    }
  }

  Future<ShopSettings?> getStoreSettings(String userName) async {
    try {
      final res = await client.get("/api/setting/$userName");

      log(res);
      if (res.statusCode == 200) {
        final storeSettings = ShopSettings.fromJson(res.data);
        return storeSettings;
      }
      return null;
    } on DioException catch (e, s) {
      log("Error in getting store settings $e");
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in fetch store settings");

      return null;
    }
  }

  Future<bool> changeShopStatus(String userId, bool shopStatus,
      {int? openAfter}) async {
    try {
      final res = await client.put("/api/setting/", data: {
        "shop_status": shopStatus,
      });

      log(res);
      if (res.statusCode == 201) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in change shop status");

      return false;
    }
  }

  Future<bool> deleteCatalog({required String catalogId}) async {
    try {
      final res = await client.delete(
        "/api/vendor/catalog/$catalogId",
      );

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in delete category ${e.requestOptions.path}");

      return false;
    }
  }

  Future<bool> changeOnlineOrderStatus(String userId, bool status) async {
    try {
      final res = await client.put("/api/setting/", data: {
        "order_status": status,
      });

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in change changeOnlineOrder ${e.requestOptions.path}");

      return false;
    }
  }

  Future<bool> changeShowWhatsappStatus(String userId, bool status) async {
    try {
      final res = await client.put("/api/setting/", data: {
        "whatsapp_status": status,
      });

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason:
              "Error in change changeShowWhatsappStatus ${e.requestOptions.path}");

      return false;
    }
  }

  Future<bool> deleteProduct({required String productId}) async {
    try {
      final res = await client.delete(
        "/api/vendor/catalog/product/$productId",
      );

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in delete product ${e.requestOptions.path}");

      return false;
    }
  }

  Future<Either<ApiFailure, CustomerResponse>> fetchAllCustomer({
    String searchString = '',
    int page = 1,
    int limit = 20,
    CustomerSortOption sort = CustomerSortOption.updatedAt,
    SortBy sortBy = SortBy.accending,
  }) async {
    try {
      final res = await client.get(
        "/api/customer/shop",
        queryParameters: {
          "search": searchString,
          "page": page,
          "limit": limit,
          "sort": sort.value,
          "sort_by": sortBy.value,
        },
      );
      if (res.statusCode == 200) {
        final customers = CustomerResponse.fromJson(res.data);
        return right(customers);
      }
      if (res.statusCode == 204) {
        return left(const ApiFailure.noData());
      }

      return left(const ApiFailure.unExpectedError());
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return left(const ApiFailure.noInternet());
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return left(const ApiFailure.noData());
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetch all customers ${e.requestOptions.path}");

      return left(ApiFailure.serverError(
          errorMessage:
              e.response?.data['error'] ?? e.message ?? "Server Error"));
    } catch (e, s) {
      _crashlytics.recordError(e, s,
          reason: "ExpectedError Error in fetch all customers $s");
      return left(const ApiFailure.unExpectedError(
        errorMessage: "Something went wrong, please try again later",
      ));
    }
  }

  Future<ShippingCharge?> fetchShippingCharges() async {
    try {
      final res = await client.get(
        "/api/shipping/",
      );

      log(res);
      if (res.statusCode == 200) {
        if (res.data == null) return const ShippingCharge();
        // return true;
        final shippingCharge = ShippingCharge.fromJson(res.data);

        return shippingCharge;
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetch shipping charge ${e.requestOptions.path}");

      return null;
    }
  }

  Future<bool> updateShippingCharges(
      {required int? shippingCharge, required int? freeShippingAfter}) async {
    try {
      final res = await client.put(
        "/api/shipping",
        data: {
          "free_shipping_after": freeShippingAfter,
          "shipping_cost": shippingCharge,
        },
      );

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in update shipping charge ${e.requestOptions.path}");

      return false;
    }
  }

  Future<(String?, String?)?> fetchPrivacyPolicy() async {
    try {
      final res = await client.get(
        "/api/vendor/policy/privacy",
      );

      print("privacy policy");
      log(res);
      if (res.statusCode == 201) {
        if (res.data['data'] == null) return null;
        final privacyPolicy = res.data['privacy_policy'] as String?;
        final id = res.data['_id'] as String?;

        return (privacyPolicy, id);
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetch privacyPolicy ${e.requestOptions.path}");

      return null;
    }
  }

  Future<(String?, String?)?> fetchTerms() async {
    try {
      final res = await client.get(
        "/api/vendor/policy/terms",
      );

      print("fetch Terms");
      log(res);
      if (res.statusCode == 201) {
        if (res.data['data'] == null) return null;
        final privacyPolicy = res.data['terms_condition'] as String?;
        final id = res.data['_id'] as String?;

        return (privacyPolicy, id);
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetchTerms ${e.requestOptions.path}");

      return null;
    }
  }

  Future<(String?, String?)?> fetchRefundPolicy() async {
    try {
      final res = await client.get(
        "/api/vendor/policy/refund",
      );

      print("fetchRefundPolicy");
      log(res);
      if (res.statusCode == 201) {
        if (res.data['data'] == null) return null;
        final privacyPolicy = res.data['refund_policy'] as String?;
        final id = res.data['_id'] as String?;

        return (privacyPolicy, id);
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetchRefundPolicy ${e.requestOptions.path}");

      return null;
    }
  }

  Future<(String?, String?)?> fetchCancellation() async {
    try {
      final res = await client.get(
        "/api/vendor/policy/cancellation",
      );

      print("fetchCancellation");
      log(res);
      if (res.statusCode == 201) {
        if (res.data['data'] == null) return null;
        final privacyPolicy = res.data['cancellation_policy'] as String?;
        final id = res.data['_id'] as String?;

        return (privacyPolicy, id);
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetchCancellation ${e.requestOptions.path}");

      return null;
    }
  }

  Future<(String?, String?)?> fetchShipping() async {
    try {
      final res = await client.get(
        "/api/vendor/policy/shipping",
      );

      print("fetchShipping");
      log(res);
      if (res.statusCode == 201) {
        if (res.data['data'] == null) return null;
        final privacyPolicy = res.data['shipping_policy'] as String?;
        final id = res.data['_id'] as String?;

        return (privacyPolicy, id);
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in fetchShipping ${e.requestOptions.path}");

      return null;
    }
  }

  Future<bool> updatePrivacyPolicy(String content, String policyId) async {
    try {
      final res =
          await client.put("/api/vendor/policy/privacy/$policyId", data: {
        "privacy_policy": content,
      });

      // print("privacy policy");
      log(res);
      // if (res.statusCode == 201) {
      //   if (res.data['data'] == null) return null;
      //   final privacyPolicy = res.data['privacy_policy'] as String?;
      //   final id = res.data['_id'] as String?;

      //   return (privacyPolicy, id);
      // }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in update privacyPolicy ${e.requestOptions.path}");

      return false;
    }
  }

  Future<bool> updateOrderStatus(String orderId, String status) async {
    try {
      final res = await client.patch(
        "/api/order/status/$orderId",
        data: {
          "type": status,
        },
      );

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s, reason: "Error in Update Order status");

      return false;
    }
  }

  Future<SocialLinks?> fetchSocialLinks(String userName) async {
    try {
      final res = await client.get(
        "/api/social-link/$userName",
      );

      log(res);
      if (res.statusCode == 200) {
        if (res.data == null) return const SocialLinks();
        // return true;
        final shippingCharge = SocialLinks.fromJson(res.data);

        return shippingCharge;
      }
      return null;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return null;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return null;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in Social links  ${e.requestOptions.path}");

      return null;
    }
  }

  Future<bool> updateSocialLinks({required SocialLinks socialLinks}) async {
    try {
      print(socialLinks.toJson());

      final res = await client.put(
        "/api/social-link",
        data: socialLinks.toJson(),
      );

      log(res);
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return false;
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return false;
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in update shipping charge ${e.requestOptions.path}");

      return false;
    }
  }

  Future<Either<ApiFailure, VendorStats>> getVendorStats(
      {required DateTime startDate, DateTime? endDate}) async {
    try {
      final res = await client.get(
        "/api/dashboard/shop",
        queryParameters: {
          "fromDate": DateFormat('yyyy-MM-dd').format(startDate),
          "toDate": DateFormat('yyyy-MM-dd').format(endDate ?? DateTime.now()),
        },
      );

      log(res);
      if (res.statusCode == 200) {
        return right(VendorStats.fromJson(res.data));
      }
      return left(const ApiFailure.unExpectedError());
    } on DioException catch (e, s) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        toastLong(
          "Please check your internet connection",
        );
        return left(const ApiFailure.noInternet());
      }
      toastLong(e.message ?? "Please Try again later!!");
      if (e.response?.statusCode == 404) {
        return left(const ApiFailure.noData());
      }
      printError(info: e.message ?? "");
      _crashlytics.recordError(e, s,
          reason: "Error in update shipping charge ${e.requestOptions.path}");

      return left(ApiFailure.serverError(
          errorMessage:
              e.response?.data['error'] ?? e.message ?? "Server Error"));
    } catch (e) {
      printError(info: e.toString());
      return left(const ApiFailure.unExpectedError());
    }
  }
}
