// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:product_ordering_app/app/constants/colors.dart';
import 'package:product_ordering_app/app/modules/location/views/location_handler.dart';

import '../../../constants/style.dart';
import '../../user_attendance/controllers/user_attendance_controller.dart';
import '../controllers/location_controller.dart';

class MapDisplay extends StatelessWidget {
  final locationController = Get.put(LocationController());
  final userAttendance = Get.put(UserAttendanceController());
  String? _currentAddress;
  Position? _currentPosition;
  StreamSubscription<Position>? positionStream;
  MapDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text('${_currentAddress ?? ""}'),
        Obx(() => Text(locationController.locationName.value)),
        const SizedBox(height: 20),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(
            () => GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  initialCenter: locationController.latilong.value != null
                      ? LatLng(
                          locationController.latilong.value!.latitude,
                          locationController.latilong.value!.longitude,
                        )
                      : const LatLng(27.6814, 85.3315),
                  initialZoom: 17,
                  // interactionOptions: const InteractionOptions(
                  //   flags: ~InteractiveFlag.doubleTapZoom,
                  // ),
                ),
                children: [
                  openStreetMapTileLayer,
                  MarkerLayer(
                    markers: [
                      if (locationController.latilong.value != null)
                        Marker(
                          point: LatLng(
                            locationController.latilong.value!.latitude,
                            locationController.latilong.value!.longitude,
                          ),
                          child: const Icon(
                            Icons.location_pin,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            _currentPosition = await LocationHandler.getCurrentPosition();
            _currentAddress =
                await LocationHandler.getAddressFromLatLng(_currentPosition!);


            locationController.latilong.value = _currentPosition;
            locationController.locationName.value = _currentAddress!;
          },
          child: Container(
              height: 50,
              width: double.infinity,
              color: AppColors.appbarBg,
              child: Center(
                child: Text(
                  "Tap to Set Location",
                  style: smallStyle.copyWith(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
