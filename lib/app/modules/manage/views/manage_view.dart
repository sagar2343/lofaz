import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lofaz/app/routes/app_pages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/manage_controller.dart';

class ManageView extends GetView<ManageController> {
  ManageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.8),
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.CUSTOMERS);
              Future.delayed(Duration(seconds: 2), () {
    _requestReview();
  });
            },
            child: const Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people, size: 40),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Customers",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.BUSINESS_QR);
                Future.delayed(Duration(seconds: 2), () {
    _requestReview();
  });
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner, size: 40),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Business QR code",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  final InAppReview inAppReview = InAppReview.instance;

  Future<void> _requestReview() async {
    // Check if the in-app review feature is available
    if (await inAppReview.isAvailable()) {
      final prefs = await SharedPreferences.getInstance();
      final lastRequested = prefs.getInt('last_review_request') ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;

      // Check if 30 minutes (1800000 milliseconds) have passed since the last request
      if (now - lastRequested > 30 * 60 * 1000) { // 30 minutes
        inAppReview.requestReview();
        prefs.setInt('last_review_request', now);
      }
    }
  }
}
