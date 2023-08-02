import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/repository/delivery_attributes/delivery_attributes_repo.dart';
import '../../../packages/shared/error/failures.dart';
import 'add_delivery_attr_state.dart';

class AddDeliveryAttrBloc extends Cubit<AddDeliveryAttrState> {
  AddDeliveryAttrBloc({required this.deliveryAttributesRepoImp}) : super(const AddDeliveryAttrState.initial());

  static AddDeliveryAttrBloc of(BuildContext context) => BlocProvider.of<AddDeliveryAttrBloc>(context);

  final DeliveryAttributesRepoImp deliveryAttributesRepoImp;
  add(Map<String, dynamic> data) async {
    try {
      emit(const AddDeliveryAttrState.loading());
      // final sorted = data.entries.toList()..sort((a, b) => (int.tryParse(a.key) ?? 0).compareTo((int.tryParse(b.key) ?? 0)));
      // final delivery_attrs = {
      //   "attribute_id": sorted.map((e) => [e.key]).toList(),
      //   "answer_collections": sorted.map((e) => e.value is List ? e.value : [e.value]).toList()
      // };
      final result = await deliveryAttributesRepoImp.add_delivery_attributes(data);
      result.fold(
        (l) {
          debugPrint('================= DeliveryAttributes Bloc : $l');
          emit(AddDeliveryAttrState.error(failure: l));
        },
        (r) {
          debugPrint('================= DeliveryAttributes Bloc : ${r.toString()}  ');
          emit(const AddDeliveryAttrState.success());
        },
      );
    } catch (e) {
      debugPrint('================= DeliveryAttributes Bloc (Catch): ${e.toString()} ');
      emit( const AddDeliveryAttrState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
