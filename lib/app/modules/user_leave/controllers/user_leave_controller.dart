import 'package:get/get.dart';

class UserLeaveController extends GetxController {
  var selectedDateFrom = Rx<DateTime?>(null);
  var selectedDateTo = Rx<DateTime?>(null);
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
