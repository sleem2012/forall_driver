import 'package:forall_driver/data/models/global/currencies/currencies_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'currencies_state.freezed.dart';

@freezed
abstract class CurrenciesState with _$CurrenciesState {
  const factory CurrenciesState.initial() = CurrenciesStateInitial;
  const factory CurrenciesState.loading() = CurrenciesStateLoading;
  const factory CurrenciesState.success({required String? currencyDatum, required CurrenciesModel model}) = CurrenciesStateSuccess;
  const factory CurrenciesState.error({required String error}) = CurrenciesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 