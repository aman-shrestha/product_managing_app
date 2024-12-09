import 'package:flutter/material.dart';
import 'package:product_ordering_app/app/modules/admin_product/views/admin_product_view.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../../data/parties_product_data.dart';
import '../../parties_categories/views/parties_product.dart';

class AdminProductStaticListView extends StatelessWidget {
  const AdminProductStaticListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: partiesProduct.length,
      itemBuilder: (BuildContext context, index) {
        Map product = partiesProduct[index];
        return Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.silverBorder, width: 5))),
          margin: const EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
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
                      title: "Category: ",
                      subtitle: "${product["category"] ?? "No price"}",
                    ),
                    const SizedBox(height: 5),
                    PartiesProductReusableRow(
                      title: "Price: ",
                      subtitle: "Rs. ${product["sell_price"] ?? "No price"}",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PartiesProductReusableRow(
                          title: "Discount: ",
                          subtitle: "${product["discount"] ?? ""} %",
                        ),
                        PartiesProductReusableRow(
                          title: "VAT: ",
                          subtitle: "${product["VAT"] ?? ""} %",
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
    );
  }
}
