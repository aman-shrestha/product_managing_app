// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/user_order_history/views/user_order_history_invoice_details.dart';

import '../../../constants/text_size.dart';
import '../../parties_order_history/views/parties_order_history_detail.dart';

class UserOrderHistoryDetail extends StatelessWidget {
  var show = false.obs;
  final List img = [
    "assets/img/rice&noodles1_1.png",
    "assets/img/rice&noodles2_1.jpg",
    "assets/img/snacks1_1.png",
    "assets/img/snacks2_1.png",
  ];
  UserOrderHistoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Order Invoice"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     show.value = !show.value;
              //   },
              //   child: const SmallButtonReusable(
              //     icon: Icon(Icons.visibility_outlined),
              //     width: 200,
              //     title: "View Invoice Detail",
              //   ),
              // ),
              // Obx(
              //   () => show.value == true
              //       ? const UserOrderHistoryInvoiceDetails()
              //       : const SizedBox(),
              // ),
              const UserOrderHistoryInvoiceDetails(),
              const SizedBox(height: 20),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: img.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: AppColors.lightSilver,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    // margin: const EdgeInsets.symmetric(
                    //     vertical: 8.0), // Adds spacing between items
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              img[index],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                              width: 16), // Spacing between image and details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product A",
                                  style: smallStyle.copyWith(
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                _buildDetailRow("Price", "Rs. 2,000"),
                                _buildDetailRow("Quantity", "1"),
                                _buildDetailRow("Discount", "10%"),
                                _buildDetailRow("VAT", "13%"),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      "Total: ",
                                      style: smallStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Rs. 2,034",
                                      style: smallStyle.copyWith(
                                          color: AppColors.primaryColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              // Order Summary
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     blurRadius: 10,
                  //     spreadRadius: 1,
                  //   ),
                  // ],
                ),
                child: const Column(
                  children: [
                    OrderDetailReusableRow(title: "Items", subtitle: "4"),
                    SizedBox(height: 5),
                    OrderDetailReusableRow(
                        title: "Subtotal", subtitle: "Rs. 6,000"),
                    SizedBox(height: 5),
                    OrderDetailReusableRow(
                        title: "Delivery", subtitle: "Rs. 100"),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    OrderDetailReusableRow(
                        title: "Grand Total", subtitle: "Rs. 6,100"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            fontSize: TextSize.small,
            fontWeight: FontWeight.w500,
            color: AppColors.titleColorGrey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: TextSize.small,
            fontWeight: FontWeight.w600,
            color: AppColors.titleColorGrey,
          ),
        ),
      ],
    ),
  );
}

//
