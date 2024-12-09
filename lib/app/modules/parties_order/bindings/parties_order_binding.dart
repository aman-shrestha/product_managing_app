import 'package:get/get.dart';

import '../controllers/parties_order_controller.dart';

class PartiesOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartiesOrderController>(
      () => PartiesOrderController(),
    );
  }
}
