import 'package:get/get.dart';

import '../controllers/user_leave_controller.dart';

class UserLeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserLeaveController>(
      () => UserLeaveController(),
    );
  }
}
