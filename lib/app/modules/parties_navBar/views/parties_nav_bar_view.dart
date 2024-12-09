import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/parties_categories/views/parties_categories_view.dart';
import 'package:product_ordering_app/app/modules/user_dashboard/views/user_dashboard_view.dart';
import 'package:product_ordering_app/app/modules/user_order_history/views/user_order_history_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors.dart';
import '../../parties_user_profile/views/parties_user_profile_view.dart';
import '../../user_order/views/create_order.dart';
import '../controllers/parties_nav_bar_controller.dart';

class PartiesNavBarView extends GetView<PartiesNavBarController> {
  final controllerBottomNav = Get.put(PartiesNavBarController());
  PartiesNavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      home: Scaffold(
        body: Obx(
          () => changeView(),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(20),
            //   topRight: Radius.circular(20),
            // ),
            // border: Border.all(color: Colors.grey),
            color: AppColors.bottomNavBg,
          ),

          // color: AppColors.lightBlue,
          height: Adaptive.h(11),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controllerBottomNav.count.value = 0;
                  },
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,

                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 2,
                        width: 60,
                        color: controllerBottomNav.count.value == 0
                            ? AppColors.appbarHighlight
                            : AppColors.appbarBg,
                      ),
                      const SizedBox(height: 14),
                      Icon(Icons.home,
                          color: controllerBottomNav.count.value == 0
                              ? AppColors.primaryColor
                              : Colors.white),
                      // const SizedBox(height: 5),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            fontSize: 12,
                            color: controllerBottomNav.count.value == 0
                                ? AppColors.primaryColor
                                : Colors.white),
                      ),
                      // SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(width: 1),
                GestureDetector(
                  onTap: () {
                    controllerBottomNav.count.value = 1;
                  },
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 60,
                        color: controllerBottomNav.count.value == 1
                            ? AppColors.appbarHighlight
                            : AppColors.appbarBg,
                      ),
                      const SizedBox(height: 14),
                      Icon(Icons.category,
                          color: controllerBottomNav.count.value == 1
                              ? AppColors.primaryColor
                              : Colors.white),
                      // const SizedBox(height: 5),
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 12,
                            color: controllerBottomNav.count.value == 1
                                ? AppColors.primaryColor
                                : Colors.white),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controllerBottomNav.count.value = 2;
                  },
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 60,
                        color: controllerBottomNav.count.value == 2
                            ? AppColors.appbarHighlight
                            : AppColors.appbarBg,
                      ),
                      const SizedBox(height: 14),
                      Icon(Icons.category,
                          color: controllerBottomNav.count.value == 2
                              ? AppColors.primaryColor
                              : Colors.white),
                      // const SizedBox(height: 5),
                      Text(
                        "Order",
                        style: TextStyle(
                            fontSize: 12,
                            color: controllerBottomNav.count.value == 2
                                ? AppColors.primaryColor
                                : Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 1),
                GestureDetector(
                  onTap: () {
                    controllerBottomNav.count.value = 3;
                  },
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 60,
                        color: controllerBottomNav.count.value == 3
                            ? AppColors.appbarHighlight
                            : AppColors.appbarBg,
                      ),
                      const SizedBox(height: 14),
                      Icon(Icons.history,
                          color: controllerBottomNav.count.value == 3
                              ? AppColors.primaryColor
                              : Colors.white),
                      // const SizedBox(height: 5),
                      Text(
                        "Order History",
                        style: TextStyle(
                            fontSize: 12,
                            color: controllerBottomNav.count.value == 3
                                ? AppColors.primaryColor
                                : Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 1),
                //       GestureDetector(
                //         onTap: () {
                //           controllerBottomNav.count.value = 4;
                //         },
                //         child: Column(
                //           // mainAxisSize: MainAxisSize.min,
                //           // mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               height: 2,
                //               width: 60,
                //               color: controllerBottomNav.count.value == 4
                //                   ? AppColors.appbarHighlight
                //                   : AppColors.appbarBg,
                //             ),
                //             const SizedBox(height: 14),
                //             Icon(Icons.person_outlined,
                //                 color: controllerBottomNav.count.value == 4
                //                     ? AppColors.primaryColor
                //                     : Colors.white),
                //             // const SizedBox(height: 5),
                //             Text(
                //               "Me",
                //               style: TextStyle(
                //                   fontSize: 12,
                //                   color: controllerBottomNav.count.value == 4
                //                       ? AppColors.primaryColor
                //                       : Colors.white),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // )
                // ListView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                //   scrollDirection: Axis.horizontal,
                //   shrinkWrap: true,
                //   itemCount: title.length,
                //   itemBuilder: (BuildContext context, index) => Container(
                //     margin: EdgeInsets.only(right: 40),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Icon(icon[index]),
                //         Text(title[index]),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeView() {
    if (controllerBottomNav.count.value == 0) {
      return UserDashboardView();
    } else if (controllerBottomNav.count.value == 1) {
      return PartiesCategoriesView();
    } else if (controllerBottomNav.count.value == 2) {
      return CreateOrder();
    } else if (controllerBottomNav.count.value == 3) {
      return UserOrderHistoryView();
    } else {
      return const PartiesUserProfileView();
    }
  }
}
