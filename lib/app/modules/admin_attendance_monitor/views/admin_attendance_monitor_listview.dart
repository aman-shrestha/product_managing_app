import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';

import '../../../data/user_info.dart';

class AdminAttendanceMonitorListView extends StatelessWidget {
  const AdminAttendanceMonitorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: userInfo.length,
      itemBuilder: (context, index) {
        final user = userInfo[index];
        return GestureDetector(
          onTap: () {
            Get.to(
              AdminAttendanceDetailsTable(
                attendanceTableData: user["attendance"],
                title: user["user_name"],
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(user["user_name"][0].toUpperCase()),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(user["user_name"]),
                  Text(
                    "View",
                    style: smallStyle.copyWith(color: AppColors.lightBlue),
                  )
                ],
              ),
              subtitle: Text(
                  "${user["position"]} (${user["attendance"][0]["check_in"]})"),
              // children: [
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: DataTable(
              //     columns: const [
              //       DataColumn(label: Text('Date')),
              //       DataColumn(label: Text('Status')),
              //       DataColumn(label: Text('Check-In')),
              //       DataColumn(label: Text('Check-Out')),
              //       DataColumn(label: Text('Duration')),
              //     ],
              //     rows: (user["attendance"] as List)
              //         .map(
              //           (att) => DataRow(
              //             cells: [
              //               DataCell(Text(att["date"])),
              //               DataCell(Text(att["status"])),
              //               DataCell(Text(att["check_in"])),
              //               DataCell(Text(att["check_out"])),
              //               DataCell(Text(att["duration"])),
              //             ],
              //           ),
              //         )
              //         .toList(),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     "Location: ${user["user_location"][0]["town"]}, ${user["user_location"][0]["District"]}, ${user["user_location"][0]["State"]}, ${user["user_location"][0]["Country"]}",
              //     style: const TextStyle(color: Colors.grey),
              //   ),
              // ),
              // ],
            ),
          ),
        );
      },
    );
  }
}

class AdminAttendanceDetailsTable extends StatelessWidget {
  final String title;
  final List attendanceTableData;
  const AdminAttendanceDetailsTable(
      {super.key, required this.attendanceTableData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("$title Attendance"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Check-In')),
                  DataColumn(label: Text('Check-Out')),
                  DataColumn(label: Text('Duration')),
                ],
                rows: attendanceTableData
                    .map(
                      (att) => DataRow(
                        cells: [
                          DataCell(Text(att["date"])),
                          DataCell(Text(att["status"])),
                          DataCell(Text(att["check_in"])),
                          DataCell(Text(att["check_out"])),
                          DataCell(Text(att["duration"])),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
