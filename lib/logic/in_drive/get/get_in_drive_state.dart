import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
part 'get_in_drive_state.freezed.dart';

@freezed
abstract class GetInDriveState with _$GetInDriveState {
  const factory GetInDriveState.loading() = GetInDriveStateLoading;
  const factory GetInDriveState.initial(TripModelData data) = GetInDriveStateInitial;
  const factory GetInDriveState.success() = GetInDriveStateSuccess;
  const factory GetInDriveState.onUpdateSocket() = GetInDriveStateOnUpdateSocket;
  const factory GetInDriveState.updatePos(Position? p0) = GetInDriveStateUpdatePos;
  const factory GetInDriveState.error({required String error}) = GetInDriveStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs