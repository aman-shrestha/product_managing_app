// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/data/parties_product_data.dart';
import 'package:product_ordering_app/app/modules/parties_order/controllers/parties_order_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../parties_categories/controllers/parties_categories_controller.dart';

class PartiesOrderListView extends StatelessWidget {
  final partiesCategory = Get.put(PartiesCategoriesController());
  final partiesOrderController = Get.put(PartiesOrderController());
  PartiesOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () {
    List selectedProducts = partiesProduct
        .where((element) =>
            partiesCategory.selectedProduct.contains(element["product_id"]))
        .toList();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: selectedProducts.length,
      itemBuilder: (BuildContext context, index) {
        Map product = selectedProducts[index];
        return Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.silverBorder, width: 5))),
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              // GestureDetector(
              //     onTap: () {
              //       print(partiesCategory.selectedProduct.value);
              //     },
              //     child: Text("data")),
              // Obx(
              //   () => Checkbox(
              //     value: partiesCategory
              //         .checkDataInSelectedProduct(product["product_id"]),
              //     onChanged: (bool? value) {
              //       partiesCategory.toogleSelected(product["product_id"]);
              //       // controller.quantityIndex.value;
              //     },
              //   ),
              // CheckBoxReusable(
              //   valueCheckbox: partiesCategory.isSelected.value,
              //   checkboxFunc: partiesCategory.toogleSelected,
              // ),
              // ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product["product_image"][0]),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["product_name"],
                      style: smallStyle.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    DashBoardPartiesReusableRow(
                      title: "Price: ",
                      subtitle: "${product["sell_price"] ?? "No price"}",
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DashBoardPartiesReusableRow(
                          title: "Discount: ",
                          subtitle: "${product["discount"] ?? ""}",
                        ),
                        DashBoardPartiesReusableRow(
                          title: "VAT: ",
                          subtitle: "${product["VAT"] ?? ""}",
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    DashBoardPartiesReusableRow(
                      title: "Total Price: ",
                      subtitle: "${product["total_price"]}",
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Quantity: ",
                          style:
                              smallStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              if (partiesCategory.quantityIndex.value > 0) {
                                partiesCategory.quantityIndex.value--;
                              }
                            },
                            child: const Icon(Icons.remove)),
                        const SizedBox(width: 20),
                        Obx(
                          () => Text(
                            partiesCategory.quantityIndex.value.toString(),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                            onTap: () {
                              partiesCategory.quantityIndex.value++;
                            },
                            child: const Icon(Icons.add)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    //   },
    // );
  }
}

class DashBoardPartiesReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const DashBoardPartiesReusableRow(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: smallStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: smallStyle,
        )
      ],
    );
  }
}
