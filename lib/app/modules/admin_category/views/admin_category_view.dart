import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/constants/style.dart';
import 'package:product_ordering_app/app/data/parties_categories_data.dart';
import 'package:product_ordering_app/app/modules/admin_category/views/admin_add_category.dart';
import 'package:product_ordering_app/app/modules/admin_category/views/admin_edit_category.dart';
import '../../../constants/colors.dart';
import '../controllers/admin_category_controller.dart';

class AdminCategoryView extends GetView<AdminCategoryController> {
  const AdminCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Category'),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(AdminAddCategory());
            },
            child: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Get.to(AdminAddCategory());
            },
            child: Text(
              "Add Category",
              style: smallStyle.copyWith(color: Colors.blue),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text("Category ID")),
              DataColumn(label: Text("Category Name")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("Action")),
            ],
            rows: partiesCategories.map((category) {
              return DataRow(
                cells: [
                  DataCell(Text(category["category_id"]!)),
                  DataCell(Text(category["category_name"]!)),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: category["status"] == "active"
                            ? Colors.green[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Text(
                        category["status"] ?? "",
                        style: TextStyle(
                          color: category["status"] == "active"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        // IconButton(
                        //   icon: Icon(Icons.visibility),
                        //   onPressed: () {
                        //     // View action
                        //   },
                        // ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            // Edit action
                            Get.to(AdminEditCategory());
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Delete action
                            Get.showSnackbar(const GetSnackBar(
                              title: "Delete Successfully",
                              message: 'Successfully Deleted',
                              icon: Icon(Icons.delete),
                              duration: Duration(seconds: 3),
                              backgroundColor: AppColors.red,
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: SingleChildScrollView(
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         GridView.builder(
        //           shrinkWrap: true,
        //           physics: const NeverScrollableScrollPhysics(),
        //           itemCount: partiesCategories.length,
        //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 2,
        //             mainAxisSpacing: 16,
        //             crossAxisSpacing: 16,
        //             childAspectRatio: 0.9,
        //           ),
        //           itemBuilder: (BuildContext context, int index) {
        //             return GestureDetector(
        //               onTap: () {
        //                 // Add navigation or interactivity here
        //               },
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(12),
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Colors.grey.withOpacity(0.2),
        //                       blurRadius: 8,
        //                       offset: const Offset(0, 2),
        //                     ),
        //                   ],
        //                 ),
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Container(
        //                       height: 120,
        //                       decoration: BoxDecoration(
        //                         color: Colors.white,
        //                         borderRadius: const BorderRadius.vertical(
        //                           top: Radius.circular(12),
        //                         ),
        //                         image: DecorationImage(
        //                           image: AssetImage(
        //                             partiesCategories[index]["category_img"],
        //                           ),
        //                           fit: BoxFit.contain,
        //                         ),
        //                       ),
        //                     ),
        //                     const SizedBox(height: 10),
        //                     Padding(
        //                       padding:
        //                           const EdgeInsets.symmetric(horizontal: 10),
        //                       child: Text(
        //                         partiesCategories[index]["category_name"],
        //                         maxLines: 1,
        //                         overflow: TextOverflow.ellipsis,
        //                         style: smallStyle.copyWith(
        //                           fontWeight: FontWeight.bold,
        //                           fontSize: 16,
        //                         ),
        //                       ),
        //                     ),
        //                     const Spacer(),
        //                     const Divider(
        //                       color: Color.fromARGB(255, 241, 240, 240),
        //                     ),
        //                     Padding(
        //                       padding:
        //                           const EdgeInsets.symmetric(horizontal: 10),
        //                       child: Row(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           GestureDetector(
        //                             onTap: () {
        //                               Get.to(AdminEditCategory());
        //                             },
        //                             child: Row(
        //                               children: [
        //                                 const Icon(Icons.edit,
        //                                     color: Colors.blue, size: 16),
        //                                 const SizedBox(width: 4),
        //                                 Text(
        //                                   "Edit",
        //                                   style: smallStyle.copyWith(
        //                                     color: Colors.blue,
        //                                     fontWeight: FontWeight.w500,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                           GestureDetector(
        //                             onTap: () {
        //                               // Add delete action here
        //                             },
        //                             child: Row(
        //                               children: [
        //                                 const Icon(Icons.delete,
        //                                     color: Colors.red, size: 16),
        //                                 const SizedBox(width: 4),
        //                                 Text(
        //                                   "Delete",
        //                                   style: smallStyle.copyWith(
        //                                     color: Colors.red,
        //                                     fontWeight: FontWeight.w500,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     const SizedBox(height: 10),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // )
//         );
//   }
// }
