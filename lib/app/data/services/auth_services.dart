import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/data/errors/register_error.dart';
import 'package:lofaz/app/data/models/auth_session.dart';
import 'package:lofaz/app/data/models/ip_location_info/ip_location_info.dart';
import 'package:lofaz/app/data/models/shop_category/shop_category.dart';
import 'package:lofaz/app/data/models/vendor.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:nb_utils/nb_utils.dart' hide IntExtensions, log;

class AuthServices extends GetxService {
  final FirebaseAuth _auth;
  final FirebaseCrashlytics _crashlytics;
  late Dio client;
  AuthServices(this._auth, this._crashlytics);

  @override
  void onInit() {
    // client = Dio(BaseOptions(baseUrl: "https://api.lofaz.com"));
    client = Dio(BaseOptions(baseUrl: apiEndpoint));
    super.onInit();
  }

  User? get getCurrentUser {
    return _auth.currentUser;
  }

  String get getPhoneNumber {
    return getCurrentUser!.phoneNumber!;
  }

  bool get isLoggedIn {
    return getCurrentUser != null;
  }

  String get authToken {
    return getStringAsync(authTokenPref);
  }

  AuthSession? get authSession {
    try {
      return AuthSession.fromJson(getJSONAsync(authSessionPref));
    } catch (e) {
      return null;
    }
  }

  IpLocationInfo? get ipLocationInfo {
    try {
      final ipJson = getJSONAsync(ipLocationInfoPref);
      if (ipJson.isEmpty) return null;
      return IpLocationInfo.fromJson(ipJson);
    } catch (e) {
      return null;
    }
  }

  Future<void> loginWithPhone({
    required String phone,
    required Function(String, int?) onCodeSend,
    required Function(FirebaseAuthException) onError,
    required Function(User) verificationCompleted,
    int? forceResendingToken,
  }) async {
    sendIpOnPhoneLogIn(phoneNumber: phone);
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      forceResendingToken: forceResendingToken,
      verificationCompleted: (phoneAuthCredential) async {
        final user = await _auth.signInWithCredential(phoneAuthCredential);
        verificationCompleted(user.user!);
      },
      verificationFailed: (e) {
        onError(e);
        _crashlytics.recordError(e, e.stackTrace);
      },
      codeSent: (verificationId, forceResendingToken) {
        onCodeSend(verificationId, forceResendingToken);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<User?> verifyPhoneOtp(String smsCode, String verificationId) async {
    // Create a PhoneAuthCredential with the code
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      final cred = await _auth.signInWithCredential(credential);
      return cred.user;
    } on FirebaseAuthException catch (e, s) {
      if (e.code == "invalid-verification-code") {
        toastLong("Invalid OTP, Please try again!");
        return null;
      }
      toastLong(e.message ?? "Please try again!!");
      _crashlytics.recordError(e, s);
      return null;
    }
  }

  Future<void> logOut() async {
    await removeKey(authTokenPref);
    await removeKey(authSessionPref);
    await removeKey(ipLocationInfoPref);
    await _auth.signOut();
  }

  Future<(String?, Vendor?)> checkPhoneAlreadyRegistered(
      {required String phone}) async {
    try {
      final res = await client.get("/api/vendor/check_number/$phone");

      if (res.statusCode == 201 &&
          res.data['token'] != null &&
          res.data['data'] != null) {
        return (
          res.data['token'] as String?,
          Vendor.fromJson(res.data['data'])
        );
      }
      return (null, null);
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
        return (null, null);
      }
      if (e.response?.statusCode == 404) {
        return ("", null);
      }
      _crashlytics.recordError(e, s);
      return (null, null);
    }
  }

  Future<Either<RegisterErrors, Vendor>> registerVendor({
    required String businessName,
    required String userName,
    required String fullName,
    required String firstName,
    required String lastName,
    required List<ShopCategory> selectedShopCategories,
  }) async {
    try {
      if (getCurrentUser == null || getCurrentUser!.phoneNumber == null) {
        return left(const RegisterErrors.unExpectedError());
      }

      final res = await client.post("/api/auth/shop/signup", data: {
        "business_name": businessName,
        "phone": getCurrentUser!.phoneNumber!,
        "shop_category_id": selectedShopCategories.map((e) => e.id).toList(),
        "first_name": firstName,
        "surname_name": lastName,
        "username": userName,
      });

      if (res.statusCode == 200 &&
          res.data['token'] != null &&
          res.data['data'] != null) {
        final token = res.data['token'] as String;
        final vendor = Vendor.fromJson(res.data['data']);
        await setValue(authTokenPref, token);
        await createAuthSession(AuthSession(
            authToken: token,
            userId: vendor.id,
            businessName: vendor.businessName,
            userName: vendor.username));

        return right(vendor);
      }

      return left(const RegisterErrors.unExpectedError());
    } on DioException catch (e) {
      if ([
        DioExceptionType.connectionError,
        DioExceptionType.unknown,
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ].contains(e.type)) {
        return left(const RegisterErrors.noInternet());
      }
      log("register Vendor: ${e.message}");
      log('register Vendor error res${e.response}');
      _crashlytics.recordError(e, e.stackTrace);

      if (e.response != null && e.response!.data != null) {
        if (e.response!.data['err'] != null) {
          final errorMessage = e.response!.data['err'];

          if (errorMessage == 'Shop url already exits') {
            return left(const RegisterErrors.userNameAlreadyExist());
          }

          return left(RegisterErrors.serverError(errorMessage: errorMessage));
        }
      }

      return left(const RegisterErrors.serverError(
          errorMessage: 'Something went wrong'));
    }
  }

  handleAuthSuccess(
    User user, {
    VoidCallback? onAccountFound,
    VoidCallback? onAccountNotFound,
  }) async {
    EasyLoading.show(
        status: "Checking info...", maskType: EasyLoadingMaskType.black);
    // print(user.phoneNumber);
    final (token, vendor) = await checkPhoneAlreadyRegistered(phone: user.phoneNumber!);
    EasyLoading.dismiss();
    if (token != null) {
      if (token.isNotEmpty) {
        setValue(authTokenPref, token);
        if (vendor != null) {
          createAuthSession(AuthSession(
              authToken: token,
              userId: vendor.id,
              businessName: vendor.businessName,
              userName: vendor.username));
        }
        onAccountFound?.call();
      } else {
        onAccountNotFound?.call();
      }
    }
  }

  Future<void> createAuthSession(AuthSession session) async {
    if (Get.isRegistered<VendorServices>()) {
      Get.find<VendorServices>().onInit();
    }
    await setValue(authSessionPref, session.toJson());
  }

  Future<void> fetchUserIpInfoAndSend() async {
    try {
      if (ipLocationInfo != null) {
        // print(ipLocationInfo);
        log("Ip Location already sended");
        return;
      }

      final res = await client.get('https://ipapi.co/json');

      if (res.statusCode == 200) {
        final ipLocationInfo = IpLocationInfo.fromJson(res.data);
        final sendRes =
            await client.post("/api/auth/lead/ip_location", data: res.data);

        if ([200, 201].contains(sendRes.statusCode)) {
          await setValue(ipLocationInfoPref, ipLocationInfo.toJson());
        }
      }
    } on DioException catch (e) {
      log("fetchUserIpInfoAndSend ${e.message}");
      _crashlytics.recordError(e, e.stackTrace);
    }
  }

  Future<void> sendIpOnPhoneLogIn({
    required String phoneNumber,
  }) async {
    try {
      if (ipLocationInfo != null && ipLocationInfo?.ip != null) {
        final res = await client.post("/api/auth/lead/phone", data: {
          "phone": phoneNumber,
          "ip_address": ipLocationInfo!.ip,
        });
        log(res.data.toString());
      }
    } on DioException catch (e) {
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
        return;
      }
      log('sendIpOnPhoneLogin ${e.message}');
      _crashlytics.recordError(e, e.stackTrace);
    }
  }

  Future<List<ShopCategory>> fetchShopCategories() async {
    try {
      final res = await client.get(
        "/api/shop_category/shop",
      );

      if (res.statusCode == 200) {
        return (res.data as List).map((e) => ShopCategory.fromJson(e)).toList();
      }

      return [];
    } on DioException catch (e) {
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
      }
      log('fetchShopCategories ${e.message}');
      _crashlytics.recordError(e, e.stackTrace);
      return [];
    }
  }

  // listenForNetworkState() {
  //   // networkStateSubs = Connectivity().onConnectivityChanged.listen((event) {
  //   //   print("networkstate:$event");
  //   //   if (ConnectivityResult.none == event) {
  //   //     Get.snackbar(
  //   //       "No Internet",
  //   //       "Please check your internet connection",
  //   //       colorText: Colors.white,
  //   //       backgroundColor: Colors.red,
  //   //       duration: 5.seconds,
  //   //       snackPosition: SnackPosition.BOTTOM,
  //   //     );
  //   //   }
  //   // });
  // }

  @override
  void onClose() {
    super.onClose();
  }
}
