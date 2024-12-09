import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';

class UserOrderController extends GetxController {
  var selectedDateFrom = Rx<DateTime?>(null);
  var selectedDateTo = Rx<DateTime?>(null);
  RxList displaySelectedProducts = [].obs;
  var selectedProduct = [].obs;
  var selectedProductTow = [].obs;
  Map submittedList = {}.obs;
  var searchResult = [].obs;
  var searchResultDetails = [].obs;
  var partiesList = [].obs; //NOT USED (FOR STORING MULTIPLE PARTIES)

  final productController = TextEditingController();
  final quantityController = TextEditingController(text: "1");

  void searchResultOnclick(int index) {
    // searchResultDetails.clear();
    productController.text = searchResult[index]["product_name"];
    // selectedProductDetails.value = searchResult[index];
    submittedList = {
      "product_id": searchResult[index]["product_id"],
      "product_name": searchResult[index]["product_name"],
      "VAT": searchResult[index]["VAT"],
      "discount": searchResult[index]["discount"],
      "sell_price": searchResult[index]["sell_price"],
      "total_price": searchResult[index]["total_price"],
      "product_image": searchResult[index]["product_image"][0],
      "quantity": '0',
    };

    // print(submittedList);

    //quantityController.text
    searchResultDetails.add(
      {
        "product_id": searchResult[index]["product_id"],
        "product_name": searchResult[index]["product_name"],
        "VAT": searchResult[index]["VAT"],
        "discount": searchResult[index]["discount"],
        "sell_price": searchResult[index]["sell_price"],
        "total_price": 1,
        "product_image": searchResult[index]["product_image"][0]
      },
    );
    quantityOnclick(1);
    // print(searchResultDetails);
    // displaySelectedProducts.add(
    //   {
    //     "product_id": searchResult[index]["product_id"],
    //     "product_name": searchResult[index]
    //         ["product_name"],
    //     "VAT": searchResult[index]["VAT"],
    //     "discount": searchResult[index]["discount"],
    //     "sell_price": searchResult[index]["sell_price"],
    //     "total_price": searchResult[index]["total_price"],
    //     "product_image": searchResult[index]
    //         ["product_image"][0],
    //     "quantity": quantityController.text,
    //   },
    // );

    searchResult.value = [];
    //productController.text = "";
  }

  void addProductOnClick() {
    if (quantityController.text.isNotEmpty) {
      // Check if the product is already in the displaySelectedProducts list
      bool exists = displaySelectedProducts.any(
          (product) => product["product_id"] == submittedList["product_id"]);

      if (!exists) {
        // Add the product if it doesn't already exist
        submittedList.update("quantity", (value) => quantityController.text);
        submittedList.update(
            "total_price", (value) => searchResultDetails[0]["total_price"]);
        // print(submittedList);
        displaySelectedProducts.add(submittedList);

        Get.showSnackbar(
          const GetSnackBar(
            title: "Product Added Successfully",
            message: 'Go down to view the product',
            icon: Icon(Icons.check),
            duration: Duration(seconds: 3),
            backgroundColor: AppColors.green,
          ),
        );

        // Clear inputs and reset states
        productController.clear();
        searchResult.clear();
        searchResultDetails.clear();
        quantityController.clear();
      } else {
        // Find the product in the list
        var existingProduct = displaySelectedProducts.firstWhere(
            (product) => product["product_id"] == submittedList["product_id"]);

        // Update the quantity
        int existingQuantity = int.parse(existingProduct["quantity"]);
        int newQuantity = existingQuantity + int.parse(quantityController.text);

        existingProduct["quantity"] = newQuantity.toString();

        // Recalculate the total price
        int initialTotalValue = existingProduct["sell_price"];
        num quantityInitialTotalValue = initialTotalValue * newQuantity;

        num totalPrice = quantityInitialTotalValue +
            (quantityInitialTotalValue * (existingProduct["VAT"] / 100));
        existingProduct["total_price"] =
            totalPrice - (totalPrice * (existingProduct["discount"] / 100));

        // Refresh the list to update the UI
        displaySelectedProducts.refresh();

        // Clear inputs and reset states
        productController.clear();
        searchResult.clear();
        searchResultDetails.clear();
        quantityController.clear();

        Get.showSnackbar(
          const GetSnackBar(
            title: "Duplicate Product",
            message: 'Updated the quantity for the existing product',
            icon: Icon(Icons.info),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } else {
      // Show error snackbar if quantity is not provided
      Get.showSnackbar(
        const GetSnackBar(
          title: "ERROR",
          message: 'Enter full credentials',
          icon: Icon(Icons.error),
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.red,
        ),
      );
    }
  }

  void quantityOnclick(quantity) {
    int initialTotalValue = searchResultDetails[0]["sell_price"];
    num quantityInitialTotalValue = initialTotalValue * quantity;
    searchResultDetails[0]["total_price"] = initialTotalValue;
    num a = (quantityInitialTotalValue +
        quantityInitialTotalValue * (searchResultDetails[0]["VAT"] / 100));
    searchResultDetails[0]["total_price"] =
        a - (a * (searchResultDetails[0]["discount"] / 100));
    searchResultDetails.refresh();
  }

  void submitedQuantityOnclick(int index, int quantity) {
    var product =
        displaySelectedProducts[index]; // Get the product at the given index
    int initialTotalValue = product["sell_price"];

    // Calculate the new total price based on the quantity
    num quantityInitialTotalValue = initialTotalValue * quantity;

    num b = quantityInitialTotalValue +
        (quantityInitialTotalValue * (product["VAT"] / 100));
    product["total_price"] = b - (b * (product["discount"] / 100));
    // Refresh the list to update the UI
    displaySelectedProducts.refresh();
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in displaySelectedProducts) {
      totalPrice += product["total_price"] ??
          0.0; // Add total_price if it exists, otherwise 0.0
    }
    return totalPrice;
  }
  // void toogleSelected(String productId) {
  //   checkDataInSelectedProduct(productId)
  //       ? selectedProduct.remove(productId)
  //       : selectedProduct.add(productId);
  // }

  // bool checkDataInSelectedProduct(String productId) {
  //   return selectedProduct.contains(productId);
  // }

  final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;
}
