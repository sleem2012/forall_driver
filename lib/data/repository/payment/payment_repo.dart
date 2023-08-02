import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forall_driver/data/models/commission/commission_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';

abstract class CommissionRepoAbs {
  Future<Either<KFailure, CommissionModel>> getCommissions({String? date});
}

class CommissionRepoImpl implements CommissionRepoAbs {
  @override
  Future<Either<KFailure, CommissionModel>> getCommissions({String? date}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.my_commission, params: {"range": date});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CommissionModel.fromJson(r)),
    );
  }
}
