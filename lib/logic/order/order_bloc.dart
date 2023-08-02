import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/data/repository/orders/orders_repo.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/extensions.dart';
import 'package:forall_driver/logic/order/order_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class OrderBloc extends Cubit<OrderState> {
  OrderBloc({required this.ordersRepoImp}) : super(const OrderState.initial());

  static OrderBloc of(context) => BlocProvider.of(context);

  final OrdersRepoImp ordersRepoImp;
  OrderModel? orderModel;

  getOrder() async {
    try {
      emit(const OrderState.loading());
      final result = await ordersRepoImp.getOrders();
      result.fold(
        (l) {
          debugPrint('=================My orders fails :$l ');
          emit(OrderState.error(error: KFailure.toError(l)));
        },
        (r) {
          orderModel = r;
          debugPrint('=================My orders  Success :$r ');
          emit(OrderState.success(orderModel: orderModel!));
        },
      );
    } catch (e) {
      debugPrint('=================My Order  catch $e  ');
      emit(OrderState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  init_socket() {
    debugPrint('================= init_socket for order-$my_id');
    Di.socket.on('my-orders-$my_id', (data) {
      from_server(data);
    });
    debugPrint('=================> Server Connection State : ${Di.socket.connected} ');
  }

  from_server(json) {
    debugPrint('================= From Server : $json');
    if (json['operation'] == null) {
      OrderData orderData = OrderData.fromJson(json['value']);
      updateLocalState(data: orderData, orderState: orderData.state!);
      debugPrint('============id===========>>>>>>>>${orderData.id.toString()} ');
    } else if (json['operation'] == 'remove') {
      removeLocal(id: json['order_id'] as int);
    }

    _update;
  }

  updateChatRoomId(int? orderId, int? chatId) {
    debugPrint('================= $orderId : $chatId ');
    final newOrderList = orderModel?.data?.map((e) {
          if (e.id == orderId) {
            return e.copyWith(vendorChatId: chatId);
          } else {
            return e;
          }
        }).toList() ??
        [];
    orderModel = orderModel?.copyWith(data: newOrderList);
    _update;
  }

  List<OrderData> get pendingOrders {
    List<OrderData>? orders = [];
    if (orderModel != null) {
      orders = orderModel?.data?.where((element) => element.state == 'looking_for_rider' || element.state == 'accident').toList();
    }

    return orders!;
  }

  List<OrderData> get preparingOrders {
    List<OrderData>? orders = [];
    if (orderModel != null) {
      orders = orderModel?.data?.where((element) => element.state == 'on_way' || element.state == 'arrived_vendor' || element.state == 'rider_verify_code').toList();
    }

    return orders!;
  }

  List<OrderData>get deliveryOrders {
    List<OrderData>? orders = [];
    if (orderModel != null) {
      orders = orderModel?.data?.where((element) => element.state == 'on_delivering' || element.state == 'arrived_client' || element.state == 'completed_code').toList();
    }
    return orders!;
  }

  List<OrderData>get completedOrders {
    List<OrderData>? orders = [];
    if (orderModel != null) {
      orders = orderModel?.data?.where((element) => element.state == 'completed' || element.state == 'user_not_found' || element.state == 'canceled').toList();
    }
    return orders!;
  }

  updateOrder({required int shipping_id, required String state, String? qrClient, String? qrVendor, required OrderData data}) async {
    try {
      // emit(const OrderState.loading());
      updateLocalState(data: data, orderState: state);
      final result = await ordersRepoImp.updateOrder(shipping_id: shipping_id, state: state, riderId: my_id ?? 0, qrClient: qrClient, qrVendor: qrVendor);
      result.fold(
        (l) {
          debugPrint('=================update orders fails :$l ');
          orderModel = orderModel?.copyWith(data: orderModel?.data?.replaceWhere((element) => element.id == data.id, data));
          emit(OrderState.updateError(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('=================update orders  Success :$r ');
          emit(const OrderState.updateSuccess());
          update_order_socket(orderId: shipping_id);
        },
      );
    } catch (e) {
      debugPrint('=================update Order  catch $e  ');
      emit(OrderState.updateError(error: Tr.get.something_went_wrong));
    }
  }

  Future update_order_socket({required int? orderId}) async {
    if (orderId != null && my_id != null) {
      await Di.socket.emit('order', {"shipping_order_id": orderId, "type": "rider"});
      debugPrint('sent');
    }
  }

  @override
  close() async {
    Di.socket.off('my-orders-$my_id');
    super.close();
  }

  updateLocalState({required OrderData data, required String orderState}) {
    orderModel = orderModel?.copyWith(
      data: orderModel?.data
        ?..removeWhere((element) => element.id == data.id)
        ..add(data.copyWith(state: orderState)),
    );
    _update;
  }

  removeLocal({required int id}) {
    orderModel = orderModel?.copyWith(data: orderModel?.data?..removeWhere((element) => element.id == id));
    _update;
  }

  get _update {
    emit(const OrderState.loading());
    emit(const OrderState.initial());
  }
}
