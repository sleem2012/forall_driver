import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forall_driver/data/models/notifications.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';

abstract class NotificationsRepoAbs {
  Future<Either<KFailure, NotificationsModel>> getNotifications();

  Future<Either<KFailure, NotificationsData>> updateNotifications(int id);
}

class NotificationsRepoImpl implements NotificationsRepoAbs {
  @override
  Future<Either<KFailure, NotificationsModel>> getNotifications() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.notifications);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(NotificationsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, NotificationsData>> updateNotifications(int id) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.notifications, data: {'id': id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) {
      debugPrint(r.toString());
      return right(NotificationsData.fromJson(r['data']));
    });
  }
}
