import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:product_ordering_app/app/modules/location/controllers/location_controller.dart';
import 'package:product_ordering_app/app/modules/user_attendance/controllers/user_attendance_controller.dart';

import 'location_handler.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final locationController = Get.put(LocationController());
  final userAttendance = Get.put(UserAttendanceController());
  String? _currentAddress;
  Position? _currentPosition;
  StreamSubscription<Position>? positionStream;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
        // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
        Text(_currentAddress ?? ""),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () async {
            _currentPosition = await LocationHandler.getCurrentPosition();
            _currentAddress =
                await LocationHandler.getAddressFromLatLng(_currentPosition!);
            setState(() {});
            // print(_currentPosition);
            locationController.latilong.value = _currentPosition;
          },
          child: const Text("Get Current Location"),
        ),
      ],
    );
  }
}
  // static Future<String?> getAddressFromLatLng(Position position) async {
  //   try {
  //     List<Placemark> placeMarks = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude,
  //     );
  //     Placemark place = placeMarks[0];
  //     // Customize the address format
  //     return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Starts location stream and updates position and address continuously
//   void _getLocationStream() {
//     positionStream = Geolocator.getPositionStream(
//       locationSettings: LocationSettings(
//         accuracy: LocationAccuracy.bestForNavigation,
//         distanceFilter: 10, // updates every 10 meters
//       ),
//     ).listen((Position position) async {
//       setState(() {
//         _currentPosition = position;
//       });
//       _currentAddress = await LocationHandler.getAddressFromLatLng(position);
//     });
//   }

//   // Cancel the stream when done
//   @override
//   void dispose() {
//     positionStream?.cancel();
//     super.dispose();
//   }
// }
