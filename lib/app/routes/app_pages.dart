import 'package:get/get.dart';

import '../modules/add_parties_user/bindings/add_parties_binding.dart';
import '../modules/add_parties_user/views/add_parties_view.dart';
import '../modules/admin_attendance_monitor/bindings/admin_attendance_monitor_binding.dart';
import '../modules/admin_attendance_monitor/views/admin_attendance_monitor_view.dart';
import '../modules/admin_category/bindings/admin_category_binding.dart';
import '../modules/admin_category/views/admin_category_view.dart';
import '../modules/admin_leave_conformation/bindings/admin_leave_conformation_binding.dart';
import '../modules/admin_leave_conformation/views/admin_leave_conformation_view.dart';
import '../modules/admin_order_monitor/bindings/admin_order_monitor_binding.dart';
import '../modules/admin_order_monitor/views/admin_order_monitor_view.dart';
import '../modules/admin_product/bindings/admin_addproduct_binding.dart';
import '../modules/admin_product/views/admin_product_view.dart';
import '../modules/admin_return_conformation/bindings/admin_return_conformation_binding.dart';
import '../modules/admin_return_conformation/views/admin_return_conformation_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/location/bindings/location_binding.dart';
import '../modules/location/views/location_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/parties_categories/bindings/parties_categories_binding.dart';
import '../modules/parties_categories/views/parties_categories_view.dart';
import '../modules/parties_info/bindings/parties_info_binding.dart';
import '../modules/parties_info/views/parties_info_view.dart';
import '../modules/parties_navBar/bindings/parties_nav_bar_binding.dart';
import '../modules/parties_navBar/views/parties_nav_bar_view.dart';
import '../modules/parties_order/bindings/parties_order_binding.dart';
import '../modules/parties_order/views/parties_order_view.dart';
import '../modules/parties_order_history/bindings/parties_order_history_binding.dart';
import '../modules/parties_order_history/views/parties_order_history_view.dart';
import '../modules/parties_user_profile/bindings/parties_user_profile_binding.dart';
import '../modules/parties_user_profile/views/parties_user_profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/user_attendance/bindings/user_attendance_binding.dart';
import '../modules/user_attendance/views/user_attendance_view.dart';
import '../modules/user_dashboard/bindings/user_dashboard_binding.dart';
import '../modules/user_dashboard/views/user_dashboard_view.dart';
import '../modules/user_info/bindings/user_info_binding.dart';
import '../modules/user_info/views/user_info_view.dart';
import '../modules/user_leave/bindings/user_leave_binding.dart';
import '../modules/user_leave/views/user_leave_view.dart';
import '../modules/user_order/bindings/user_order_binding.dart';
import '../modules/user_order/views/user_order_view.dart';
import '../modules/user_order_history/bindings/user_order_history_binding.dart';
import '../modules/user_order_history/views/user_order_history_view.dart';
import '../modules/user_return/bindings/user_return_binding.dart';
import '../modules/user_return/views/user_return_view.dart';
import '../modules/user_visit/bindings/user_visit_binding.dart';
import '../modules/user_visit/views/user_visit_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION,
      page: () => const LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: _Paths.PARTIES_ORDER,
      page: () => const PartiesOrderView(),
      binding: PartiesOrderBinding(),
    ),
    GetPage(
      name: _Paths.PARTIES_ORDER_HISTORY,
      page: () => PartiesOrderHistoryView(
        partyName: '',
      ),
      binding: PartiesOrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PARTIES_USER_PROFILE,
      page: () => const PartiesUserProfileView(),
      binding: PartiesUserProfileBinding(),
    ),
    GetPage(
      name: _Paths.PARTIES_NAV_BAR,
      page: () => PartiesNavBarView(),
      binding: PartiesNavBarBinding(),
    ),
    GetPage(
      name: _Paths.PARTIES_CATEGORIES,
      page: () => PartiesCategoriesView(),
      binding: PartiesCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.USER_ATTENDANCE,
      page: () => UserAttendanceView(),
      binding: UserAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.USER_LEAVE,
      page: () => const UserLeaveView(),
      binding: UserLeaveBinding(),
    ),
    GetPage(
      name: _Paths.USER_ORDER,
      page: () => UserOrderView(),
      binding: UserOrderBinding(),
    ),
    GetPage(
      name: _Paths.PARTIES_INFO,
      page: () => PartiesInfoView(),
      binding: PartiesInfoBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PARTIES,
      page: () => AddPartiesView(),
      binding: AddPartiesBinding(),
    ),
    GetPage(
      name: _Paths.USER_DASHBOARD,
      page: () => UserDashboardView(),
      binding: UserDashboardBinding(),
    ),
    GetPage(
      name: _Paths.USER_VISIT,
      page: () => UserVisitView(),
      binding: UserVisitBinding(),
    ),
    GetPage(
      name: _Paths.USER_RETURN,
      page: () => UserReturnView(),
      binding: UserReturnBinding(),
    ),
    GetPage(
      name: _Paths.USER_ORDER_HISTORY,
      page: () => UserOrderHistoryView(),
      binding: UserOrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ADDPRODUCT,
      page: () => AdminProductView(),
      binding: AdminAddproductBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_LEAVE_CONFORMATION,
      page: () => AdminLeaveConformationView(),
      binding: AdminLeaveConformationBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_RETURN_CONFORMATION,
      page: () => AdminReturnConformationView(),
      binding: AdminReturnConformationBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ATTENDANCE_MONITOR,
      page: () => const AdminAttendanceMonitorView(),
      binding: AdminAttendanceMonitorBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ORDER_MONITOR,
      page: () => AdminOrderMonitorView(),
      binding: AdminOrderMonitorBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_CATEGORY,
      page: () => const AdminCategoryView(),
      binding: AdminCategoryBinding(),
    ),
  ];
}
