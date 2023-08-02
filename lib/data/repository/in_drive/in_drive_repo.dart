import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/data/models/in_drive/get_in_drive_model.dart';
import 'package:forall_driver/data/models/in_drive/update_trip_model.dart';

import '../../../di.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';
import '../../../packages/shared/error/failures.dart';

abstract class InDriveRepoAbs {
  Future<Either<KFailure, GetInDriveModel>> get_in_drive();
  Future<Either<KFailure, TripModel>> updateTrip(UpdateTripModel model);
}

class InDriveRepoImp implements InDriveRepoAbs {
  @override
  Future<Either<KFailure, GetInDriveModel>> get_in_drive() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.in_drive);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(GetInDriveModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, TripModel>> updateTrip(UpdateTripModel model) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.in_drive, data: model.toMap());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(TripModel.fromJson(r)),
    );
  }
}
