import 'package:get/get.dart';

import '../controllers/admin_addproduct_controller.dart';

class AdminAddproductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAddproductController>(
      () => AdminAddproductController(),
    );
  }
}
