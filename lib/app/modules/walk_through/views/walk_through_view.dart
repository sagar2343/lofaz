import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/AppConstant.dart';
import '../../../utils/AppWidget.dart';
import '../../../utils/T4Colors.dart';
import '../../../utils/dots_indicator/dots_indicator.dart';
import '../../../utils/gen/assets.gen.dart';
import '../../../utils/widgets/T4Button.dart';
import '../controllers/walk_through_controller.dart';

class WalkThroughView extends GetView<WalkThroughController> {
  const WalkThroughView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);
    var width = Get.width;
    var height = Get.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            Assets.images.t4WalkBg.path,
            width: width * 0.8,
            height: height * 0.5,
            fit: BoxFit.fill,
            color: t2_colorPrimary_light.withOpacity(0.2),
          ),
          SizedBox(
            width: width,
            height: height,
            child: PageView(
              controller: controller.pageController,
              children: <Widget>[
                WalkThrough(
                    textContent: "Create your Online Store\nin 15 seconds",
                    walkImg: Assets.images.first.path),
                WalkThrough(
                    textContent:
                        "Share you store link & start\nreceiving orders from around the world.",
                    walkImg: Assets.images.second.path),
                WalkThrough(
                    textContent:
                        "Manage store, Inventory, Order &\nBusiness Hassle Free",
                    walkImg: Assets.images.third.path),
              ],
              onPageChanged: (value) {
                controller.currentIndexPage.value = value;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                      child: T4Button(
                          textContent: "Prev", onPressed: controller.onPrev)),
                  Obx(() {
                    return DotsIndicator(
                        dotsCount: 3,
                        position: controller.currentIndexPage.value,
                        decorator: const DotsDecorator(
                          color: t4_view_color,
                          activeColor: t2_colorPrimary,
                        ));
                  }),
                  T4Button(
                    textContent: "Next",
                    onPressed: controller.onNext,
                    isStroked: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String? textContent;
  final String? walkImg;

  const WalkThrough({Key? key, this.textContent, this.walkImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var h = Get.height;

    return SizedBox(
      width: width,
      height: h,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: h * 0.05),
            height: h * 0.5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.asset(
                  walkImg!,
                  width: width,
                  height: h * 0.4,
                  // fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.08),
          text(
            textContent,
            // textColor: appStore.textPrimaryColor,
            fontSize: textSizeNormal,
            fontFamily: fontMedium,
            maxLine: 100,
            isCentered: true,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 28.0, right: 28.0),
          //   child: text(
          //       "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates",
          //       fontSize: textSizeMedium,
          //       maxLine: 3,
          //       isCentered: true),
          // )
        ],
      ),
    );
  }
}
