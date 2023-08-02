import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';

@freezed
abstract class OrderState with _$OrderState {
  const factory OrderState.initial() = OrderStateInitial;
  const factory OrderState.loading() = OrderStateLoading;
  const factory OrderState.success({required OrderModel orderModel}) = OrderStateSuccess;
  const factory OrderState.updateSuccess() = OrderStateUpdateSuccess;
  const factory OrderState.updateError({required String error}) = OrderStateUpdateError;
  const factory OrderState.error({required String error}) =  OrderStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs