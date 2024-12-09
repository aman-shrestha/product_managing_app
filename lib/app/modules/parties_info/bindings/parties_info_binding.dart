import 'package:get/get.dart';

import '../controllers/parties_info_controller.dart';

class PartiesInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartiesInfoController>(
      () => PartiesInfoController(),
    );
  }
}
