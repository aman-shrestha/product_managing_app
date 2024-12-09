import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/data/parties_categories_data.dart';
import 'package:product_ordering_app/app/modules/parties_categories/views/parties_product.dart';
import 'package:product_ordering_app/app/modules/reusable_widgets/text_form_field_reusable.dart';
import '../controllers/parties_categories_controller.dart';

class PartiesCategoriesView extends GetView<PartiesCategoriesController> {
  final partiesCategory = Get.put(PartiesCategoriesController());
  final searchController = TextEditingController();
  PartiesCategoriesView({super.key});
  @override
  Widget build(BuildContext context) {
    partiesCategory.category.value = partiesCategories[0]["category_name"];
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Category'),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              SizedBox(
                height: 115,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: partiesCategories.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          partiesCategory.category.value =
                              partiesCategories[index]["category_name"];
                        },
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: partiesCategory.category.value ==
                                                partiesCategories[index]
                                                    ["category_name"]
                                            ? Colors.blue
                                            : Colors.transparent)),
                                child: CircleAvatar(
                                  radius: 24, // Adjust size as needed
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      partiesCategories[index]["sub_category"]
                                              [0][
                                          "sub_category_img"], // Dynamic image path
                                      fit: BoxFit.cover,
                                      width:
                                          48, // Ensure it matches the radius * 2
                                      height: 48,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 70,
                                height: 50,
                                child: Expanded(
                                  child: Center(
                                    child: Text(
                                      partiesCategories[index]["category_name"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: miniStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              partiesCategory.category.value ==
                                                      partiesCategories[index]
                                                          ["category_name"]
                                                  ? Colors.blue
                                                  : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TextFormFieldReusable(
                hint: "Search products",
                textEditingController: searchController,
              ),
              const SizedBox(height: 20),
              Expanded(child: SingleChildScrollView(child: PartiesProduct())),
            ],
          ),
        ),
      ),
    );
  }
}
