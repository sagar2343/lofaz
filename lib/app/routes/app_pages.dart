import 'package:get/get.dart';

import '../modules/add_category/bindings/add_category_binding.dart';
import '../modules/add_category/views/add_category_view.dart';
import '../modules/add_product/bindings/add_product_binding.dart';
import '../modules/add_product/views/add_product_view.dart';
import '../modules/business_qr/bindings/business_qr_binding.dart';
import '../modules/business_qr/views/business_qr_view.dart';
import '../modules/business_settings/bindings/business_settings_binding.dart';
import '../modules/business_settings/views/business_settings_view.dart';
import '../modules/customers/bindings/customers_binding.dart';
import '../modules/customers/views/customers_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/edit_vendor_profile/bindings/edit_vendor_profile_binding.dart';
import '../modules/edit_vendor_profile/views/edit_vendor_profile_view.dart';
import '../modules/filtered_order_list/bindings/filtered_order_list_binding.dart';
import '../modules/filtered_order_list/views/filtered_order_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/important_links/bindings/important_links_binding.dart';
import '../modules/important_links/views/important_links_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_otp/bindings/login_otp_binding.dart';
import '../modules/login_otp/views/login_otp_view.dart';
import '../modules/manage/bindings/manage_binding.dart';
import '../modules/manage/views/manage_view.dart';
import '../modules/more_information/bindings/more_information_binding.dart';
import '../modules/more_information/views/more_information_view.dart';
import '../modules/order_details/bindings/order_details_binding.dart';
import '../modules/order_details/views/order_details_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/views/products_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/root_view/bindings/root_view_binding.dart';
import '../modules/root_view/views/root_view_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/shipping_charge_input/bindings/shipping_charge_input_binding.dart';
import '../modules/shipping_charge_input/views/shipping_charge_input_view.dart';
import '../modules/social_links/bindings/social_links_binding.dart';
import '../modules/social_links/views/social_links_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/walk_through/bindings/walk_through_binding.dart';
import '../modules/walk_through/views/walk_through_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: "/",
        page: () => const RootViewView(),
        binding: RootViewBinding(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
              name: _Paths.HOME,
              page: () => const HomeView(),
              preventDuplicates: true,
              participatesInRootNavigator: true,
              binding: HomeBinding(),
              children: [
                GetPage(
                  name: _Paths.FILTERED_ORDER_LIST,
                  page: () => const FilteredOrderListView(),
                  binding: FilteredOrderListBinding(),
                ),
                GetPage(
                  name: _Paths.DASHBOARD,
                  page: () => const DashboardView(),
                  binding: DashboardBinding(),
                ),
                GetPage(
                    name: _Paths.ORDERS,
                    page: () => const OrdersView(),
                    binding: OrdersBinding(),
                    children: [
                      GetPage(
                        name: _Paths.ORDER_DETAILS,
                        page: () => const OrderDetailsView(),
                        binding: OrderDetailsBinding(),
                      ),
                    ]),
                GetPage(
                    name: _Paths.PRODUCTS,
                    page: () => ProductsView(),
                    binding: ProductsBinding(),
                    children: [
                      GetPage(
                        name: _Paths.ADD_CATEGORY,
                        page: () => AddCategoryView(),
                        binding: AddCategoryBinding(),
                      ),
                      GetPage(
                        name: _Paths.ADD_PRODUCT,
                        page: () => AddProductView(),
                        binding: AddProductBinding(),
                      ),
                    ]),
                GetPage(
                    name: _Paths.SETTINGS,
                    page: () => const SettingsView(),
                    binding: SettingsBinding(),
                    children: [
                      GetPage(
                        name: _Paths.EDIT_VENDOR_PROFILE,
                        page: () => EditVendorProfileView(),
                        binding: EditVendorProfileBinding(),
                      ),
                      GetPage(
                          name: _Paths.BUSINESS_SETTINGS,
                          page: () => BusinessSettingsView(),
                          binding: BusinessSettingsBinding(),
                          children: [
                            GetPage(
                              name: _Paths.SHIPPING_CHARGE_INPUT,
                              page: () => const ShippingChargeInputView(),
                              binding: ShippingChargeInputBinding(),
                            ),
                            GetPage(
                              name: _Paths.IMPORTANT_LINKS,
                              page: () => const ImportantLinksView(),
                              binding: ImportantLinksBinding(),
                            ),
                            GetPage(
                              name: _Paths.SOCIAL_LINKS,
                              page: () => const SocialLinksView(),
                              binding: SocialLinksBinding(),
                            ),
                          ]),
                      GetPage(
                        name: _Paths.MORE_INFORMATION,
                        page: () => const MoreInformationView(),
                        binding: MoreInformationBinding(),
                      ),
                    ]),
                GetPage(
                    name: _Paths.MANAGE,
                    page: () => ManageView(),
                    binding: ManageBinding(),
                    children: [
                      GetPage(
                        name: _Paths.CUSTOMERS,
                        page: () => const CustomersView(),
                        binding: CustomersBinding(),
                      ),
                      GetPage(
                        name: _Paths.BUSINESS_QR,
                        page: () => BusinessQrView(),
                        binding: BusinessQrBinding(),
                      ),
                    ]),
              ]),
          GetPage(
            name: _Paths.SPLASH,
            page: () => const SplashView(),
            binding: SplashBinding(),
          ),
          GetPage(
            name: _Paths.WALK_THROUGH,
            page: () => const WalkThroughView(),
            binding: WalkThroughBinding(),
          ),
          GetPage(
            name: _Paths.LOGIN,
            page: () => const LoginView(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: _Paths.LOGIN_OTP,
            page: () => const LoginOtpView(),
            binding: LoginOtpBinding(),
          ),
          GetPage(
            name: _Paths.REGISTER,
            page: () => const RegisterView(),
            binding: RegisterBinding(),
          ),
        ]),
  ];
}
