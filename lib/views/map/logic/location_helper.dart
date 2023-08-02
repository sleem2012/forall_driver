import 'dart:async';
import 'package:flutter/material.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static double getDistance({required double lat2, required double lon2}) {
    double distance = Geolocator.distanceBetween(
          double.parse(KStorage.i.getLocation?.latitude.toString() ?? '0'),
          double.parse(KStorage.i.getLocation?.longitude.toString() ?? '0'),
          lat2,
          lon2,
        ) /
        1000;
    return distance;
  }

  static StreamSubscription<Position> positionStream(Function(Position?) onChange) => Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      )).listen(
        (Position? position) {
          onChange.call(position);
          KStorage.i.setLocation(position);
          debugPrint(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
        },
      );
}
