import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/data/models/order/update_order_model.dart';
import 'package:forall_driver/data/repository/delivering/delivering_repo.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/delivering/update_order/update_delivering_order_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class UpdateDeliveringOrderBloc extends Cubit<UpdateDeliveringOrderState> {
  UpdateDeliveringOrderBloc({required this.deliveringRepoImp}) : super(const UpdateDeliveringOrderState.initial());

  static UpdateDeliveringOrderBloc of(context) => BlocProvider.of(context);

  UpdateOrderModel updateOrderModel = UpdateOrderModel();

  final DeliveringRepoImp deliveringRepoImp;
  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  updateOrder({required OrderData data}) async {
    try {
      emit(const UpdateDeliveringOrderState.loading());

      updateOrderModel = updateOrderModel.copyWith(shippingId: data.id, rider: my_id);
      // updateLocalState(data: data, orderState: state);
      final result = await deliveringRepoImp.UpdateOrders(updateOrderModel);
      result.fold(
        (l) {
          debugPrint('=================update orders fails :$l ');
          // orderModel = orderModel?.copyWith(data: orderModel?.data?.replaceWhere((element) => element.id == data.id, data));
          emit(UpdateDeliveringOrderState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('=================update orders  Success :$r ');
          emit(const UpdateDeliveringOrderState.success());
          update_order_socket(orderId: data.id);
        },
      );
    } catch (e) {
      debugPrint('=================update Order  catch $e  ');
      emit(UpdateDeliveringOrderState.error(error: Tr.get.something_went_wrong));
    }
  }

  Future update_order_socket({
    required int? orderId,
  }) async {
    if (orderId != null && my_id != null) {
      await Di.socket.emit('order', {"id": orderId, "type": "rider"});
      debugPrint('sent');
    }
  }
}
