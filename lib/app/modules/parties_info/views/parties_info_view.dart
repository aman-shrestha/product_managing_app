import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/add_parties_user/views/add_parties_view.dart';
import 'package:product_ordering_app/app/modules/add_parties_user/views/edit_parties_view.dart';
import 'package:product_ordering_app/app/modules/parties_info/views/parties_info_static_listview.dart';
import '../../../data/parties_users.dart';
import '../../parties_order_history/views/parties_order_history_view.dart';
import '../controllers/parties_info_controller.dart';

class PartiesInfoView extends GetView<PartiesInfoController> {
  final searchParties = TextEditingController();
  final searchResult = [].obs; // For recipient search results
  PartiesInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = partiesUsers
            .where((element) => element['Parties_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Parties Info'),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(AddPartiesView());
            },
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  "Add Parties",
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
                  hintText: "Search Parties...",
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
                        final location = party["Parties_location"][0];
                        return GestureDetector(
                          onTap: () {
                            Get.to(PartiesOrderHistoryView(
                              partyName: party["Parties_name"],
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
                                          Get.to(EditPartiesView());
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
                                    party["Parties_name"],
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
                                      Text(party["Parties_number"]),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.email, size: 16),
                                      const SizedBox(width: 8.0),
                                      Text(party["Parties_email"]),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "VAT/PAN:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${party["Parties_VAT"]}",
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
                  : const PartiesInfoStaticListView()),
            ],
          ),
        ),
      ),
    );
  }
}

class PartiesInfoReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const PartiesInfoReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lightSilver,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: smallStyle.copyWith(color: AppColors.silver),
            ),
            Text(
              subtitle,
              style: smallStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
