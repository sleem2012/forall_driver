import 'package:freezed_annotation/freezed_annotation.dart';
part 'range_state.freezed.dart';

@freezed
abstract class RangeState with _$RangeState{
  const factory RangeState.loading() =RangeStateLoading;
  const factory RangeState.initial() =RangeStateinitial;
  const factory RangeState.error({String? error}) = RangeStateError;
  const factory RangeState.success() =RangeStateSuccess;
  const factory RangeState.changeRange({required double range}) =RangeStateChangeRange;



}
// flutter pub run build_runner watch --delete-conflicting-outputs