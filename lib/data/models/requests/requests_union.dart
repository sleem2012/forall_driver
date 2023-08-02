import 'package:freezed_annotation/freezed_annotation.dart';
part 'requests_union.freezed.dart';

@freezed
abstract class RequestsState with _$RequestsState {
  const factory RequestsState.pending() = RequestsStatePending;
  const factory RequestsState.preparing() = RequestsStatePreparing;
  const factory RequestsState.delivery() = RequestsStateDelivery;
  const factory RequestsState.history() = RequestsStateHistory;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 