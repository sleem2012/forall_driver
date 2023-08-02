import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Position? currentLocation;

  static Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    currentLocation = await Geolocator.getCurrentPosition();
    return currentLocation;
  }

  static double getDistance(
      {required double lat1,
      required double lng1,
      required double lat2,
      required double lng2}) {
    double distance = Geolocator.distanceBetween(
          lat1,
          lng1,
          lat2,
          lng2,
        ) /
        1000;
    return distance;
  }

  static StreamSubscription<Position> positionStream(
          Function(Position?) onChange) =>
      Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      )).listen(
        (Position? position) {
          onChange.call(position);
          // KStorage.i.setLocation(position);
          debugPrint(position == null
              ? 'Unknown'
              : '${position.latitude.toString()}, ${position.longitude.toString()}');
        },
      );
}
