import 'package:freezed_annotation/freezed_annotation.dart';
part 'dynamic_ui_states.freezed.dart';

@freezed
 class DynamicUiState with _$DynamicUiState {
  const factory DynamicUiState.initial(String? id) = _DynamicUiStateInitial;
  const factory DynamicUiState.loading(String? id) = _DynamicUiStateLoading;
  const factory DynamicUiState.update(String? id , {String? key}) = _DynamicUiStateUpdate;
}
 // flutter pub run build_runner watch --delete-conflicting-outputs