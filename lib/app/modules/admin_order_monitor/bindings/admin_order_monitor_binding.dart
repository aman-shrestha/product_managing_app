import 'package:get/get.dart';

import '../controllers/admin_order_monitor_controller.dart';

class AdminOrderMonitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminOrderMonitorController>(
      () => AdminOrderMonitorController(),
    );
  }
}
