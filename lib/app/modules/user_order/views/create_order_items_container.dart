// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/large_button_reusable.dart';
import 'package:product_ordering_app/app/modules/user_order/controllers/user_order_controller.dart';
import 'package:product_ordering_app/app/modules/user_order/views/create_order.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../../data/parties_product_data.dart';

class CreateOrderItemContainer extends StatelessWidget {
  final userOrder = Get.put(UserOrderController());
  var updatedQuantityList = [].obs;
  // final Map<String, dynamic> item;

  CreateOrderItemContainer({
    super.key,
    // required this.item,
  });

  @override
  Widget build(BuildContext context) {
    // TextEditingController userOrder.productController = item['userOrder.productController'];
    // TextEditingController userOrder.quantityController = item['userOrder.quantityController'];
    // var searchResult = item['searchResult'];
    // var selectedProductDetails = item['selectedProductDetails'];

    void searchQueryProducts(String query) {
      if (query.isEmpty) {
        userOrder.searchResult.value = [];
      } else {
        List filteredData = partiesProduct
            .where((element) => element['product_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        userOrder.searchResult.value = filteredData;
        userOrder.searchResultDetails.clear();
      }
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.lightSilver,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Items",
                  style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Click the Item to ADD",
                  style: smallStyle.copyWith(
                      color: AppColors.red, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: userOrder.productController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Search products...",
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                    onChanged: (value) => searchQueryProducts(value),
                  ),
                ),
                Obx(
                  () => userOrder.searchResult.isNotEmpty
                      ? Container(
                          constraints: const BoxConstraints(maxHeight: 300),
                          child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: userOrder.searchResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  userOrder.searchResultOnclick(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.shopping_basket_outlined,
                                          color: Colors.blueAccent),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          userOrder.searchResult[index]
                                              ["product_name"],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
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
                // CreateOrderItemsContainerDetail(productDetail: productDetail)
                Obx(
                  () => CreateOrderReusableRow(
                      title: "Sell Price per unit: ",
                      subtitle: userOrder.searchResultDetails.isEmpty
                          ? "N/A"
                          // : "Rs. ${selectedProductDetails["sell_price"]}",
                          : "Rs. ${userOrder.searchResultDetails[0]["sell_price"].toString()}"
                      // : userOrder.submittedList["sell_price"],
                      ),
                ),

                Obx(() => CreateOrderReusableRow(
                      title: "Discount: ",
                      subtitle: userOrder.searchResultDetails.isEmpty
                          ? "N/A"
                          : "${userOrder.searchResultDetails[0]["discount"]} %",
                    )),
                Obx(() => CreateOrderReusableRow(
                      title: "VAT: ",
                      subtitle: userOrder.searchResultDetails.isEmpty
                          ? "N/A"
                          : "${userOrder.searchResultDetails[0]["VAT"]} %",
                    )),
                Obx(() => CreateOrderReusableRow(
                      title: "Total Price: ",
                      subtitle: (userOrder.searchResultDetails.isEmpty)
                          ? "N/A"
                          : "Rs. ${userOrder.searchResultDetails[0]["total_price"]}",
                    )),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "Quantity: ",
                      style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          controller: userOrder.quantityController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ], // Only numbers can be entered
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Quantity",
                          ),
                          onChanged: (value) {
                            final quantity = int.tryParse(value) ?? 1;

                            userOrder.quantityOnclick(quantity);
                            // print(quantity);
                            // userOrder.searchResultDetails[0]["total_price"] *
                            //     quantity;
                            // userOrder.searchResultDetails.refresh();
                            // print(userOrder.searchResultDetails[0]
                            //     ["total_price"]);
                            // if(value.isNotEmpty){userOrder.searchResult.}

                            // userOrder.submittedList.update(
                            //     "total_price",
                            //     (value) =>
                            //         userOrder.searchResultDetails[0]
                            //             ["total_price"] *
                            //         userOrder.quantityController.text);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      userOrder.addProductOnClick();
                    },
                    child: const LargeButtonReusable(title: "Add Product")),
                // GestureDetector(
                //     onTap: () {
                //       searchResult.value = [];
                //       userOrder.productController.text = "";
                //       selectedProductDetails.value = [];
                //     },
                //     child: Text("data"))
              ],
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     userOrder.productController.text = "";
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
      ],
    );
  }
}
