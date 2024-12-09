import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../controllers/user_order_controller.dart';

class CreateOrderTotalPrice extends StatelessWidget {
  final bool showTotal;
  final userOrder = Get.put(UserOrderController());
  CreateOrderTotalPrice({super.key, required this.showTotal});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      userOrder.calculateTotalPrice();
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total Price Label
          showTotal
              ? Text(
                  "Total: ",
                  style: smallStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight
                        .w500, // Slightly lighter than bold for better balance
                    color: Colors.grey[
                        700], // Darker color for the label for better contrast
                  ),
                )
              : const SizedBox(),

          // Display Calculated Total Price
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            // decoration: BoxDecoration(
            //   color:
            //       AppColors.lightSilver, // Light green background for contrast
            //   borderRadius: BorderRadius.circular(8),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.black.withOpacity(0.1),
            //       blurRadius: 5,
            //       offset: const Offset(0, 2),
            //     ),
            //   ],
            // ),
            child: Text(
              "Rs. ${userOrder.calculateTotalPrice().toStringAsFixed(2)}",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: smallStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.green,
              ),
            ),
          ),
        ],
      );
    });
  }
}
