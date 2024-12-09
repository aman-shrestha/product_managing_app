import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/data/user_info.dart';

import '../../constants/style.dart';

class UserSearchReusable extends StatelessWidget {
  final searchParties = TextEditingController();
  final searchResult = [].obs;
  UserSearchReusable({super.key});

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
          controller: searchParties,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Search ...",
            prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
          ),
          onChanged: (value) => searchQuery(value),
        ),
        Obx(
          () => searchResult.isNotEmpty
              ? Container(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: searchResult.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //LOGIC FOR ADDING MULTIPLE USER
                          // createOrder.partiesList.add(
                          //   {
                          //     "Parties_id": searchResult[index]["Parties_id"],
                          //     "Parties_name": searchResult[index]
                          //         ["Parties_name"],
                          //     "Parties_location": searchResult[index]
                          //         ["Parties_location"]
                          //   },
                          // );

                          searchParties.text = searchResult[index]["user_name"];
                          searchResult.value = [];
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.person,
                                      color: Colors.blueAccent),
                                  const SizedBox(width: 10),
                                  Text('${searchResult[index]["user_name"]} ',
                                      style: smallStyle),
                                  const Spacer(),
                                  Text(searchResult[index]["user_id"],
                                      style: smallStyle.copyWith(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      color: Colors.green),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      '${searchResult[index]["user_location"][0]["State"]},'
                                      '${searchResult[index]["user_location"][0]["District"]},'
                                      '${searchResult[index]["user_location"][0]["town"]}',
                                      style: miniStyle.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
