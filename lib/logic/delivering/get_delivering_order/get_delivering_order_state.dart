import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_delivering_order_state.freezed.dart';

@freezed
abstract class GetDeliveringOrderState with _$GetDeliveringOrderState{
  const factory GetDeliveringOrderState.loading() = GetDeliveringOrderStateLoading;
  const factory GetDeliveringOrderState.initial() =GetDeliveringOrderStateInitial;
  const factory GetDeliveringOrderState.error({String? error}) = GetDeliveringOrderStateError;
  const factory GetDeliveringOrderState.success({required GetDeliveringOrderModel getDeliveringOrderModel}) = GetDeliveringOrderStateSuccess;
  const factory GetDeliveringOrderState.updateSuccess() = GetDeliveringOrderStateUpdateSuccess;
  const factory GetDeliveringOrderState.updateError({required String error}) = GetDeliveringOrderStateUpdateError;
}