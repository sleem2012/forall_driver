import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_delivering_order_state.freezed.dart';

@freezed
abstract class UpdateDeliveringOrderState with _$UpdateDeliveringOrderState {
  const factory UpdateDeliveringOrderState.loading() = UpdatetDeliveringOrderStateLoading;
  const factory UpdateDeliveringOrderState.initial() = UpdateDeliveringOrderStateInitial;
  const factory UpdateDeliveringOrderState.error({String? error}) = UpdateDeliveringOrderStateError;
  const factory UpdateDeliveringOrderState.success() = UpdateDeliveringOrderStateSuccess;
}
