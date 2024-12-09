import 'package:get/get.dart';

import '../controllers/parties_user_profile_controller.dart';

class PartiesUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartiesUserProfileController>(
      () => PartiesUserProfileController(),
    );
  }
}
