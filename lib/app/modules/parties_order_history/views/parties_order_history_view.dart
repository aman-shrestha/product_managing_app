import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/user_order_history/views/user_order_history_detail.dart';
import '../controllers/parties_order_history_controller.dart';

class PartiesOrderHistoryView extends GetView<PartiesOrderHistoryController> {
  final String partyName;
  final List orderId = [
    "#123Abc",
    '#456def',
    '#789ghi',
    '#101jkl',
  ];
  final List date = [
    '2024/11/24',
    '2024/10/20',
    '2024/9/11',
    '2024/8/30',
  ];
  final List price = [
    '2,000',
    '3,000',
    '4,000',
    '5,000',
  ];
  final List items = [
    '4',
    '4',
    '4',
    '4',
  ];
  final List img = [
    "assets/img/rice&noodles1_1.png",
    "assets/img/rice&noodles2_1.jpg",
    "assets/img/snacks1_1.png",
    "assets/img/snacks2_1.png",
  ];

  PartiesOrderHistoryView({required this.partyName, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '$partyName Order History',
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: orderId.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  UserOrderHistoryDetail(),
                  // PartiesOrderHistoryDetail(
                  //   orderID: orderId[index],
                  //   estimatedTime: "26 Spet 2024",
                  //   title: "Product A",
                  //   price: price[index],
                  //   img: img[index],
                  //   quantity: '1',
                  //   orderDate: '30 Oct 2024',
                  // ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderId[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            date[index],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items: ${items[index]}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Total Price: \$${price[index]}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "View More",
                        style: smallStyle.copyWith(
                          color: AppColors.lightBlue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
