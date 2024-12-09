import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../../data/user_info.dart';
import 'admin_attendance_monitor_listview.dart';
import 'admin_attendance_monitor_tabbar.dart';

class AdminAttendanceSearch extends StatelessWidget {
  final searchUser = TextEditingController();
  final searchResult = [].obs;
  AdminAttendanceSearch({super.key});

  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = userInfo
            .where((element) => element['user_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
      }
    }

    return Column(
      children: [
        TextField(
          controller: searchUser,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Search ...",
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          ),
          onChanged: (value) => searchQuery(value),
        ),
        Obx(
          () => searchResult.isNotEmpty
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    // final user = userInfo[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          AdminAttendanceDetailsTable(
                            attendanceTableData: searchResult[0]["attendance"],
                            title: searchResult[0]["user_name"],
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                                searchResult[0]["user_name"][0].toUpperCase()),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(searchResult[0]["user_name"]),
                              Text(
                                "View",
                                style: smallStyle.copyWith(
                                    color: AppColors.lightBlue),
                              ),
                            ],
                          ),
                          subtitle: Text(
                              "${searchResult[0]["position"]} (${searchResult[0]["attendance"][0]["check_in"]})"),
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
                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 16),
                    //   child: ExpansionTile(
                    //     leading: CircleAvatar(
                    //       child: Text(
                    //           searchResult[0]["user_name"][0].toUpperCase()),
                    //     ),
                    //     title: Text(searchResult[0]["user_name"]),
                    //     subtitle: Text(searchResult[0]["position"]),
                    //     children: [
                    //       SingleChildScrollView(
                    //         scrollDirection: Axis.horizontal,
                    //         child: DataTable(
                    //           columns: const [
                    //             DataColumn(label: Text('Date')),
                    //             DataColumn(label: Text('Status')),
                    //             DataColumn(label: Text('Check-In')),
                    //             DataColumn(label: Text('Check-Out')),
                    //             DataColumn(label: Text('Duration')),
                    //           ],
                    //           rows: (searchResult[0]["attendance"] as List)
                    //               .map(
                    //                 (att) => DataRow(
                    //                   cells: [
                    //                     DataCell(Text(att["date"])),
                    //                     DataCell(Text(att["status"])),
                    //                     DataCell(Text(att["check_in"])),
                    //                     DataCell(Text(att["check_out"])),
                    //                     DataCell(Text(att["duration"])),
                    //                   ],
                    //                 ),
                    //               )
                    //               .toList(),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Text(
                    //           "Location: ${searchResult[0]["user_location"][0]["town"]}, ${searchResult[0]["user_location"][0]["District"]}, ${searchResult[0]["user_location"][0]["State"]}, ${searchResult[0]["user_location"][0]["Country"]}",
                    //           style: const TextStyle(color: Colors.grey),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                )
              : const AdminAttendanceMonitorTabBar(),
        )
      ],
    );
  }
}
