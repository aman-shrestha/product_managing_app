import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/location/views/location_page.dart';

import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LocationView'),
        centerTitle: true,
      ),
      body: const Center(child: LocationPage()),
    );
  }
}
