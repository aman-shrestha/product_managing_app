import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/modules/admin_order_monitor/views/admin_order_monitor_tabs.dart';

import '../../../constants/colors.dart';

class AdminOrderMonitorTabBar extends StatelessWidget {
  const AdminOrderMonitorTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Column(
        children: [
          const TabBar(
            indicator: null,
            indicatorColor: Colors
                .transparent, // Custom color for the selected tab indicator
            // Padding around the indicator
            labelColor:
                AppColors.lightBlue, // Color for the selected tab's text

            unselectedLabelColor:
                Colors.grey, // Color for unselected tab's text

            // unselectedLabelStyle: TextStyle(
            //   // Style for unselected tab's text
            //   fontWeight: FontWeight.normal,
            //   fontSize: 14,
            // ),
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Today",
              ),
              Tab(
                text: "Yesterday",
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height - 350,
            child: const TabBarView(
              children: [
                AdminOrderMonitorTabs(),
                AdminOrderMonitorTabs(),
                AdminOrderMonitorTabs(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
