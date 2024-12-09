import 'package:get/get.dart';

import '../controllers/user_order_history_controller.dart';

class UserOrderHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserOrderHistoryController>(
      () => UserOrderHistoryController(),
    );
  }
}
