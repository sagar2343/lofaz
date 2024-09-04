import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/AppConstant.dart';

class MoreInformationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  rateUsClicked() async {
    final InAppReview inAppReview = InAppReview.instance;
    inAppReview.openStoreListing();
    // if (await inAppReview.isAvailable()) {
    //   inAppReview.requestReview();
    // } else {
    //   inAppReview.openStoreListing();
    // }
  }

  launchPrivacyPolicy() {
    launchUrlString("$mainUrl/privacy-policy",
        mode: LaunchMode.inAppBrowserView);
  }
}
