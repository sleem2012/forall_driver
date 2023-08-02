import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:forall_driver/data/models/order/update_order_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/packages/shared/api_client/dio_client_helper.dart';
import 'package:forall_driver/packages/shared/api_client/endpoints.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

abstract class DeliveringRepoAbs {
  Future<Either<KFailure, GetDeliveringOrderModel>> getDeliveringOrders();
  Future<Either<KFailure, Unit>> UpdateOrders(UpdateOrderModel updateOrderModel);
}

class DeliveringRepoImp implements DeliveringRepoAbs {
  @override
  Future<Either<KFailure, GetDeliveringOrderModel>> getDeliveringOrders() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.DeliveringOrder);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(GetDeliveringOrderModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> UpdateOrders(UpdateOrderModel updateOrderModel) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.DeliveringOrder, params: updateOrderModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
