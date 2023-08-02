import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState{
  const factory MapState.loading() = MapStateLoading;
  const factory MapState.initial() = MapStateinitial;
  const factory MapState.error({String? error}) = MapStateError;
  const factory MapState.success() = MapStateSuccess;
  const factory MapState.updatePosition(Position? p0) = MapStateUpdatePosition;
  const factory MapState.onCameraMove({double? height}) = MapStateOnCameraMove;


}

// class MapInitial extends MapState {}
// class MapLoading extends MapState {}
// class MapCameraMoved extends MapState {
//   final double h ;
//
//   MapCameraMoved(this.h);
// }
// class MapGetLocationSuccess extends MapState {}
// class MapGetDetailedAddressSuccess extends MapState {}
// class MapGetDirectionsSuccess extends MapState {}
// class MapDarkSuccess extends MapState {}
// class MapLightSuccess extends MapState {}
// class MapError extends MapState {}
// class PickLocationError extends MapState {
//   final String h ;
//
//   PickLocationError(this.h);
// }
