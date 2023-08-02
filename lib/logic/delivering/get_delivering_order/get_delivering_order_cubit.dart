import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:forall_driver/data/models/order/update_order_model.dart';
import 'package:forall_driver/data/repository/delivering/delivering_repo.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/delivering/get_delivering_order/get_delivering_order_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:forall_driver/extensions.dart';

class GetDeliveringOrderBloc extends Cubit<GetDeliveringOrderState> {
  GetDeliveringOrderBloc({required this.deliveringRepoImp}) : super(const GetDeliveringOrderState.initial());

  static GetDeliveringOrderBloc of(context) => BlocProvider.of(context);
  GetDeliveringOrderModel? getDeliveringOrderModel;
  final DeliveringRepoImp deliveringRepoImp;

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  getDeliveringOrders() async {
    try {
      emit(const GetDeliveringOrderState.loading());

      final result = await deliveringRepoImp.getDeliveringOrders();
      result.fold(
        (l) {
          emit(GetDeliveringOrderState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= createDeliveringOrder  : $l  ');
        },
        (r) {
          getDeliveringOrderModel = r;
          emit(GetDeliveringOrderState.success(getDeliveringOrderModel: getDeliveringOrderModel!));
        },
      );
    } catch (e) {
      debugPrint('================= createDeliveringOrder  Ex : $e : ');
      emit(GetDeliveringOrderState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  init_delivering_socket() {
    debugPrint('================= init_socket for order-$my_id');
    Di.socket.on('my-orders_bill-$my_id', (data) {
      from_server(data);
    });
    debugPrint('=================> Server Connection State : ${Di.socket.connected} ');
  }

  from_server(json) {
    debugPrint('================= From Server : $json');
    DeliveringOrderData orderData = DeliveringOrderData.fromJson(json['value']);
    updateLocalState(data: orderData, orderState: orderData.state!);
    _update;
    debugPrint('============id===========>>>>>>>>${orderData.id.toString()} ');
  }

  updateLocalState({required DeliveringOrderData data, required String orderState}) {
    getDeliveringOrderModel = getDeliveringOrderModel?.copyWith(
      data: getDeliveringOrderModel?.data
        ?..removeWhere((element) => element.id == data.id)
        ..add(data.copyWith(state: orderState)),
    );
    _update;
  }

  List<DeliveringOrderData>? newOrders() {
    return getDeliveringOrderModel?.data?.where((element) => element.state == KSlugModel.lookingForRider).toList();
  }

  List<DeliveringOrderData>? statusOrder() {
    return getDeliveringOrderModel?.data
        ?.where((element) =>
            element.state == KSlugModel.pending ||
            element.state == KSlugModel.onDelivering ||
            element.state == KSlugModel.arrivedClient ||
            element.state == KSlugModel.completedCode ||
            element.state == KSlugModel.paymentNeeded)
        .toList();
  }

  List<DeliveringOrderData>? historyOrder() {
    return getDeliveringOrderModel?.data
        ?.where(
          (element) =>
              element.state == KSlugModel.completed ||
              element.state == KSlugModel.userNotFound ||
              element.state == KSlugModel.canceled ||
              element.state == KSlugModel.accident,
        )
        .toList();
  }

  @override
  close() async {
    Di.socket.off('my-orders_bill-$my_id');
    super.close();
  }

  get _update {
    emit(const GetDeliveringOrderState.loading());
    emit(GetDeliveringOrderState.success(getDeliveringOrderModel: getDeliveringOrderModel!));
  }

  TextEditingController paymentCtrl = TextEditingController();
  UpdateOrderModel updateOrderModel = UpdateOrderModel();

  updateOrder({required DeliveringOrderData data, required String OrderState, String? payment}) async {
    try {
      updateLocalState(data: data, orderState: OrderState);

      updateOrderModel = updateOrderModel.copyWith(shippingId: data.id, rider: my_id, state: OrderState, paymentValue: paymentCtrl.text);
      debugPrint(updateOrderModel.toJson().toString());
      final result = await deliveringRepoImp.UpdateOrders(updateOrderModel);
      result.fold(
        (l) {
          debugPrint('=================update orders fails :$l ');
          getDeliveringOrderModel =
              getDeliveringOrderModel?.copyWith(data: getDeliveringOrderModel?.data?.replaceWhere((element) => element.id == data.id, data));
          emit(GetDeliveringOrderState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('=================update orders  Success :$r ');
          emit(const GetDeliveringOrderState.updateSuccess());
          update_order_socket(orderId: data.id);
        },
      );
    } catch (e) {
      debugPrint('=================update Order  catch $e  ');
      emit(GetDeliveringOrderState.updateError(error: Tr.get.something_went_wrong));
    }
  }

  Future update_order_socket({
    required int? orderId,
  }) async {
    if (orderId != null && my_id != null) {
      await Di.socket.emit('order_bill', {"id": orderId, "type": "rider"});
      debugPrint('sent');
    }
  }
}
