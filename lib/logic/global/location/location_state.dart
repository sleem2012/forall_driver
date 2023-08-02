

import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_state.freezed.dart';
@freezed
abstract class LocationState with _$LocationState{
  const factory LocationState.initial() = LocationStateInitial;
  const factory LocationState.loading() = LocationStateLoading;
  const factory LocationState.success() = LocationStateSuccess;
  const factory LocationState.error({required String error}) = LocationStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 