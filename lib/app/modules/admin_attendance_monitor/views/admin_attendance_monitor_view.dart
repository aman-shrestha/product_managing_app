import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/modules/admin_attendance_monitor/views/admin_attendance_search.dart';
import '../controllers/admin_attendance_monitor_controller.dart';

class AdminAttendanceMonitorView
    extends GetView<AdminAttendanceMonitorController> {
  const AdminAttendanceMonitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('User Attendance'),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AdminAttendanceSearch(),
                  // const TabBar(
                  //   indicator: null,
                  //   indicatorColor: Colors
                  //       .transparent, // Custom color for the selected tab indicator
                  //   // Padding around the indicator
                  //   labelColor: AppColors
                  //       .lightBlue, // Color for the selected tab's text

                  //   unselectedLabelColor:
                  //       Colors.grey, // Color for unselected tab's text

                  //   // unselectedLabelStyle: TextStyle(
                  //   //   // Style for unselected tab's text
                  //   //   fontWeight: FontWeight.normal,
                  //   //   fontSize: 14,
                  //   // ),
                  //   tabs: [
                  //     Tab(
                  //       text: "Present",
                  //     ),
                  //     Tab(
                  //       text: "Late",
                  //     ),
                  //     Tab(
                  //       text: "Absent",
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height - 300,
                  //   child: const TabBarView(
                  //     children: [
                  //       AdminAttendanceMonitorListView(),
                  //       AdminAttendanceMonitorListView(),
                  //       AdminAttendanceMonitorListView(),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
