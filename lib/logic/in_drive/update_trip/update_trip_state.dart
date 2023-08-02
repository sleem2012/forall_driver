import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_trip_state.freezed.dart';

@freezed
abstract class UpdateTripState with _$UpdateTripState{
  const factory UpdateTripState.initial() = UpdateTripStateInitial;
  const factory UpdateTripState.loading() = UpdateTripStateLoading;
  const factory UpdateTripState.success() = UpdateTripStateSuccess;
  const factory UpdateTripState.error({required String error}) = UpdateTripStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 