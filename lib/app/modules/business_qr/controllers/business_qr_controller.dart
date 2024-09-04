import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lofaz/app/modules/home/controllers/home_controller.dart';
import 'package:lofaz/app/utils/AppConstant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class BusinessQrController extends GetxController {
  final vendor = Get.find<HomeController>().vendorProfile;
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  shareClicked() async {
    final bytes = await screenshotController.capture();
    if (bytes == null) {
      return;
    }

    await Share.shareXFiles(
      [
        XFile.fromData(
          bytes,
          mimeType: "image/png",
        )
      ],
      text:
          "Scan the above qr code to order online at ${vendor.value?.businessName ?? "Lofaz"}\n$mainUrl/${vendor.value?.username ?? ""}",
    );
  }

  saveClicked() async {
    final status = await Permission.mediaLibrary.request();
    if (!status.isGranted) {
      return;
    }

    final bytes = await screenshotController.capture();
    if (bytes == null) {
      return;
    }
    final result =
        await ImageGallerySaver.saveImage(bytes.buffer.asUint8List());
    if (result is Map) {
      final isSuccess = result["isSuccess"] as bool?;
      if (isSuccess != null && isSuccess) {
        toastLong("Saved to gallery");
      }
    }
    // await screenshotController.captureAndSave();
  }
}
