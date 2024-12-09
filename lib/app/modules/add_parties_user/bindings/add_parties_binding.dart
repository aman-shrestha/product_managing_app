import 'package:get/get.dart';

import '../controllers/add_parties_controller.dart';

class AddPartiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPartiesController>(
      () => AddPartiesController(),
    );
  }
}
