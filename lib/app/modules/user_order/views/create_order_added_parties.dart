import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/style.dart';
import '../controllers/user_order_controller.dart';

//NOT BEING USED CURRENTLY
class CreateOrderAddedParties extends StatelessWidget {
  final userOrder = Get.put(UserOrderController());
  CreateOrderAddedParties({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: userOrder.partiesList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //   createOrder.partiesList.add(
                //     {
                //       "Parties_id": searchResult[index]["Parties_id"],
                //       "Parties_name": searchResult[index]["Parties_name"],
                //     },
                //   );
                //   print(createOrder.partiesList);
                //   // searchParties.text =
                //   //     searchResult[index]["Parties_name"];
                //   searchResult.value = [];
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text('${userOrder.partiesList[index]["Parties_name"]} ',
                            style: smallStyle),
                        const Spacer(),
                        Text(userOrder.partiesList[index]["Parties_id"],
                            style: smallStyle.copyWith(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.green),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${userOrder.partiesList[index]["Parties_location"][0]["State"]},'
                            '${userOrder.partiesList[index]["Parties_location"][0]["District"]},'
                            '${userOrder.partiesList[index]["Parties_location"][0]["town"]}',
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
      ),
    );
  }
}
