import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/data/parties_product_data.dart';

import '../../../constants/colors.dart';
import '../controllers/parties_categories_controller.dart';

class PartiesProduct extends StatelessWidget {
  final partiesCategory = Get.put(PartiesCategoriesController());
  PartiesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List selectedProducts = partiesProduct
          .where((element) =>
              element["category"] == partiesCategory.category.value)
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
                    bottom:
                        BorderSide(color: AppColors.silverBorder, width: 5))),
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
                //   // CheckBoxReusable(
                //   //   valueCheckbox: partiesCategory.isSelected.value,
                //   //   checkboxFunc: partiesCategory.toogleSelected,
                //   // ),
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
                      PartiesProductReusableRow(
                        title: "Price: ",
                        subtitle: "${product["sell_price"] ?? "No price"}",
                      ),
                      const SizedBox(height: 5),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      PartiesProductReusableRow(
                        title: "Discount: ",
                        subtitle: "${product["discount"] ?? ""}",
                      ),
                      const SizedBox(height: 5),
                      PartiesProductReusableRow(
                        title: "VAT: ",
                        subtitle: "${product["VAT"] ?? ""}",
                      ),
                      //   ],
                      // ),
                      // const SizedBox(height: 5),
                      // PartiesProductReusableRow(
                      //   title: "Stock Quantity: ",
                      //   subtitle: product["stock_quantity"].toString(),
                      // ),
                      const SizedBox(height: 5),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Stock: ",
                      //       style: smallStyle.copyWith(
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      // const Spacer(),
                      // GestureDetector(
                      //     onTap: () {
                      //       if (partiesCategory.quantityIndex.value > 0) {
                      //         partiesCategory.quantityIndex.value--;
                      //       }
                      //     },
                      //     child: const Icon(Icons.remove)),
                      // const SizedBox(width: 20),
                      // Obx(
                      //   () => Text(
                      //     partiesCategory.quantityIndex.value.toString(),
                      //   ),
                      // ),
                      // const SizedBox(width: 20),
                      // GestureDetector(
                      //     onTap: () {
                      //       partiesCategory.quantityIndex.value++;
                      //     },
                      //     child: const Icon(Icons.add)),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}

class PartiesProductReusableRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const PartiesProductReusableRow(
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
