import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/global/location/adresses/adress_model.dart';
import 'package:forall_driver/data/repository/global/global_repo.dart';
import 'package:forall_driver/logic/global/adresses/address_state.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class AddressBloc extends Cubit<AddressState> {
  AddressBloc({required this.globalRepoImpl})
      : super(const AddressState.initial());

  static AddressBloc of(BuildContext context) {
    return BlocProvider.of<AddressBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;
  AddressModel? addressModel;

  Future getAddress() async {
    emit(const AddressState.loading());
    try {
      final result = await globalRepoImpl.getAddresses();
      result.fold(
        (l) {
          debugPrint('================= get Address (Bloc)  :$l ');

          emit(AddressState.error(error: KFailure.toError(l)));
        },
        (r) {
          addressModel = r;
          emit(AddressState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= get Address (Bloc)  :$e ');
      emit(AddressState.error(error: Tr.get.something_went_wrong));
    }
  }
}
