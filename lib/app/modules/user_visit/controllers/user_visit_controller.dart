import 'package:get/get.dart';

class UserVisitController extends GetxController {
  var selectedVisitDate = Rx<DateTime?>(null);
  final count = 0.obs;
  var searchLocationResult = [].obs;
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
