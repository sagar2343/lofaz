import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lofaz/app/routes/app_pages.dart';

import '../controllers/manage_controller.dart';

class ManageView extends GetView<ManageController> {
  const ManageView({Key? key}) : super(key: key);
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
}
