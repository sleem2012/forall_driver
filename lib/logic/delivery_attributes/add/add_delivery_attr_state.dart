import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_delivery_attr_state.freezed.dart';

@freezed
abstract class AddDeliveryAttrState with _$AddDeliveryAttrState {
  const factory AddDeliveryAttrState.initial() = AddDeliveryAttrStateInitial;
  const factory AddDeliveryAttrState.loading() = AddDeliveryAttrStateLoading;
  const factory AddDeliveryAttrState.success() = AddDeliveryAttrStateSuccess;
  const factory AddDeliveryAttrState.error({ required KFailure failure}) = AddDeliveryAttrStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs