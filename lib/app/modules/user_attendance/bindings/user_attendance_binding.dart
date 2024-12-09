import 'package:get/get.dart';

import '../controllers/user_attendance_controller.dart';

class UserAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAttendanceController>(
      () => UserAttendanceController(),
    );
  }
}
