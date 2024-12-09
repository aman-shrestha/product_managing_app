import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../data/parties_product_data.dart';

// class UserReturnItemsContainer extends StatelessWidget {
//   final List<String> _list = [
//     'Quality concerns',
//     'Incorrect product',
//     'Defective or damaged item',
//   ];
//   final Map items;
//   final searchResult = [].obs; // For recipient search results
//   UserReturnItemsContainer({
//     super.key,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController productController = items['productController'];
//     TextEditingController quantityController = items['quantityController'];
//     TextEditingController remarksController = items['remarksController'];
//     var searchResult = items['searchResult'];
//     void searchQueryProducts(String query) {
//       if (query.isEmpty) {
//         searchResult.value = [];
//       } else {
//         List filteredData = partiesProduct
//             .where((element) => element['product_name']
//                 .toLowerCase()
//                 .contains(query.toLowerCase()))
//             .toList();
//         searchResult.value = filteredData;
//       }
//     }

//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: AppColors.lightSilver,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Select Product",
//             style: smallStyle.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Container(
//             color: Colors.white,
//             child: TextField(
//               controller: productController,
//               decoration: InputDecoration(
//                 border: const OutlineInputBorder(),
//                 hintText: "Search products...",
//                 prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
//               ),
//               onChanged: (value) => searchQueryProducts(value),
//             ),
//           ),
//           Obx(
//             () => ListView.builder(
//               shrinkWrap: true,
//               itemCount: searchResult.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     productController.text =
//                         searchResult[index]["product_name"];
//                     // selectedProductDetails.value = searchResult[index];
//                     searchResult.value = [];
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.shopping_basket_outlined,
//                             color: Colors.blueAccent),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Text(
//                             searchResult[index]["product_name"],
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black87,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Text(
//             "Quantity",
//             style: smallStyle.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           // Container(
//           //   height: 40,
//           //   width: 70,
//           //   color: Colors.white,
//           // child:
//           TextField(
//             controller: quantityController,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: "",
//             ),
//           ),
//           // ),
//           const SizedBox(height: 20),
//           Text(
//             "Reason For Return",
//             style: smallStyle.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           CustomDropdown<String>(
//             hintText: 'Select Leave',
//             items: _list,
//             initialItem: _list[0],
//             onChanged: (value) {
//               // log('changing value to: $value');
//             },
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: remarksController,
//             keyboardType: TextInputType.text,
//             decoration: const InputDecoration(
//               fillColor: Colors.white,
//               constraints: BoxConstraints.expand(
//                 height: 200,
//               ),
//               hintText: 'Describe Reason For Return',
//               // border: inputBorder,
//               // focusedBorder: inputBorder,
//               // enabledBorder: inputBorder,
//               filled: true,
//               contentPadding: EdgeInsets.all(8),
//             ),
//             maxLength: 250,
//             maxLines: 50,
//           ),
//         ],
//       ),
//     );
//   }
// }

class UserReturnItemsContainer extends StatelessWidget {
  final List<String> _list = [
    'Quality concerns',
    'Incorrect product',
    'Defective or damaged item',
  ];
  final Map items;
  final searchResult = [].obs;

  UserReturnItemsContainer({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController productController = items['productController'];
    TextEditingController quantityController = items['quantityController'];
    TextEditingController remarksController = items['remarksController'];
    var searchResult = items['searchResult'];

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
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for Product Selection
          Text(
            "Select Product",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: productController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Search products...",
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
            ),
            onChanged: (value) => searchQueryProducts(value),
          ),
          const SizedBox(height: 10),
          // Search Result List
          Obx(
            () => searchResult.isNotEmpty
                ? Container(
                    // color: Colors.black,
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchResult.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            productController.text =
                                searchResult[index]["product_name"];
                            searchResult.value = [];
                          },
                          child: ListTile(
                            leading: const Icon(Icons.shopping_basket_outlined,
                                color: Colors.blueAccent),
                            title: Text(
                              searchResult[index]["product_name"],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
          ),
          const SizedBox(height: 20),
          // Quantity Input
          Text(
            "Quantity",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter quantity",
            ),
          ),
          const SizedBox(height: 20),
          // Reason for Return Dropdown
          Text(
            "Reason for Return",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            value: _list[0],
            items: _list
                .map((reason) => DropdownMenuItem(
                      value: reason,
                      child: Text(reason),
                    ))
                .toList(),
            onChanged: (value) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Select reason",
            ),
          ),
          const SizedBox(height: 20),
          // Remarks TextField
          Text(
            "Additional Remarks",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: remarksController,
            maxLines: 5,
            maxLength: 250,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Describe reason for return...",
            ),
          ),
        ],
      ),
    );
  }
}
