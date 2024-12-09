// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/data/parties_users.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/user_order/controllers/user_order_controller.dart';
import 'package:product_ordering_app/app/modules/user_order/views/user_order_date_row.dart';

import 'create_order_items_container.dart';
import 'create_order_total_pice.dart';
import 'payment_receipt/payment_receipt.dart';

class CreateOrder extends StatelessWidget {
  // final userOrder = Get.put(UserOrderController());
  final List<String> _list = [
    'Cash On Delivery',
    'Mobile Banking',
  ];
  final remarks = TextEditingController();
  final createOrder = Get.put(UserOrderController());
  final searchParties = TextEditingController();
  final searchResult = [].obs; // For recipient search results
  var items = [].obs; // List to track added items

  CreateOrder({super.key});

  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = partiesUsers
            .where((element) => element['Parties_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
        createOrder.quantityOnclick(1);
      }
    }

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              const Text("Create Order"),
              const Spacer(),
              CreateOrderTotalPrice(
                showTotal: false,
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            // IconButton(
            //   icon: const Icon(
            //     Icons.delete_outline,
            //     // color: AppColors.textColorGrey,
            //     // color: Colors.white,
            //   ),
            //   onPressed: () {
            //     // Remove products that are selected (based on product_id)
            //     userOrder.displaySelectedProducts.removeWhere((product) {
            //       return userOrder.selectedProduct
            //           .contains(product["product_id"]);
            //     });

            //     // Clear the selected products list after deletion
            //     userOrder.selectedProduct.clear();
            //   },
            // ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Recipient",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Click Search Result To Add Parties",
                  style: smallStyle.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.red),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: searchParties,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Search Parties...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  onChanged: (value) => searchQuery(value),
                ),
                Obx(
                  () => searchResult.isNotEmpty
                      ? Container(
                          constraints: const BoxConstraints(maxHeight: 300),
                          child: ListView.builder(
                            shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: searchResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  //LOGIC FOR ADDING MULTIPLE USER
                                  // createOrder.partiesList.add(
                                  //   {
                                  //     "Parties_id": searchResult[index]["Parties_id"],
                                  //     "Parties_name": searchResult[index]
                                  //         ["Parties_name"],
                                  //     "Parties_location": searchResult[index]
                                  //         ["Parties_location"]
                                  //   },
                                  // );

                                  searchParties.text =
                                      searchResult[index]["Parties_name"];
                                  searchResult.value = [];
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.person,
                                              color: Colors.blueAccent),
                                          const SizedBox(width: 10),
                                          Text(
                                              '${searchResult[index]["Parties_name"]} ',
                                              style: smallStyle),
                                          const Spacer(),
                                          Text(
                                              searchResult[index]["Parties_id"],
                                              style: smallStyle.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on,
                                              color: Colors.green),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              '${searchResult[index]["Parties_location"][0]["State"]},'
                                              '${searchResult[index]["Parties_location"][0]["District"]},'
                                              '${searchResult[index]["Parties_location"][0]["town"]}',
                                              style: miniStyle.copyWith(
                                                overflow: TextOverflow.ellipsis,
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
                        )
                      : const SizedBox(),
                ),

                const SizedBox(height: 20),
                UserOrderDateRow(),
                const SizedBox(height: 20),
                Text(
                  "Payment Mode",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomDropdown<String>(
                  hintText: 'Select Payment',
                  items: _list,
                  initialItem: _list[0],
                  onChanged: (value) {
                    // log('changing value to: $value');
                  },
                ),
                CreateOrderItemContainer(),
                // Obx(
                //   () => Column(
                //     children: items.map((item) {
                //       return CreateOrderItemContainer(
                //           // item: item
                //           );
                //     }).toList(),
                //   ),
                // ),
                const SizedBox(height: 10),
                // GestureDetector(
                //   onTap: () {
                //     items.add({
                //       'productController': TextEditingController(),
                //       'quantityController': TextEditingController(),
                //       'searchResult': [].obs,
                //       'selectedProductDetails': {}.obs,
                //     });
                //   },
                //   child: const Row(
                //     children: [
                //       Icon(
                //         Icons.add,
                //         color: Colors.blue,
                //       ),
                //       SizedBox(width: 10),
                //       Text(
                //         "Add Items",
                //         style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 20),
                Text(
                  "Remarks",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: remarks,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    fillColor: AppColors.lightSilver,
                    constraints: BoxConstraints.expand(
                      height: 150,
                    ),
                    hintText: 'Write Remarks Here ....',
                    // border: inputBorder,
                    // focusedBorder: inputBorder,
                    // enabledBorder: inputBorder,
                    filled: true,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  maxLength: 250,
                  maxLines: 50,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // To prevent nested scroll issues
                    itemCount: createOrder.displaySelectedProducts.length,
                    itemBuilder: (BuildContext context, index) {
                      final product =
                          createOrder.displaySelectedProducts[index];

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
                                          "Sell Price: Rs.",
                                          style: smallStyle.copyWith(
                                            color: AppColors.silver,
                                          ),
                                        ),
                                        Container(
                                          width: 80,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.grey[
                                                      400]!), // Subtle border
                                              color: Colors.white),
                                          child: Center(
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: product["sell_price"]
                                                      .toString()),
                                              keyboardType:
                                                  TextInputType.number,
                                              // inputFormatters: <TextInputFormatter>[
                                              //   FilteringTextInputFormatter
                                              //       .digitsOnly
                                              // ], // Only numbers can be entered
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                border: InputBorder
                                                    .none, // Removes default underline
                                              ),
                                              onSubmitted: (value) {
                                                createOrder
                                                    .displaySelectedProducts[
                                                        index]
                                                    .update(
                                                  "sell_price",
                                                  (_) =>
                                                      int.tryParse(value) ??
                                                      0, // Parses the value to an integer or defaults to 0
                                                );

                                                createOrder
                                                    .submitedQuantityOnclick(
                                                        index,
                                                        int.parse(product[
                                                            "quantity"]));
                                                //createOrder
                                                //    .calculateTotalPrice();
                                                // createOrder
                                                //     .displaySelectedProducts
                                                //     .refresh();
                                              },
                                            ),
                                          ),
                                        ),
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
                                        Text(
                                            "Discount: ${product["discount"]}%",
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
                                        Container(
                                          width: 80,
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.grey[
                                                      400]!), // Subtle border
                                              color: Colors.white),
                                          child: Center(
                                            child: TextField(
                                              controller: TextEditingController(
                                                  text: product["quantity"]),
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ], // Only numbers can be entered
                                              textAlign: TextAlign.center,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                border: InputBorder
                                                    .none, // Removes default underline
                                              ),
                                              onSubmitted: (value) {
                                                final quantity =
                                                    int.tryParse(value) ?? 1;

                                                // Update the quantity of the specific product
                                                product.update("quantity",
                                                    (_) => value.toString());

                                                // Recalculate the total price and update it
                                                createOrder
                                                    .submitedQuantityOnclick(
                                                        index, quantity);
                                                // createOrder
                                                //     .displaySelectedProducts[
                                                //         index]
                                                //     .update(
                                                //         "quantity",
                                                //         (_) =>
                                                //             value.toString());

                                                // Refresh the list (RxList will notify listeners)
                                                createOrder
                                                    .displaySelectedProducts
                                                    .refresh();
                                              },
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            createOrder.displaySelectedProducts
                                                .removeAt(index);
                                            Get.showSnackbar(
                                              const GetSnackBar(
                                                title: 'Deleted Sucessfully',
                                                message:
                                                    'The Particular Product has been Deleted',
                                                backgroundColor: AppColors.red,
                                                icon: Icon(Icons.delete),
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: AppColors.red,
                                          ),
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
                ),
                CreateOrderTotalPrice(
                  showTotal: true,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Get.to(PaymentReceiptView(
                        orderId: 'ORD12345',
                        paymentMethod: 'Credit Card',
                        issuedDate: '2024-12-02',
                        estimatedDeliveryDate: '2024-12-05',
                        customerName: 'John Doe',
                        salespersonName: 'Jane Smith',
                        amount: createOrder.calculateTotalPrice(),
                        extraFee: 100.00,
                        grandTotal: 155.00,
                      ));
                    },
                    child: const LargeButtonReusable(title: "Submit Order"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CreateOrderReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const CreateOrderReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: smallStyle.copyWith(color: AppColors.silver),
          ),
          Text(subtitle),
        ],
      ),
    );
  }
}
