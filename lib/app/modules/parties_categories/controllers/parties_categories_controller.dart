import 'package:get/get.dart';

class PartiesCategoriesController extends GetxController {
  final count = 0.obs;
  var subCategory = ''.obs;
  var category = ''.obs;
  var isSelected = false.obs;
  var selectedProduct = [].obs;

  void toogleSelected(String productId) {
    checkDataInSelectedProduct(productId)
        ? selectedProduct.remove(productId)
        : selectedProduct.add(productId);
  }

  bool checkDataInSelectedProduct(String productId) {
    return selectedProduct.contains(productId);
  }

  var quantityIndex = 1.obs;
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
