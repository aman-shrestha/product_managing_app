import 'package:get/get.dart';

import '../controllers/admin_leave_conformation_controller.dart';

class AdminLeaveConformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminLeaveConformationController>(
      () => AdminLeaveConformationController(),
    );
  }
}
