import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/data/parties_categories_data.dart';
import 'package:product_ordering_app/app/modules/parties_categories/controllers/parties_categories_controller.dart';
import 'package:product_ordering_app/app/modules/parties_categories/views/parties_product.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';

class PartiesSubCategory extends StatelessWidget {
  final partiesCategory = Get.put(PartiesCategoriesController());
  final String categoryName;
  PartiesSubCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    var selectedSubCategory = partiesCategories
        .where((element) => element["category_name"] == categoryName)
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(categoryName),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Adaptive.h(12.5),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedSubCategory[0]["sub_category"].length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      partiesCategory.subCategory.value = selectedSubCategory[0]
                          ["sub_category"][index]["sub_category_id"];
                      // Get.to(PartiesProduct());
                    },
                    child: Column(
                      children: [
                        Obx(
                          () => Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: partiesCategory.subCategory.value ==
                                          selectedSubCategory[0]["sub_category"]
                                              [index]["sub_category_id"]
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                                  width: 2),
                              image: DecorationImage(
                                image: AssetImage(
                                  selectedSubCategory[0]["sub_category"][index]
                                          ["sub_category_img"] ??
                                      "https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Obx(
                          () => SizedBox(
                            width: 70,
                            height: 40,
                            child: Text(
                              selectedSubCategory[0]["sub_category"][index]
                                      ["sub_category_name"] ??
                                  "",
                              // categoryData[index]["category_name"],
                              // selectedSubCategory[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: partiesCategory.subCategory.value ==
                                        selectedSubCategory[0]["sub_category"]
                                            [index]["sub_category_id"]
                                    ? AppColors.primaryColor
                                    : AppColors.textColorGrey,
                                // fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(child: PartiesProduct()),
          ],
        ),
      ),
    );
  }
}
