import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import '../controllers/user_order_controller.dart';

class UserOrderView extends GetView<UserOrderController> {
  final List orders = [
    "#123",
    "ram",
    '#abc',
    '21/11/2024',
    'Kuleshwor',
  ];
  UserOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Orders'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All",
                    style: smallStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Approved",
                    style: smallStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Declined",
                    style: smallStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    color: AppColors.lightSilver,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order #1234",
                            style: smallStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Ram " "(" "#1234" ")",
                            style: smallStyle,
                          ),
                          const SizedBox(height: 5),
                          const UserOrderViewReusableRow(
                            title: "Date: ",
                            subtitle: "2024/11/21",
                          ),
                          const SizedBox(height: 5),
                          const UserOrderViewReusableRow(
                            title: "Location: ",
                            subtitle: "Kuleshwor",
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "View all Orders",
                            style: smallStyle.copyWith(color: Colors.blue),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.lightBlue,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Confirm",
                                    style: smallStyle.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              // SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  // border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Decline",
                                    style:
                                        smallStyle.copyWith(color: Colors.red),
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
            ],
          ),
        ),
      ),
    );
  }
}

class UserOrderViewReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const UserOrderViewReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: smallStyle.copyWith(color: AppColors.silver),
        ),
        Text(
          subtitle,
          style: smallStyle,
        ),
      ],
    );
  }
}
