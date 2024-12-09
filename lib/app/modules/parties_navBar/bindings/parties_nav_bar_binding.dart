import 'package:get/get.dart';

import '../controllers/parties_nav_bar_controller.dart';

class PartiesNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartiesNavBarController>(
      () => PartiesNavBarController(),
    );
  }
}
