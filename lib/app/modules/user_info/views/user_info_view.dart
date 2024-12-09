import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/data/user_info.dart';
import 'package:product_ordering_app/app/modules/add_parties_user/views/add_user_view.dart';
import 'package:product_ordering_app/app/modules/add_parties_user/views/edit_user_view.dart';
import 'package:product_ordering_app/app/modules/user_info/views/user_info_static_listview.dart';
import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../parties_order_history/views/parties_order_history_view.dart';
import '../controllers/user_info_controller.dart';

class UserInfoView extends GetView<UserInfoController> {
  final searchParties = TextEditingController();
  final searchResult = [].obs; // For recipient search results
  void searchQuery(String query) {
    if (query.isEmpty) {
      searchResult.value = [];
    } else {
      // Filter data based on search query
      List filteredData = userInfo
          .where((element) =>
              element['user_name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      searchResult.value = filteredData;
    }
  }

  UserInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('User Info'),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              // Get.to(AddPartiesView());
              Get.to(AddUser());
            },
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  "Add User",
                  style: smallStyle.copyWith(color: Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: searchParties,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Search User...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                ),
                onChanged: (value) => searchQuery(value),
              ),
              Obx(() => searchResult.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        final party = searchResult[index];
                        final location = party["user_location"][0];
                        return GestureDetector(
                          onTap: () {
                            Get.to(PartiesOrderHistoryView(
                              partyName: party["user_name"],
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.lightSilver,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.showSnackbar(const GetSnackBar(
                                            title: "Delete Successfully",
                                            message: 'Successfully Deleted',
                                            icon: Icon(Icons.delete),
                                            duration: Duration(seconds: 3),
                                            backgroundColor: AppColors.red,
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.delete,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "Delete",
                                              style: smallStyle.copyWith(
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.to(EditPartiesView());
                                          Get.to(EditUser());
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.blue,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "Edit",
                                              style: smallStyle.copyWith(
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    party["user_name"],
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.phone, size: 16),
                                      const SizedBox(width: 8.0),
                                      Text(party["user_number"]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.email, size: 16),
                                      const SizedBox(width: 8.0),
                                      Text(party["user_email"]),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "Position:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${party["position"]}",
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "VAT/PAN:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${party["user_VAT"]}",
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "Location:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${location['town']}, ${location['District']}, ${location['State']}, ${location['Country']}",
                                  ),
                                  Text(
                                    "View Order",
                                    style:
                                        smallStyle.copyWith(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const UserInfoStaticListView()),
            ],
          ),
        ),
      ),
    );
  }
}
