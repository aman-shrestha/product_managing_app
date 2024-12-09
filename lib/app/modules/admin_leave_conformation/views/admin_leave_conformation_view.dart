import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/data/admin_leave_confirmation_data.dart';
import 'package:product_ordering_app/app/modules/admin_leave_conformation/views/admin_leave_conformation_detail.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/small_button_reusable.dart';
import '../controllers/admin_leave_conformation_controller.dart';

class AdminLeaveConformationView
    extends GetView<AdminLeaveConformationController> {
  final searchInvoice = TextEditingController();
  final searchResult = [].obs;
  AdminLeaveConformationView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = adminLeaveConfirmationData
            .where((element) => element['user_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
      }
    }

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Leave confirmation'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: searchInvoice,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Search  ...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  onChanged: (value) => searchQuery(value),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => searchResult.isEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: adminLeaveConfirmationData.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(AdminLeaveConformationDetail());
                              },
                              child: LeaveRequestCard(
                                staffName: adminLeaveConfirmationData[index]
                                    ["user_name"],
                                leaveReason: adminLeaveConfirmationData[index]
                                    ["Reason"],
                                dateFrom: adminLeaveConfirmationData[index]
                                    ["DateFrom"],
                                status: adminLeaveConfirmationData[index]
                                    ["status"],
                                dateTo: adminLeaveConfirmationData[index]
                                    ["Dateto"],
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(AdminLeaveConformationDetail());
                              },
                              child: LeaveRequestCard(
                                staffName: searchResult[index]["user_name"],
                                leaveReason: searchResult[index]["Reason"],
                                dateFrom: searchResult[index]["DateFrom"],
                                status: searchResult[index]["status"],
                                dateTo: searchResult[index]["Dateto"],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
        // ListView(
        //   padding: EdgeInsets.all(8.0),
        //   children: [
        //     LeaveRequestCard(
        //       staffName: "John Doe",
        //       leaveReason: "Family Emergency",
        //       date: "2024-12-01",
        //       status: "Pending",
        //     ),
        //     LeaveRequestCard(
        //       staffName: "Jane Smith",
        //       leaveReason: "Vacation",
        //       date: "2024-12-05",
        //       status: "Pending",
        //     ),
        //     LeaveRequestCard(
        //       staffName: "Robert Johnson",
        //       leaveReason: "Medical Appointment",
        //       date: "2024-12-08",
        //       status: "Pending",
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class LeaveRequestCard extends StatelessWidget {
  final String staffName;
  final String leaveReason;
  final String dateFrom;
  final String dateTo;
  final String status;

  const LeaveRequestCard({
    super.key,
    required this.staffName,
    required this.leaveReason,
    required this.dateFrom,
    required this.status,
    required this.dateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: AppColors.lightSilver,
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              staffName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Reason: $leaveReason",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "From: $dateFrom",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "To: $dateTo",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Status: $status",
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButtonReusable(
                  color: AppColors.green,
                  borderColor: Colors.transparent,
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  title: "Approve",
                  width: 155,
                ),
                SizedBox(width: 8),
                SmallButtonReusable(
                  borderColor: Colors.transparent,
                  color: AppColors.red,
                  textColor: Colors.white,
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  title: "Decline",
                  width: 155,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
