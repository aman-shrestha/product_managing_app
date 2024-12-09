import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_size.dart';

class PartiesOrderHistoryDetail extends StatelessWidget {
  final String orderID, orderDate, estimatedTime, img, title, price, quantity;

  const PartiesOrderHistoryDetail({
    super.key,
    required this.orderID,
    required this.orderDate,
    required this.estimatedTime,
    required this.img,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    // int parsedPrice = int.tryParse(price) ?? 0;
    // int total = parsedPrice + 100;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        title: const Text(
          "Order Details",
          // style: TextStyle(
          //   color: Colors.black,
          //   fontWeight: FontWeight.w700,
          //   fontSize: TextSize.normal,
          // ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order ID and Estimated Time
              OrderHistoryTitleReusableRow(
                title: "Order ID: ",
                subtitle: orderID,
              ),
              const SizedBox(height: 12),
              OrderHistoryTitleReusableRow(
                title: "Order Date: ",
                subtitle: orderDate,
              ),
              const SizedBox(height: 12),
              OrderHistoryTitleReusableRow(
                title: "Estimated Arrival: ",
                subtitle: estimatedTime,
              ),

              // Order Status
              // Row(
              //   children: [
              //     const Text(
              //       "Status: ",
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     Container(
              //       padding:
              //           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: const Color(0xffFFEDD5),
              //       ),
              //       child: Text(
              //         status,
              //         style: const TextStyle(
              //           color: AppColors.red,
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              // Product List
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          img,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: TextSize.small,
                                fontWeight: FontWeight.w700,
                                color: AppColors.titleColorGrey,
                              ),
                              maxLines: 2,
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Text(
                                  "Rs. $price",
                                  style: TextStyle(
                                    fontSize: TextSize.small,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Quantity: $quantity",
                              style: TextStyle(
                                fontSize: TextSize.small,
                                fontWeight: FontWeight.w500,
                                color: AppColors.titleColorGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    OrderDetailReusableRow(
                        title: "Subtotal", subtitle: "Rs. $price"),
                    const SizedBox(height: 12),
                    const OrderDetailReusableRow(
                        title: "Delivery", subtitle: "Rs. 100"),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                    const OrderDetailReusableRow(
                        title: "Grand Total", subtitle: "Rs. 6,100"),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Payment Method
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       children: [
              //         Container(
              //           height: 30,
              //           width: 30,
              //           decoration: const BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Colors.red,
              //           ),
              //         ),
              //         const SizedBox(width: 10),
              //         Text(
              //           "Cash On Delivery",
              //           style: TextStyle(
              //             fontSize: TextSize.small,
              //             fontWeight: FontWeight.w700,
              //             color: AppColors.titleColorGrey,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Image.asset(
              //       "assets/images/cashondelivery.png",
              //       height: 40,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderHistoryTitleReusableRow extends StatelessWidget {
  final String title, subtitle;
  const OrderHistoryTitleReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: TextSize.normal,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColorGrey,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: TextSize.normal,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorGrey,
          ),
        ),
      ],
    );
  }
}

class OrderDetailReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const OrderDetailReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: TextSize.small,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColorGrey,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: TextSize.small,
            fontWeight: FontWeight.w500,
            color: AppColors.textColorGrey,
          ),
        )
      ],
    );
  }
}
