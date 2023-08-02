import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/user_info/user_model.dart';
import 'package:forall_driver/data/repository/delivery_attributes/delivery_attributes_repo.dart';
import 'package:forall_driver/logic/update_price/update_price_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class UpdatePriceCubit extends Cubit<UpdatePriceState> {
  UpdatePriceCubit({required this.deliveryAttributesRepoImp})
      : super(const UpdatePriceState.initial());

  static UpdatePriceCubit of(context) => BlocProvider.of(context);

  final DeliveryAttributesRepoImp deliveryAttributesRepoImp;

  TextEditingController price15Ctrl = TextEditingController();
  TextEditingController price30Ctrl = TextEditingController();
  TextEditingController price45Ctrl = TextEditingController();
  TextEditingController price60Ctrl = TextEditingController();

  setInitial(Price? price) {
    price15Ctrl.text = price?.min15 ?? '';
    price30Ctrl.text = price?.min30 ?? '';
    price45Ctrl.text = price?.min45 ?? '';
    price60Ctrl.text = price?.min60 ?? '';
  }

  UpdatePrice() async {
    emit(const UpdatePriceState.loading());
    try {
      final result = await deliveryAttributesRepoImp.updatePrice(
          price15: price15Ctrl.text,
          price30: price30Ctrl.text,
          price45: price45Ctrl.text,
          price60: price60Ctrl.text);
      result.fold(
        (l) {
          debugPrint('================= get Address (Bloc)  :$l ');
          emit(UpdatePriceState.error(error: KFailure.toError(l)));
        },
        (r) {
          KStorage.i.setPrice(r.data?.commercial?.price);
          emit(UpdatePriceState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= get Address (Bloc)  :$e ');
      emit(UpdatePriceState.error(error: Tr.get.something_went_wrong));
    }
  }
}
