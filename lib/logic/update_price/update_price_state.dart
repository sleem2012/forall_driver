import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/user_info/update_date.dart';

part 'update_price_state.freezed.dart';

@freezed
class UpdatePriceState with _$UpdatePriceState {
  const factory UpdatePriceState.initial() = UpdatePriceStateInitial;
  const factory UpdatePriceState.loading() = UpdatePriceStateLoading;
  const factory UpdatePriceState.success({required UpdateDateModel model}) = UpdatePriceStateSuccess;
  const factory UpdatePriceState.error({required String error}) =  UpdatePriceStateError;
}
// flutter pub run build_runner watch --delete-conflicting-output