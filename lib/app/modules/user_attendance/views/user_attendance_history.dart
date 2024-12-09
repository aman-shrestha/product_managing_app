import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/user_attendance/controllers/user_attendance_controller.dart';

class UserAttendanceHistory extends StatelessWidget {
  final userAttendance = Get.put(UserAttendanceController());
  UserAttendanceHistory({super.key});

  final List<Map<String, String>> attendanceData = [
    {
      'date': '2024-12-01',
      'status': 'Present',
      'checkIn': '09:00 AM',
      'checkOut': '05:00 PM',
      'duration': '8h 0m',
    },
    {
      'date': '2024-12-02',
      'status': 'Late',
      'checkIn': '09:15 AM',
      'checkOut': '05:30 PM',
      'duration': '8h 15m',
    },
    {
      'date': '2024-12-03',
      'checkIn': '-',
      'checkOut': '-',
      'duration': '-',
      'status': 'Absent',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Attendance History'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("From:"),
                    Text("To:"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(3000),
                        );

                        if (picked != null) {
                          // Update the selected date in the controller
                          userAttendance.selectedDateFrom.value = picked;
                        }
                      },
                      child: Obx(() {
                        // Use Obx to reactively update the Text widget when the selected date changes
                        return Text(
                          userAttendance.selectedDateFrom.value == null
                              ? "Select Date"
                              : "${userAttendance.selectedDateFrom.value!.toLocal()}"
                                  .split(' ')[0],
                        );
                      }),
                    ),
                    const Spacer(),
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(3000),
                        );

                        if (picked != null) {
                          // Update the selected date in the controller
                          userAttendance.selectedDateTo.value = picked;
                        }
                      },
                      child: Obx(() {
                        // Use Obx to reactively update the Text widget when the selected date changes
                        return Text(
                          userAttendance.selectedDateTo.value == null
                              ? "Select Date"
                              : "${userAttendance.selectedDateTo.value!.toLocal()}"
                                  .split(' ')[0],
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Check-In Time')),
                  DataColumn(label: Text('Check-Out Time')),
                  DataColumn(label: Text('Duration')),
                ],
                rows: attendanceData
                    .map(
                      (data) => DataRow(
                        cells: [
                          DataCell(Text(data['date']!)),
                          DataCell(Text(data['status']!)),
                          DataCell(Text(data['checkIn']!)),
                          DataCell(Text(data['checkOut']!)),
                          DataCell(Text(data['duration']!)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
