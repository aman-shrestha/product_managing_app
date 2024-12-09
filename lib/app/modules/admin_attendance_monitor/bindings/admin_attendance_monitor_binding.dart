import 'package:get/get.dart';

import '../controllers/admin_attendance_monitor_controller.dart';

class AdminAttendanceMonitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAttendanceMonitorController>(
      () => AdminAttendanceMonitorController(),
    );
  }
}
