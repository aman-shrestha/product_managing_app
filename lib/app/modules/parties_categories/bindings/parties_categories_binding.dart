import 'package:get/get.dart';

import '../controllers/parties_categories_controller.dart';

class PartiesCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartiesCategoriesController>(
      () => PartiesCategoriesController(),
    );
  }
}
