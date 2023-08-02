import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../di.dart';
import '../../../dynamic_ui/model/dynamic_ui_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';
import '../../models/user_info/update_date.dart';

abstract class DeliveryAttributesRepoAbs {
  Future<Either<KFailure, List<DUIFieldModel>>> get_delivery_attributes();

  Future<Either<KFailure, Unit>> add_delivery_attributes(Map<String, dynamic> data);

  Future<Either<KFailure, UpdateDateModel>> updatePrice({String? price15, String? price30, String? price45, String? price60});
}

class DeliveryAttributesRepoImp implements DeliveryAttributesRepoAbs {
  @override
  Future<Either<KFailure, List<DUIFieldModel>>> get_delivery_attributes() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.get_delivery_attributes);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<DUIFieldModel> fields = [];
        List list = r["data"] as List;
        for (var v in list) {
          fields.add(DUIFieldModel.fromJson(v));
        }
        return right(fields);
      },
    );
  }

  @override
  Future<Either<KFailure, Unit>> add_delivery_attributes(Map<String, dynamic> data) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.add_delivery_attributes, data: data);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, UpdateDateModel>> updatePrice({String? price15, String? price30, String? price45, String? price60}) async {
    final Map<String, dynamic> body = {'price[min15]': price15, 'price[min30]': price30, 'price[min45]': price45, 'price[min60]': price60, '_method': 'put'};
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.update_date, data: body);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UpdateDateModel.fromJson(r)),
    );
  }
}
