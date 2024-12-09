import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/parties_order_history/views/parties_order_history_detail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_size.dart';

class PartiesOrderHistoryGridView extends StatelessWidget {
  final String title;
  final List img = [
    "assets/img/rice&noodles1_1.png",
    "assets/img/rice&noodles2_1.jpg",
    "assets/img/snacks1_1.png",
    "assets/img/snacks2_1.png",
  ];
  final List state = [
    'Processing',
    'on Delivery',
    'Processing',
    'on Delivery',
  ];
  final List orderId = [
    '#123Abc',
    '#456Def',
    '#789Ghi',
    '#012Jkl',
  ];
  final List realPrice = [
    '1000',
    '900',
    '1200',
    '2000',
  ];
  final List price = [
    '900',
    '800',
    '1000',
    '1600',
  ];
  final List date = [
    '2024/09/26 dsfkasdfklasjfkj',
    '2024/09/27',
    '2024/09/28',
    '2024/09/29',
  ];
  final List quantity = [
    '2',
    '3',
    '4',
    '5',
  ];
  PartiesOrderHistoryGridView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('$title Order Detail'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: img.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 10.0,
            // childAspectRatio: 0.65,
            childAspectRatio: 0.6,
            // 1.3,
          ),
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  PartiesOrderHistoryDetail(
                    orderID: orderId[index],
                    estimatedTime: "26 Spet 2024",
                    title: "Product A",
                    price: price[index],
                    img: img[index],
                    quantity: '1',
                    orderDate: '',
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  // border: Border.all(color: AppColors.silverBorder, width: 5),
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: const BorderDirectional(
                                bottom: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                ),
                              ),
                              image: DecorationImage(
                                image: AssetImage(img[
                                    index]), // Replace with actual image URL
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: Adaptive.h(20),
                          ),
                          // Positioned(
                          //   top: 5,
                          //   right: 5,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       Get.to(
                          //         PartiesOrderHistoryDetail(
                          //           orderID: orderId[index],
                          //           estimatedTime: "26 Spet 2024",
                          //           title: "Product A",
                          //           size: "S",
                          //           price: price[index],
                          //           img: img[index],
                          //           realprice: realPrice[index],
                          //           quantity: '1',
                          //           status: state[index],
                          //         ),
                          //       );
                          //     },
                          //     child: Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(8),
                          //         color: AppColors.lightSilver,
                          //       ),
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(5.0),
                          //         child: Icon(
                          //           Icons.remove_red_eye_outlined,
                          //           size: 20,
                          //           color: Colors.black.withOpacity(0.7),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "State: ${state[index]} ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.titleColorGrey,
                            fontSize: TextSize.small,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),

                      Row(
                        children: [
                          Text(
                            "Order ID: ",
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: TextSize.small,
                              fontWeight: FontWeight.w700,
                              color: AppColors.titleColorGrey,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              orderId[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: TextSize.small,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Row(
                      //   children: [
                      //     Text(
                      //       realPrice[index],
                      //       style: TextStyle(
                      //         fontSize: TextSize.small,
                      //         decoration: TextDecoration.lineThrough,
                      //         decorationThickness: 2,
                      //         decorationColor: Colors.grey,

                      //         color: Colors.grey,
                      //         fontWeight: FontWeight.w500,
                      //         // fontWeight: FontWeight.bold,
                      //         // color: Colors.red,
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Text(
                      //       price[index],
                      //       style: TextStyle(
                      //         fontSize: TextSize.small,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.red,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "Date: ",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: TextSize.small,
                              fontWeight: FontWeight.w700,
                              color: AppColors.titleColorGrey,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              date[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: TextSize.small,
                                fontWeight: FontWeight.w500,
                                color: AppColors.captionColorGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
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

class PartiesOrderHistoryGridViewReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const PartiesOrderHistoryGridViewReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title :',
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: TextSize.small,
            fontWeight: FontWeight.w700,
            color: AppColors.titleColorGrey,
          ),
        ),
        Expanded(
          child: Text(
            subtitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: TextSize.small,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
