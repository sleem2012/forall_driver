import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_location_state.freezed.dart';

@freezed
abstract class UpdateLocationState with _$UpdateLocationState {
  const factory UpdateLocationState.initial() = UpdateLocationStateInitial;
  const factory UpdateLocationState.loading() = UpdateLocationStateLoading;
  const factory UpdateLocationState.success() = UpdateLocationStateSuccess;
  const factory UpdateLocationState.error({required String error}) =  UpdateLocationStateError;
}
// flutter pub run build_runner watch --delete-conflicting-output