import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'nav_enforcer_state.freezed.dart';


@freezed
abstract class NavEnforcerState with _$NavEnforcerState{
  const factory NavEnforcerState.loading() = NavEnforcerStateLoading;
  const factory NavEnforcerState.toSuccess({ String? msg, required Widget destination}) = NavEnforcerStateToSuccess;
  const factory NavEnforcerState.error({required String error}) = NavEnforcerStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs

