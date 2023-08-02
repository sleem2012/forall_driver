import 'package:forall_driver/dynamic_ui/model/dynamic_ui_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../packages/shared/error/failures.dart';
part 'delivery_attributes_state.freezed.dart';

@freezed
abstract class DeliveryAttributesState with _$DeliveryAttributesState {
  const factory DeliveryAttributesState.loading() = DeliveryAttributesStateLoading;
  const factory DeliveryAttributesState.success(List<DUIFieldModel> fields) = DeliveryAttributesStateSuccess;
  const factory DeliveryAttributesState.error({required KFailure failure}) = DeliveryAttributesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs