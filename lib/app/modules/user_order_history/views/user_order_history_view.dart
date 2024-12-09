import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/small_button_reusable.dart';
import 'package:product_ordering_app/app/modules/user_order_history/views/user_order_history_detail.dart';

import '../controllers/user_order_history_controller.dart';

class UserOrderHistoryView extends GetView<UserOrderHistoryController> {
  final List orderId = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final List status = [
    'Delivered',
    'Pending',
    'Cancelled',
    'Delivered',
    'Pending',
  ];
  final List payment = [
    'Card',
    'Cash',
    'Paypal',
    'Card',
    'Cash',
  ];
  final List items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final List partyId = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final List partyName = [
    'RamRamRamRamRamRam',
    'Hari',
    'Shyam',
    'Krishna',
    'Aman',
  ];
  final List orderDate = [
    '28/12/2024',
    '28 Nov 2024',
    '28 Nov 2024',
    '28 Nov 2024',
    '28 Nov 2024',
  ];
  final List total = [
    '1000',
    '2000',
    '3000',
    '4000',
    '5000',
  ];
  UserOrderHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Order History'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orderId.length,
            itemBuilder: (BuildContext context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(UserOrderHistoryDetail());
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.lightSilver,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UserOrderHistoryReusableRow(
                                  title: "Order ID: ",
                                  subtitle: orderId[index],
                                ),
                                UserOrderHistoryReusableRow(
                                  title: "Status: ",
                                  subtitle: status[index],
                                ),
                                UserOrderHistoryReusableRow(
                                  title: "Payment: ",
                                  subtitle: payment[index],
                                ),
                                UserOrderHistoryReusableRow(
                                  title: "Items: ",
                                  subtitle: items[index],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UserOrderHistoryReusableRow(
                                  title: "Party ID: ",
                                  subtitle: partyId[index],
                                ),
                                UserOrderHistoryReusableRow(
                                  title: "Party Name: ",
                                  subtitle: partyName[index],
                                ),
                                UserOrderHistoryReusableRow(
                                  title: "Order Date: ",
                                  subtitle: orderDate[index],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "TOTAL: ",
                                      style: smallStyle.copyWith(
                                          color: AppColors.silver),
                                    ),
                                    Text(
                                      total[index],
                                      style: smallStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const SmallButtonReusable(
                        icon: Icon(Icons.visibility),
                        title: "View Details",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class UserOrderHistoryReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserOrderHistoryReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            title,
            style: smallStyle.copyWith(color: AppColors.silver),
          ),
          Expanded(
            child: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
