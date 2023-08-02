import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/views/map/logic/location_helper.dart';
import 'package:forall_driver/views/map/logic/map_cubit/map_state.dart';
import 'package:forall_driver/views/map/logic/map_error/exceptions.dart';
import 'package:forall_driver/views/map/logic/map_repo/map_repo.dart';
import 'package:forall_driver/views/map/logic/model/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Cubit<MapState> {
  MapBloc() : super( const MapState.initial()){sp;}

  MapRepo mapRepo = MapRepo();

  static MapBloc of(context) => BlocProvider.of(context);

  Position? currentPosition;

  double? height = Get.height / 2.5;
  double? opacity = 1;

  Set<Marker> markers = {};
  Set<Polyline> polylinePoints = {};
  String? detailedAddress;

  String? darkMapStyle;
  String? lightMapStyle;
  LatLng? selectedPositionLatLang;

  get sp => LocationHelper.positionStream((p0) {
    emit(MapState.updatePosition(p0));
  });

  setSelectedPosition(LatLng value) {
    selectedPositionLatLang = value;
  }

  onMapTaped() {
    markers.add(Marker(
        markerId: const MarkerId('marker'),
        position: LatLng(selectedPositionLatLang?.latitude ?? 0,
            selectedPositionLatLang?.longitude ?? 0),
        infoWindow: InfoWindow(title: detailedAddress ?? '')));
    getDirections(
        LatLng(currentPosition!.latitude, currentPosition!.longitude),
        LatLng(selectedPositionLatLang?.latitude ?? 0,
            selectedPositionLatLang?.longitude ?? 0));
    _update;
  }

  BitmapDescriptor? currentIcon;

  getIcons() async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(devicePixelRatio: 3.2),
            "assets/images/mastercard.png")
        .then((value) => currentIcon = value);

    _update;
  }


  addCurrentMarker() async{
    final y = Marker(
      markerId: const MarkerId('currentLocation'),
      position: LatLng(KStorage.i.getLocation?.latitude ?? 0.0,
          KStorage.i.getLocation?.longitude ?? 0.0),
      infoWindow: const InfoWindow(title: 'currentLocation'),
      icon: BitmapDescriptor.defaultMarker,
      visible: true,
    );
    markers.add(y);
  }
  addMarkers(List<TripRoads> data) {
    // addCurrentMarker();
    List<String> upper =
        List.generate(26, (index) => String.fromCharCode(index + 65));
    for (int i = 0; i < data.length; i++) {
      final x = Marker(
        markerId: MarkerId(upper[i]),
        position: LatLng(double.tryParse(data[i].latitude ?? '') ?? 0,
            double.tryParse(data[i].longitude ?? '') ?? 0),
        infoWindow: InfoWindow(title: upper[i]),
        icon:BitmapDescriptor.defaultMarker,
        visible: true,
      );

      markers.add(x);
      debugPrint(x.toJson().toString());
    }

    debugPrint('00000000000000000${markers.length.toString()}');

    _update;
  }

  get _update {
    emit(const MapState.loading());
    emit(const MapState.initial());
  }

  controlWhenMove({LatLng? target}) {
    if (target != null) {
      selectedPositionLatLang = target;
    }
    if (height == 0) return;
    height = 0;
    opacity = 0;
    debugPrint('moving');
    emit(MapState.onCameraMove(height: height));
  }

  controlWhenStop() {
    // if (selectedPositionLatLang != null) {
    //   getDetailedAddress(selectedPositionLatLang!);
    // }
    if (height == Get.height / 2.5) return;
    opacity = 1;
    height = Get.height / 2.5;
    emit(MapState.onCameraMove(height: height));
  }

  Future<void> updateCameraLocation(LatLng source, LatLng destination,
      GoogleMapController mapController) async {
    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);

    return checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    mapController.animateCamera(cameraUpdate);
    LatLngBounds l1 = await mapController.getVisibleRegion();
    LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -70 || l2.southwest.latitude == -70) {
      return checkCameraLocation(cameraUpdate, mapController);
    }
    _update;
  }

  CameraPosition cameraPosition() {
    final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(
        currentPosition?.latitude ?? 0,
        currentPosition?.longitude ?? 0,
      ),
      zoom: 17,
    );
    return myCurrentLocationCameraPosition;
  }

  Completer<GoogleMapController> mapController = Completer();

  Future<void> getCurrentPosition(LatLng origin, LatLng destination) async {
    try {
      currentPosition =
          await LocationHelper.determinePosition().whenComplete(() {
        getDirections(origin, destination);
        emit(const MapState.success());
      });
    } on KExceptionLocationDenaid {
      emit(const MapState.error(error: 'Location Denied'));
    } on KExceptionLocationDenaidPermenetl {
      emit(const MapState.error(error: 'Location Denied Permanently'));
    } on KExceptionLocationDiabled {
      emit(const MapState.error(error: 'location Disabled'));
    } on KExceptionOffline {
      emit(const MapState.error(error: 'No Connection'));
    } catch (e) {
      // emit(const MapState.error(error: 'Something went wrong'));
    }
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition()));
  }

  Future<void> goToSelectedPlace(
      double? selectedLat, double? selectedLng) async {
    final GoogleMapController controller = await mapController.future;
    final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(selectedLat ?? 0, selectedLng ?? 0),
      zoom: 17,
    );
    controller.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
  }

  getDetailedAddress(LatLng location) async {
    emit(const MapState.loading());
    try {
      detailedAddress = await mapRepo.getDetailedAddress(location);
      emit(const MapState.success());
    } catch (e) {
      emit(const MapState.error(error: 'Something went wrong'));
    }
  }

  getDirections(LatLng origin, LatLng destination) async {
    emit(const MapState.loading());
    try {
      WayPointPolylineModel? wayPointPolylineModel =
          await mapRepo.getDirections(origin, destination);
      if (wayPointPolylineModel != null) {
        polylinePoints.add(
          Polyline(
              polylineId: PolylineId(origin.longitude.toString()),
              points: wayPointPolylineModel.polylinePoints,
              color: KColors.accentColorL,
              width: 5),
        );

        debugPrint('getDirections called');
        debugPrint(polylinePoints.length.toString());
        final GoogleMapController controller = await mapController.future;
        updateCameraLocation(origin, destination, controller);
        emit(const MapState.success());
      }
    } catch (e) {
      emit(const MapState.error());
    }
  }

  Future loadMapStyles(context) async {
    darkMapStyle = await rootBundle.loadString('assets/map_dark_theme.json');
    lightMapStyle = await rootBundle.loadString('assets/map_light_theme.json');
    setMapStyle(context);
  }

  Future setMapStyle(context) async {
    final controller = await mapController.future;
    if (Theme.of(context!).brightness == Brightness.light) {
      controller.setMapStyle(lightMapStyle);
      _update;
    } else {
      controller.setMapStyle(darkMapStyle);
      _update;
    }
  }
}
