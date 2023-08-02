import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pass_state.freezed.dart';

@freezed
abstract class ChangePassState with _$ChangePassState {
  const factory ChangePassState.initial() = ChangePassStateInitial;
  const factory ChangePassState.loading() = ChangePassStateLoading;
  const factory ChangePassState.success() = ChangePassStateSuccess;
  const factory ChangePassState.error({required KFailure failure}) = ChangePassStateError;
}

// flutter pu