import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/data/admin_order_monitor_data.dart';
import 'package:product_ordering_app/app/modules/admin_order_monitor/views/admin_order_monitor_tabbar.dart';
import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../user_order_history/views/user_order_history_detail.dart';
import '../controllers/admin_order_monitor_controller.dart';

class AdminOrderMonitorView extends GetView<AdminOrderMonitorController> {
  final searchOrder = TextEditingController();
  final searchResult = [].obs;
  AdminOrderMonitorView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = adminOrderMonitor
            .where((element) =>
                element['order_id'].toLowerCase().contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
      }
    }

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Order Monitor'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: searchOrder,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Search Order",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  onChanged: (value) => searchQuery(value),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => searchResult.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  UserOrderHistoryDetail(),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.lightSilver,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            searchResult[index]["order_id"],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            searchResult[index]["date"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Items: ${searchResult[index]["items"]}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'Total Price: ${searchResult[index]["total_price"]}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "View More",
                                            style: smallStyle.copyWith(
                                              color: AppColors.lightBlue,
                                            ),
                                          ),
                                          Text(
                                            "Status: ${searchResult[index]["status"]}",
                                            style: smallStyle.copyWith(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const AdminOrderMonitorTabBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
