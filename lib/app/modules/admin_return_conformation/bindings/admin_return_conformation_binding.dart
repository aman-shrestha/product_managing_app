import 'package:get/get.dart';

import '../controllers/admin_return_conformation_controller.dart';

class AdminReturnConformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminReturnConformationController>(
      () => AdminReturnConformationController(),
    );
  }
}
