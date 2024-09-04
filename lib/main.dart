import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/initial_bindings/initial_bindings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'app/data/services/notification_services.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/AppTheme.dart';
import 'firebase_options.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initialize();
    _initCrashlytics();
    await Get.put<NotificationServices>(NotificationServices()).onInit();
    // FirebaseInAppMessaging.instance.
    runApp(
      const MyApp(),
    );
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

Future _initCrashlytics() async {
  FirebaseInAppMessaging.instance;
  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.isDarkMode ? AppThemeData.darkTheme : AppThemeData.lightTheme,
      initialBinding: InitialBindings(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
      title: "Lofaz Seller",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1,
          ),
          child: GestureDetector(
              onTap: () {
                Focus.of(context).unfocus();
              },
              child: child!),
        );
      }),
    );
  }
}
