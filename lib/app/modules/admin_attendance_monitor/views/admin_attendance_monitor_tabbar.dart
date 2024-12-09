import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import 'admin_attendance_monitor_listview.dart';

class AdminAttendanceMonitorTabBar extends StatelessWidget {
  const AdminAttendanceMonitorTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: SingleChildScrollView(
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
                  text: "Present",
                ),
                Tab(
                  text: "Late",
                ),
                Tab(
                  text: "Absent",
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: const TabBarView(
                children: [
                  AdminAttendanceMonitorListView(),
                  AdminAttendanceMonitorListView(),
                  AdminAttendanceMonitorListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
