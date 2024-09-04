import 'package:get/get.dart';
import 'package:lofaz/app/data/services/vendor_services.dart';
import 'package:nb_utils/nb_utils.dart';

class ImportantLinksController extends GetxController {
  final VendorServices vendorServices;
  final privacyPolicy = Rxn<String>();

  final termsPolicy = Rxn<String>();
  final cancellationPolicy = Rxn<String>();
  final refundPolicy = Rxn<String>();
  final shippingPolicy = Rxn<String>();
  String? policyId;

  final isPrivacyLoading = false.obs;
  final isTermsLoading = false.obs;
  final isCancellationLoading = false.obs;
  final isRefundLoading = false.obs;
  final isShippingLoading = false.obs;

  ImportantLinksController(this.vendorServices);

  @override
  void onInit() {
    fetchPrivacyPolicy();
    fetchTerms();
    fetchCancellationPolicy();
    fetchRefundPolicy();
    fetchShippingPolicy();
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

  fetchPrivacyPolicy() async {
    isPrivacyLoading.value = true;
    await vendorServices.fetchPrivacyPolicy().then((value) {
      if (value != null) {
        privacyPolicy.value = value.$1;
        policyId ??= value.$2;
      }
    });
    isPrivacyLoading.value = false;
  }

  fetchTerms() async {
    isTermsLoading.value = true;
    await vendorServices.fetchTerms().then((value) {
      if (value != null) {
        privacyPolicy.value = value.$1;
        policyId ??= value.$2;
      }
    });
    isTermsLoading.value = false;
  }

  fetchCancellationPolicy() async {
    isCancellationLoading.value = true;
    await vendorServices.fetchCancellation().then((value) {
      if (value != null) {
        cancellationPolicy.value = value.$1;
        policyId ??= value.$2;
      }
    });
    isCancellationLoading.value = false;
  }

  fetchRefundPolicy() async {
    isRefundLoading.value = true;
    await vendorServices.fetchRefundPolicy().then((value) {
      if (value != null) {
        refundPolicy.value = value.$1;
        policyId ??= value.$2;
      }
    });
    isRefundLoading.value = false;
  }

  fetchShippingPolicy() async {
    isShippingLoading.value = true;
    await vendorServices.fetchShipping().then((value) {
      if (value != null) {
        shippingPolicy.value = value.$1;
        policyId ??= value.$2;
      }
    });
    isShippingLoading.value = false;
  }

  updatePrivacyPolicy(
    String content,
  ) {
    print("Update privacy");
    if (policyId == null) {
      toast("Unable to update privacy policy, id null");
      return;
    }
    vendorServices.updatePrivacyPolicy(content, policyId!);
  }
}
