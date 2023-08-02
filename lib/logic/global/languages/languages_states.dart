import 'package:forall_driver/data/models/global/languages/languages_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'languages_states.freezed.dart';

@freezed
abstract class LanguagesState with _$LanguagesState {
  const factory LanguagesState.loading() = LanguagesStateLoading;
  const factory LanguagesState.success({String? langDatum, required LanguagesModel model}) = LanguagesStateSelect;
  const factory LanguagesState.error({required String erorr}) = LanguagesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 