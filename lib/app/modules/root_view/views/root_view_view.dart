import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/root_view_controller.dart';

class RootViewView extends GetView<RootViewController> {
  const RootViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RootViewView',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
      ),
      body: GetRouterOutlet(
        initialRoute: Routes.SPLASH,
        anchorRoute: '/',
      ),
    );
  }
}
