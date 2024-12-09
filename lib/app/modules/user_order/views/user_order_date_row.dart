import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/style.dart';
import '../controllers/user_order_controller.dart';

class UserOrderDateRow extends StatelessWidget {
  final userOrder = Get.put(UserOrderController());
  UserOrderDateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   "Issued Date",
            //   style: smallStyle.copyWith(fontWeight: FontWeight.bold),
            // ),
            Text(
              "Estimated Delivery Date",
              style: smallStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const Icon(Icons.calendar_month),
            // const SizedBox(width: 5),
            // GestureDetector(
            //   onTap: () async {
            //     final DateTime? picked = await showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime(2024),
            //       lastDate: DateTime(3000),
            //     );

            //     if (picked != null) {
            //       // Update the selected date in the controller
            //       userOrder.selectedDateFrom.value = picked;
            //     }
            //   },
            //   child: Obx(() {
            //     // Use Obx to reactively update the Text widget when the selected date changes
            //     return Text(
            //       userOrder.selectedDateFrom.value == null
            //           ? "Select Date"
            //           : "${userOrder.selectedDateFrom.value!.toLocal()}"
            //               .split(' ')[0],
            //     );
            //   }),
            // ),
            // const Spacer(),
            const Icon(Icons.calendar_month),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(3000),
                );

                if (picked != null) {
                  // Update the selected date in the controller
                  userOrder.selectedDateTo.value = picked;
                }
              },
              child: Obx(() {
                // Use Obx to reactively update the Text widget when the selected date changes
                return Text(
                  userOrder.selectedDateTo.value == null
                      ? "Select Date"
                      : "${userOrder.selectedDateTo.value!.toLocal()}"
                          .split(' ')[0],
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
