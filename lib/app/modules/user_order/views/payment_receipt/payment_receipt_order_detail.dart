import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/user_order/views/create_order_total_pice.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/style.dart';
import '../../controllers/user_order_controller.dart';

class PaymentReceiptOrderDetail extends StatelessWidget {
  final createOrder = Get.put(UserOrderController());
  PaymentReceiptOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // To prevent nested scroll issues
                itemCount: createOrder.displaySelectedProducts.length,
                itemBuilder: (BuildContext context, index) {
                  final product = createOrder.displaySelectedProducts[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: AppColors.lightSilver,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Image
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(product["product_image"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Product Name
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  product["product_name"],
                                  style: smallStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Product Pricing Details
                                Row(
                                  children: [
                                    Text(
                                      "Sell Price: Rs. ",
                                      style: smallStyle.copyWith(
                                        color: AppColors.silver,
                                      ),
                                    ),
                                    Text(product["sell_price"].toString()),
                                    // Container(
                                    //   width: 80,
                                    //   height: 40,
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 8),
                                    //   decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(8),
                                    //       border: Border.all(
                                    //           color: Colors
                                    //               .grey[400]!), // Subtle border
                                    //       color: Colors.white),
                                    //   child: Center(
                                    //     child: TextField(
                                    //       controller: TextEditingController(
                                    //           text: product["sell_price"]
                                    //               .toString()),
                                    //       keyboardType: TextInputType.number,
                                    //       // inputFormatters: <TextInputFormatter>[
                                    //       //   FilteringTextInputFormatter
                                    //       //       .digitsOnly
                                    //       // ], // Only numbers can be entered
                                    //       textAlign: TextAlign.center,
                                    //       style: const TextStyle(fontSize: 14),
                                    //       decoration: const InputDecoration(
                                    //         fillColor: Colors.white,
                                    //         border: InputBorder
                                    //             .none, // Removes default underline
                                    //       ),
                                    //       onSubmitted: (value) {
                                    //         createOrder
                                    //             .displaySelectedProducts[index]
                                    //             .update(
                                    //           "sell_price",
                                    //           (_) =>
                                    //               int.tryParse(value) ??
                                    //               0, // Parses the value to an integer or defaults to 0
                                    //         );

                                    //         createOrder.submitedQuantityOnclick(
                                    //             index,
                                    //             int.parse(product["quantity"]));
                                    //         //createOrder
                                    //         //    .calculateTotalPrice();
                                    //         // createOrder
                                    //         //     .displaySelectedProducts
                                    //         //     .refresh();
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                // VAT and Discount
                                Row(
                                  children: [
                                    Text("VAT: ${product["VAT"]}%",
                                        style: smallStyle.copyWith(
                                            color: AppColors.silver)),
                                    const SizedBox(width: 16),
                                    Text("Discount: ${product["discount"]}%",
                                        style: smallStyle.copyWith(
                                            color: AppColors.silver)),
                                  ],
                                ),
                                const SizedBox(height: 8),

                                Text(
                                  "Total Price: Rs. ${product["total_price"]}",
                                  style: smallStyle.copyWith(
                                      color: AppColors.silver,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),

                                Row(
                                  children: [
                                    Text("Quantity:",
                                        style: smallStyle.copyWith(
                                            color: AppColors.silver)),
                                    const SizedBox(width: 8),
                                    Text(product["quantity"]),
                                    // Container(
                                    //   width: 80,
                                    //   height: 40,
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 8),
                                    //   decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(8),
                                    //       border: Border.all(
                                    //           color: Colors
                                    //               .grey[400]!), // Subtle border
                                    //       color: Colors.white),
                                    //   child: Center(
                                    //     child: TextField(
                                    //       controller: TextEditingController(
                                    //           text: product["quantity"]),
                                    //       keyboardType: TextInputType.number,
                                    //       inputFormatters: <TextInputFormatter>[
                                    //         FilteringTextInputFormatter
                                    //             .digitsOnly
                                    //       ], // Only numbers can be entered
                                    //       textAlign: TextAlign.center,
                                    //       style: const TextStyle(fontSize: 14),
                                    //       decoration: const InputDecoration(
                                    //         fillColor: Colors.white,
                                    //         border: InputBorder
                                    //             .none, // Removes default underline
                                    //       ),
                                    //       onSubmitted: (value) {
                                    //         final quantity =
                                    //             int.tryParse(value) ?? 1;

                                    //         // Update the quantity of the specific product
                                    //         product.update("quantity",
                                    //             (_) => value.toString());

                                    //         // Recalculate the total price and update it
                                    //         createOrder.submitedQuantityOnclick(
                                    //             index, quantity);
                                    //         // createOrder
                                    //         //     .displaySelectedProducts[
                                    //         //         index]
                                    //         //     .update(
                                    //         //         "quantity",
                                    //         //         (_) =>
                                    //         //             value.toString());

                                    //         // Refresh the list (RxList will notify listeners)
                                    //         createOrder.displaySelectedProducts
                                    //             .refresh();
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                    // const Spacer(),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     createOrder.displaySelectedProducts
                                    //         .removeAt(index);
                                    //     Get.showSnackbar(
                                    //       const GetSnackBar(
                                    //         title: 'Deleted Sucessfully',
                                    //         message:
                                    //             'The Particular Product has been Deleted',
                                    //         backgroundColor: AppColors.red,
                                    //         icon: Icon(Icons.delete),
                                    //         duration: Duration(seconds: 3),
                                    //       ),
                                    //     );
                                    //   },
                                    //   child: const Icon(
                                    //     Icons.delete,
                                    //     color: AppColors.red,
                                    //   ),
                                    // ),
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
              // CreateOrderTotalPrice(showTotal: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 90,
          child: CreateOrderTotalPrice(showTotal: true)),
    );
  }
}
