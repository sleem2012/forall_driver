import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_commission_state.freezed.dart';

@freezed
abstract class GetVendorCommissionState with _$GetVendorCommissionState{
  const factory GetVendorCommissionState.loading() = GetVendorCommissionStateLoading;
  const factory GetVendorCommissionState.success() = GetVendorCommissionStateSuccess;
  const factory GetVendorCommissionState.error({required String error}) = GetVendorCommissionStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs