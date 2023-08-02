import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/user_info/update_date.dart';
part 'update_range_state.freezed.dart';

@freezed
abstract class UpdateRangeState with _$UpdateRangeState{
  const factory UpdateRangeState.loading() =UpdateRangeStateLoading;
  const factory UpdateRangeState.initial() =UpdateRangeStateinitial;
  const factory UpdateRangeState.error({String? error}) = UpdateRangeStateError;
  const factory UpdateRangeState.success({required UpdateDateModel model}) = UpdateRangeStateSuccess;




}
// flutter pub run build_runner watch --delete-conflicting-outps