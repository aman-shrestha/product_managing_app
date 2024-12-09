import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/style.dart';
import '../../../parties_order_history/views/parties_order_history_view.dart';

class PaymentReceiptPartiesInfo extends StatelessWidget {
  const PaymentReceiptPartiesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(PartiesOrderHistoryView(
            partyName: 'Ram',
          ));
        },
        child: Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(8),
          //   color: AppColors.lightSilver,
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black.withOpacity(0.1),
          //       blurRadius: 8,
          //       offset: const Offset(0, 2),
          //     ),
          //   ],
          // ),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ram",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Row(
                  children: [
                    Icon(Icons.phone, size: 16),
                    SizedBox(width: 8.0),
                    Text("9841123459"),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.email, size: 16),
                    SizedBox(width: 8.0),
                    Text("ram@gmail.com"),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "VAT/PAN:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "17659",
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Location:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Kuleshwor, Kathmandu, Bagmati, Nepal",
                ),
                const SizedBox(height: 10),
                Text(
                  "View Order History",
                  style: smallStyle.copyWith(color: Colors.blue),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
