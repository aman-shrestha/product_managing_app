// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/modules/admin_product/views/admin_add_product.dart';
import 'package:product_ordering_app/app/modules/admin_product/views/admin_edit_product.dart';
import 'package:product_ordering_app/app/modules/admin_product/views/admin_product_static_listview.dart';

import '../../../data/parties_product_data.dart';
import '../../parties_categories/views/parties_product.dart';
import '../controllers/admin_addproduct_controller.dart';

class AdminProductView extends GetView<AdminAddproductController> {
  final productController = TextEditingController();
  var searchResult = [].obs;
  AdminProductView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQueryProducts(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        List filteredData = partiesProduct
            .where((element) => element['product_name']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
        // searchResultDetails.clear();
      }
    }

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Product'),
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(AdminAddProduct());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Add Product",
                    style: smallStyle.copyWith(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: productController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Search products .....",
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    ),
                    onChanged: (value) => searchQueryProducts(value),
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => searchResult.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (context, index) {
                            Map product = searchResult[index];
                            return Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.silverBorder,
                                          width: 5))),
                              margin: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            product["product_image"][0]),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product["product_name"],
                                          style: smallStyle.copyWith(
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 5),
                                        PartiesProductReusableRow(
                                          title: "Category: ",
                                          subtitle:
                                              "${product["category"] ?? "N/A"}",
                                        ),
                                        const SizedBox(height: 5),
                                        PartiesProductReusableRow(
                                          title: "Price: ",
                                          subtitle:
                                              "Rs. ${product["sell_price"] ?? "No price"}",
                                        ),
                                        const SizedBox(height: 5),

                                        const PartiesProductReusableRow(
                                          title: "MAx Allowed Discount: ",
                                          subtitle: "15%",
                                        ),
                                        const SizedBox(height: 5),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            PartiesProductReusableRow(
                                              title: "Discount: ",
                                              subtitle:
                                                  "${product["discount"] ?? ""} %",
                                            ),
                                            PartiesProductReusableRow(
                                              title: "VAT: ",
                                              subtitle:
                                                  "${product["VAT"] ?? ""} %",
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 10),
                                        const AdminProductEditDeleteRow()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : const AdminProductStaticListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdminProductEditDeleteRow extends StatelessWidget {
  const AdminProductEditDeleteRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.showSnackbar(const GetSnackBar(
              title: "Delete Successfully",
              message: 'Successfully Deleted',
              icon: Icon(Icons.delete),
              duration: Duration(seconds: 3),
              backgroundColor: AppColors.red,
            ));
          },
          child: Row(
            children: [
              const Icon(
                Icons.delete,
                size: 20,
                color: Colors.red,
              ),
              const SizedBox(width: 5),
              Text(
                "Delete",
                style: smallStyle.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.to(AdminEditProduct());
          },
          child: Row(
            children: [
              const Icon(
                Icons.edit,
                size: 20,
                color: Colors.blue,
              ),
              const SizedBox(width: 5),
              Text(
                "Edit",
                style: smallStyle.copyWith(color: Colors.blue),
              ),
            ],
          ),
        )
      ],
    );
  }
}
