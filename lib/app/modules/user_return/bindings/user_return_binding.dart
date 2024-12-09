import 'package:get/get.dart';

import '../controllers/user_return_controller.dart';

class UserReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserReturnController>(
      () => UserReturnController(),
    );
  }
}
