import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/commission/commission_model.dart';
import 'package:forall_driver/data/repository/payment/payment_repo.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import 'get_commission_state.dart';
import '../../../extensions.dart';

class GetCommissionBloc extends Cubit<GetVendorCommissionState> {
  GetCommissionBloc({required this.payemntRepoImpl}) : super(const GetVendorCommissionState.loading());

  static GetCommissionBloc of(BuildContext context) => BlocProvider.of<GetCommissionBloc>(context);

  final CommissionRepoImpl payemntRepoImpl;
  CommissionModel? commissionModel;

  get({String? date}) async {
    try {
      emit(const GetVendorCommissionState.loading());
      final result = await payemntRepoImpl.getCommissions(date: date ?? selectedDate.toString().split(' ').first);
      result.fold(
        (l) {
          debugPrint('================= GetVendorCommission Bloc : ${KFailure.toError(l)}');
          emit(GetVendorCommissionState.error(error: KFailure.toError(l)));

        },
        (r) {
          debugPrint('================= GetVendorCommission Bloc : ${r.toString()}  ');
          commissionModel = r;
          emit(const GetVendorCommissionState.success());
        },
      );
    } catch (e) {
      debugPrint('================= GetVendorCommission Bloc (Catch): ${e.toString()} ');
      emit(GetVendorCommissionState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }


  List<MyBarChartData> get barChartData {
    List<MyBarChartData> l = [];
    for (var element in commissionModel?.general?.days ?? <Map<String, dynamic>>[]) {
      l.add(
        MyBarChartData(
          element.entries.toList().firstOrNull?.key ?? '',
          double.tryParse(element.entries.toList().firstOrNull?.value?.toString() ?? '') ?? 0.0,
        ),
      );
    }
    return l;
  }

  String get currency {
    if ((commissionModel?.data ?? []).isNotEmpty) {
      return commissionModel?.data?.first.currency ?? 'USD';
    } else if (commissionModel?.general?.pending != null) {
      return commissionModel?.general?.pending?.amount?.split(' ').last ?? "USD";
    } else if (commissionModel?.general?.completed != null) {
      return commissionModel?.general?.completed?.amount?.split(' ').last ?? "USD";
    } else {
      return "USD";
    }
  }

  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 1));
  DateTime lastDate = DateTime.now().subtract(const Duration(days: 1));
  pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: lastDate,
    );
    if (date != null && date != selectedDate) {
      selectedDate = date;
      debugPrint('================= ${selectedDate.toString().split(' ').first}');
      get(date: selectedDate.toString().split(' ').first);
    }
  }


  /// get _update {
  ///   emit(const GetVendorCommissionState.loading());
  ///   emit(const GetVendorCommissionState.success());
  /// }
}
