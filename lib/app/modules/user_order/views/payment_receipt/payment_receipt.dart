import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/user_order/views/payment_receipt/payment_receipt_order_detail.dart';
import 'package:product_ordering_app/app/modules/user_order/views/payment_receipt/payment_receipt_parties_info.dart';

class PaymentReceiptView extends StatelessWidget {
  final String orderId;
  final String paymentMethod;
  final String issuedDate;
  final String estimatedDeliveryDate;
  final String customerName;
  final String salespersonName;
  final double amount;
  final double extraFee;
  final double grandTotal;

  const PaymentReceiptView({
    super.key,
    required this.orderId,
    required this.paymentMethod,
    required this.issuedDate,
    required this.estimatedDeliveryDate,
    required this.customerName,
    required this.salespersonName,
    required this.amount,
    required this.extraFee,
    required this.grandTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // title: const Text('Payment Receipt'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.lightSilver),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Order Receipt',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(),
                      _buildReceiptRow('Order ID:', orderId),
                      _buildReceiptRow('Payment Method:', paymentMethod),
                      _buildReceiptRow('Issued Date:', issuedDate),
                      _buildReceiptRow(
                          'Estimated Delivery Date:', estimatedDeliveryDate),
                      _buildReceiptRow('Party Name:', customerName),
                      _buildReceiptRow('Salesperson Name:', salespersonName),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                showDragHandle: true,
                                isScrollControlled:
                                    true, // Allows modal to occupy full height
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return FractionallySizedBox(
                                    heightFactor:
                                        0.8, // 90% of the screen height
                                    child: PaymentReceiptOrderDetail(),
                                  );
                                },
                              );
                            },
                            // onTap: () {
                            //   Get.to(PaymentReceiptOrderDetail());
                            // },
                            child: Text(
                              "View Order Detail",
                              style: smallStyle.copyWith(color: Colors.blue),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                showDragHandle: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return const SizedBox(
                                      height: 300,
                                      child: PaymentReceiptPartiesInfo());
                                },
                              );
                            },
                            child: Text(
                              "View Parties Detail",
                              style: smallStyle.copyWith(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Amount Details:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      _buildReceiptRow('Amount:', amount.toStringAsFixed(2)),

                      _buildReceiptRow(
                          'Extra Fee:', extraFee.toStringAsFixed(2)),
                      const Divider(),
                      _buildReceiptRow(
                        'Grand Total:',
                        '${amount + extraFee}',
                        isBold: true,
                      ),

                      // const Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const LargeButtonReusable(title: "Done")
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: smallStyle.copyWith(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: Colors.grey)),
          Text(
            value,
            style: smallStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
