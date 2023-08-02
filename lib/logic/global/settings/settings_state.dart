import 'package:forall_driver/data/models/global/settings/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'settings_state.freezed.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsStateInitial;
  const factory SettingsState.loading() = SettingsStateLoading;
  const factory SettingsState.success({required SettingsModel model}) = SettingsStateSuccess;
  const factory SettingsState.error({required String error}) = SettingsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 