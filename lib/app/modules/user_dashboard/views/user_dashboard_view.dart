import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/modules/admin_attendance_monitor/views/admin_attendance_monitor_view.dart';
import 'package:product_ordering_app/app/modules/admin_category/views/admin_category_view.dart';
import 'package:product_ordering_app/app/modules/admin_leave_conformation/views/admin_leave_conformation_view.dart';
import 'package:product_ordering_app/app/modules/admin_order_monitor/views/admin_order_monitor_view.dart';
import 'package:product_ordering_app/app/modules/admin_product/views/admin_product_view.dart';
import 'package:product_ordering_app/app/modules/admin_return_conformation/views/admin_return_conformation_view.dart';
import 'package:product_ordering_app/app/modules/parties_order_history/views/parties_order_history_view.dart';
import 'package:product_ordering_app/app/modules/user_attendance/views/user_attendance_view.dart';
import 'package:product_ordering_app/app/modules/user_info/views/user_info_view.dart';
import 'package:product_ordering_app/app/modules/user_leave/views/user_leave_view.dart';
import 'package:product_ordering_app/app/modules/user_order/views/create_order.dart';
import 'package:product_ordering_app/app/modules/user_return/views/user_return_view.dart';
import 'package:product_ordering_app/app/modules/user_visit/views/user_visit_view.dart';

import '../../parties_info/views/parties_info_view.dart';
import '../../reusable_widgets/user_info_container.dart';
import '../controllers/user_dashboard_controller.dart';

// ignore: must_be_immutable
class UserDashboardView extends GetView<UserDashboardController> {
  List<IconData> icon = [
    Icons.person,
    Icons.calendar_month,
    Icons.shopping_basket,
    Icons.location_on,
    Icons.directions_walk,
    Icons.keyboard_return,
    Icons.shopping_cart,
    Icons.directions_walk,
    Icons.keyboard_return,
    Icons.person,
    Icons.calendar_month,
    Icons.shopping_basket,
    Icons.category,
  ];
  final List title = [
    "Parties Info",
    "Attendance",
    "Order",
    "Visit",
    "Leave",
    "Return",
    "Products",
    "Leave Conformation",
    "Return Conformation",
    "User Info",
    "Attendance Monitor",
    "Order Monitor",
    "Category",
  ];
  final List<Widget> screens = [
    PartiesInfoView(),
    UserAttendanceView(),
    // UserOrderView(),
    CreateOrder(),
    UserVisitView(),
    const UserLeaveView(),
    UserReturnView(),
    AdminProductView(),
    AdminLeaveConformationView(),
    AdminReturnConformationView(),
    UserInfoView(),
    const AdminAttendanceMonitorView(),
    AdminOrderMonitorView(),
    const AdminCategoryView(),
  ];
  UserDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
            onTap: () {
              Get.to(PartiesOrderHistoryView(
                partyName: '',
              ));
            },
            child: const Text('Hi Aman ')),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              const UserInfoContainer(),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: AppColors.lightSilver,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: title.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5),
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(screens[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.lightSilver,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icon[index],
                                size: 40,
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Text(
                                  title[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
