import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forall_driver/data/models/user_info/update_date.dart';

import '../../../../di.dart';
import '../../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../../packages/shared/api_client/endpoints.dart';
import '../../../../packages/shared/error/failures.dart';

abstract class UpdateRangeRepo {
  Future<Either<KFailure, UpdateDateModel>> updateRange({String? rangeLat, String? rangeLong, String? range});
}

class UpdateRangeRepoImpl implements UpdateRangeRepo {
  @override
  Future<Either<KFailure, UpdateDateModel>> updateRange({String? rangeLat, String? rangeLong, String? range}) async {
    final Map<String, dynamic> body = {'range[lang]': rangeLat, 'range[lat]': rangeLong, 'range[distance]': range, '_method': 'put'};
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.update_date, data: body);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(UpdateDateModel.fromJson(r)),
    );
  }
}
