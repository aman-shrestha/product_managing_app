// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/user_return/views/user_return_view_status.dart';
import '../../../constants/style.dart';
import '../../../data/parties_users.dart';
import '../controllers/user_return_controller.dart';
import 'user_return_items_container.dart';

class UserReturnView extends GetView<UserReturnController> {
  final searchParties = TextEditingController();
  final productController = TextEditingController();
  final searchResult = [].obs; // For recipient search results
  var items = [].obs; // List to track added items
  UserReturnView({super.key});
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

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Return Order'),
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.white,
                  context: context,
                  showDragHandle: true,
                  builder: (BuildContext context) {
                    return const UserReturnViewStatus();
                  },
                );
              },
              child: Text(
                "View Status",
                style: smallStyle.copyWith(color: Colors.blue),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Recipient",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: searchParties,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightSilver,
                    border: const OutlineInputBorder(),
                    hintText: "Search Parties...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  onChanged: (value) => searchQuery(value),
                ),
                Obx(() => searchResult.isNotEmpty
                    ? Container(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                searchParties.text =
                                    searchResult[index]["Parties_name"];
                                searchResult.value = [];
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person,
                                        color: Colors.blueAccent),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        searchResult[index]["Parties_name"],
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox()),
                const SizedBox(height: 20),
                Obx(
                  () => Column(
                    children: items.map((item) {
                      return UserReturnItemsContainer(
                        items: item,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    items.add({
                      'productController': TextEditingController(),
                      'quantityController': TextEditingController(),
                      'remarksController': TextEditingController(),
                      'searchResult': [].obs,
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Add Items",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const LargeButtonReusable(title: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
