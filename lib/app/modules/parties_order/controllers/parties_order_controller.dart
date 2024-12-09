import 'package:get/get.dart';

class PartiesOrderController extends GetxController {
  var isSelected = false.obs;

  void toogleSelected() {
    isSelected.value = !isSelected.value;
  }

  var quantityIndex = 1.obs;
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
