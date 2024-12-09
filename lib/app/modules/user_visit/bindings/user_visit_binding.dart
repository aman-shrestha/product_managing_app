import 'package:get/get.dart';

import '../controllers/user_visit_controller.dart';

class UserVisitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserVisitController>(
      () => UserVisitController(),
    );
  }
}
