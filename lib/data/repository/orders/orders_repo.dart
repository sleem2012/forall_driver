import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forall_driver/data/models/order/order_model.dart';

import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class OrdersRepoAbs {
  Future<Either<KFailure, OrderModel>> getOrders();

  Future<Either<KFailure, Unit>> updateOrder({
    required int shipping_id,
    required int riderId,
    required String state,
    required String? qrClient,
    required String? qrVendor,
  });
}

class OrdersRepoImp implements OrdersRepoAbs {
  @override
  Future<Either<KFailure, OrderModel>> getOrders() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.orders);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(OrderModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> updateOrder({
    required int shipping_id,
    required int riderId,
    required String state,
    String? qrClient,
    String? qrVendor,
  }) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.orders,
        params: {"shipping_id": shipping_id, "state": state, if (qrVendor != null) "qr_vendor": qrVendor, if (qrClient != null) "qr_client": qrClient, "rider": riderId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
