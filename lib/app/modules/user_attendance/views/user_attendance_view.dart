// ignore_for_file: must_be_immutable

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/location/views/map_display.dart';
import 'package:product_ordering_app/app/modules/user_attendance/views/user_attendance_history.dart';
import '../controllers/user_attendance_controller.dart';

class UserAttendanceView extends GetView<UserAttendanceController> {
  // dynamic currentTime = DateFormat.jm().format(DateTime.now());
  final userAttendance = Get.put(UserAttendanceController());
  double lati = 1.2878;
  double long = 103.8666;

  UserAttendanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Attendance'),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
              onTap: () {
                Get.to(UserAttendanceHistory());
              },
              child: const Icon(Icons.history)),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        userAttendance.attendanceIndex.value = 0;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: userAttendance.attendanceIndex.value == 0
                              ? AppColors.green
                              : AppColors.lightSilver,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.login,
                                    color:
                                        userAttendance.attendanceIndex.value ==
                                                0
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Check IN",
                                    style: smallStyle.copyWith(
                                      color: userAttendance
                                                  .attendanceIndex.value ==
                                              0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "10:00 AM",
                                style: smallStyle.copyWith(
                                  color:
                                      userAttendance.attendanceIndex.value == 0
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        userAttendance.attendanceIndex.value = 1;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: userAttendance.attendanceIndex.value == 1
                              ? AppColors.green
                              : AppColors.lightSilver,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color:
                                        userAttendance.attendanceIndex.value ==
                                                1
                                            ? Colors.white
                                            : Colors.black,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Check Out",
                                    style: smallStyle.copyWith(
                                      color: userAttendance
                                                  .attendanceIndex.value ==
                                              1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "6:00 PM",
                                style: smallStyle.copyWith(
                                  color:
                                      userAttendance.attendanceIndex.value == 1
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const UserAttendanceReusableRow(
                title: "Date:",
                subtitle: "November 21, 2024",
              ),
              const UserAttendanceReusableRow(
                title: "Duration:",
                subtitle: "8 Hours",
              ),
              Text(
                "Location",
                style: smallStyle.copyWith(color: AppColors.silver),
              ),
              const SizedBox(height: 10),
              // LocationView(),
              // const LocationPage(),
              MapDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

class UserAttendanceReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserAttendanceReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: smallStyle.copyWith(
            color: AppColors.silver,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: smallStyle.copyWith(
              // color: AppColors.textBlue,
              ),
        ),
        const SizedBox(height: 10),
        const DottedLine(
          lineThickness: 5,
          dashColor: AppColors.lightSilver,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
