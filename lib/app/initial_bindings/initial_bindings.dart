import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:lofaz/app/controllers/app_store.dart';
import 'package:lofaz/app/data/services/auth_services.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<FirebaseCrashlytics>(FirebaseCrashlytics.instance);
    Get.put<FirebaseAnalytics>(FirebaseAnalytics.instance);

    Get.put<AppStore>(AppStore(), permanent: true);
    Get.put<AuthServices>(AuthServices(Get.find(), Get.find()));

    Get.lazyPut<VendorServices>(() => VendorServices(Get.find(), Get.find()));
    Get.put<FirebaseMessaging>(FirebaseMessaging.instance)
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }
}
