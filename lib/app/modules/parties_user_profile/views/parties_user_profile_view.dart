import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/parties_user_profile_controller.dart';

class PartiesUserProfileView extends GetView<PartiesUserProfileController> {
  const PartiesUserProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PartiesUserProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PartiesUserProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
