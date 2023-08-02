import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/models/user_info/user_model.dart';
import '../../../shared/location_helper.dart';
import '../../../shared/theme/colors.dart';
import '../../map/logic/map_error/exceptions.dart';
import 'range_state.dart';

class RangeCubit extends Cubit<RangeState> {
  RangeCubit() : super(const RangeState.initial());

  static RangeCubit of(context) => BlocProvider.of(context);
  Position? currentPosition;
  double zoom = 17;
  double radius = 5000.0;

  setRange(Range? range) {
    radius = double.tryParse(range?.range ?? '') ?? 5000.0;
  }

  GoogleMapController? _controller;

  // BitmapDescriptor? customMarker;
  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  CameraPosition cameraPosition() {
    final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(
        currentPosition?.latitude ?? 0,
        currentPosition?.longitude ?? 0,
      ),
      zoom: getZoomLevel(radius),
    );
    return myCurrentLocationCameraPosition;
  }

  Future<void> getCurrentPosition() async {
    try {
      currentPosition =
          await LocationHelper.determinePosition().whenComplete(() {
        emit(const RangeState.success());
      });
    } on KExceptionLocationDenaid {
      emit(const RangeState.error(error: 'Location Denied'));
    } on KExceptionLocationDenaidPermenetl {
      emit(const RangeState.error(error: 'Location Denied Permanently'));
    } on KExceptionLocationDiabled {
      emit(const RangeState.error(error: 'location Disabled'));
    } on KExceptionOffline {
      emit(const RangeState.error(error: 'No Connection'));
    } catch (e) {
      // emit(const MapState.error(error: 'Something went wrong'));
    }
  }

  increaseRadius() {
    radius += 1000;
    updateCameraZoom(radius);
    emit(RangeState.changeRange(range: radius));
  }

  decreaseRange() {
    if (radius == 5000) return;
    radius -= 1000;
    updateCameraZoom(radius);
    emit(RangeState.changeRange(range: radius));
  }

  double getZoomLevel(double radius) {
    double zoomLevel = 14;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    return zoomLevel;
  }

  updateCameraZoom(double radius) {
    _controller?.animateCamera(CameraUpdate.zoomTo(getZoomLevel(radius)));
  }

  Set<Circle> setCircle(context) {
    Set<Circle> circles = {
      Circle(
        fillColor: KColors.of(context).accentColor.withOpacity(0.5),
        strokeWidth: 1,
        strokeColor: Colors.blue,
        circleId: const CircleId('id'),
        center: LatLng(
            currentPosition?.latitude ?? 0, currentPosition?.longitude ?? 0),
        radius: radius,
      )
    };
    return circles;
  }
}
