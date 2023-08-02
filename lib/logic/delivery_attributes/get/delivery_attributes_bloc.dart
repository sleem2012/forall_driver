import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/repository/delivery_attributes/delivery_attributes_repo.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'delivery_attributes_state.dart';

class DeliveryAttributesBloc extends Cubit<DeliveryAttributesState> {
  DeliveryAttributesBloc({required this.deliveryAttributesRepoImp}) : super(const DeliveryAttributesState.loading());

  static DeliveryAttributesBloc of(BuildContext context) => BlocProvider.of<DeliveryAttributesBloc>(context);
  final DeliveryAttributesRepoImp deliveryAttributesRepoImp;

  get() async {
    try {

      emit(const DeliveryAttributesState.loading());
      final result = await deliveryAttributesRepoImp.get_delivery_attributes();
      result.fold(
        (l) {
          debugPrint('================= DeliveryAttributes Bloc : $l');
          emit(DeliveryAttributesState.error(failure: l));
        },
        (r) {
          emit(DeliveryAttributesState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= DeliveryAttributes Bloc (Catch): ${e.toString()} ');
      emit(const DeliveryAttributesState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
      rethrow;
    }
  }
}
