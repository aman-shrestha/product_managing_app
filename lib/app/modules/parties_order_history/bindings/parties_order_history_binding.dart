import 'package:get/get.dart';

import '../controllers/parties_order_history_controller.dart';

class PartiesOrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartiesOrderHistoryController>(
      () => PartiesOrderHistoryController(),
    );
  }
}
