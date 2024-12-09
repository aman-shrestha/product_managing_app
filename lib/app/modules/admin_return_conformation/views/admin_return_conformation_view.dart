import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:product_ordering_app/app/data/admin_return_confirmation_data.dart';
import 'package:product_ordering_app/app/modules/admin_return_conformation/views/admin_return_conformation_detail.dart';

import '../../../constants/colors.dart';
import '../../../constants/style.dart';
import '../../reusable_widgets/small_button_reusable.dart';
import '../controllers/admin_return_conformation_controller.dart';

class AdminReturnConformationView
    extends GetView<AdminReturnConformationController> {
  final searchInvoice = TextEditingController();
  final searchResult = [].obs;
  AdminReturnConformationView({super.key});
  @override
  Widget build(BuildContext context) {
    void searchQuery(String query) {
      if (query.isEmpty) {
        searchResult.value = [];
      } else {
        // Filter data based on search query
        List filteredData = adminReturnConfirmationData
            .where((element) => element['invoice_id']
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
        searchResult.value = filteredData;
      }
    }

    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Return Confirmation'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: searchInvoice,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Search through invoice ...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  onChanged: (value) => searchQuery(value),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => searchResult.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchResult.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Get.to(ProductReturnConformationDetail());
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(AdminReturnConformationDetail());
                                },
                                child: ProductReturnCard(
                                  customerName: searchResult[index]
                                      ["user_name"],
                                  productName: searchResult[index]
                                      ["product_name"],
                                  returnReason: searchResult[index]["Reason"],
                                  date: searchResult[index]["Date"],
                                  status: searchResult[index]["status"],
                                  invoice: searchResult[index]["invoice_id"],
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: adminReturnConfirmationData.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Get.to(ProductReturnConformationDetail());
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(AdminReturnConformationDetail());
                                },
                                child: ProductReturnCard(
                                  customerName:
                                      adminReturnConfirmationData[index]
                                          ["user_name"],
                                  productName:
                                      adminReturnConfirmationData[index]
                                          ["product_name"],
                                  returnReason:
                                      adminReturnConfirmationData[index]
                                          ["Reason"],
                                  date: adminReturnConfirmationData[index]
                                      ["Date"],
                                  status: adminReturnConfirmationData[index]
                                      ["status"],
                                  invoice: adminReturnConfirmationData[index]
                                      ["invoice_id"],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductReturnCard extends StatelessWidget {
  final String invoice;
  final String customerName;
  final String productName;
  final String returnReason;
  final String date;
  final String status;

  const ProductReturnCard({
    super.key,
    required this.customerName,
    required this.productName,
    required this.returnReason,
    required this.date,
    required this.status,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.lightSilver),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Invoice No: $invoice",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Product: $productName",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Reason: $returnReason",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Date: $date",
              style: smallStyle.copyWith(
                color: AppColors.silver,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Status: $status",
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButtonReusable(
                  icon: Icon(
                    Icons.check_circle,
                  ),
                  title: "Approve",
                  width: 140,
                ),
                SizedBox(width: 8),
                SmallButtonReusable(
                  icon: Icon(
                    Icons.cancel,
                  ),
                  title: "Decline",
                  width: 140,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
