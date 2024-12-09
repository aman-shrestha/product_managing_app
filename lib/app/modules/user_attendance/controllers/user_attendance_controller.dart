import 'package:get/get.dart';

class UserAttendanceController extends GetxController {
  final count = 0.obs;
  var attendanceIndex = 0.obs;
  var selectedDateFrom = Rx<DateTime?>(null);
  var selectedDateTo = Rx<DateTime?>(null);
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
