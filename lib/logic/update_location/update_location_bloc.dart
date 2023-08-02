import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/repository/global/global_repo.dart';
import 'package:forall_driver/logic/update_location/update_location_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/views/map/logic/location_helper.dart';
import 'package:forall_driver/views/map/logic/map_error/exceptions.dart';
import 'package:geolocator/geolocator.dart';

class UpdateLocationBloc extends Cubit<UpdateLocationState> {
  UpdateLocationBloc({required this.globalRepoImpl}) : super(const UpdateLocationState.initial());

  static UpdateLocationBloc of(context) => BlocProvider.of(context);
final GlobalRepoImpl globalRepoImpl;
  int? id = KStorage.i.getUserInfo?.data?.address?.id;



  Timer? timer;
  Position? currentPosition;

  Future<void> getCurrentPosition() async {
    try {
      currentPosition = await LocationHelper.determinePosition().whenComplete(() {
        debugPrint(id.toString());

        emit(const UpdateLocationState.success());
      });
      await updateAddress(id: id!, long: currentPosition!.longitude, lat: currentPosition!.latitude);
    } on KExceptionLocationDenaid {
      // emit(const UpdateLocationState.error(error: 'Location Denied'));
    } on KExceptionLocationDenaidPermenetl {
      // emit(const UpdateLocationState.error(
      //     error: 'Location Denied Permanently'));
    } on KExceptionLocationDiabled {
      // emit(const UpdateLocationState.error(error: 'location Disabled'));
    } on KExceptionOffline {
      // emit(const UpdateLocationState.error(error: 'No Connection'));
    } catch (e) {
      // debugPrint('from geolocation');
      // emit(const UpdateLocationState.error(error: 'Something went wrong'));
    }
  }

  updateAddress({required int id, required double lat, required double long}) async {
    try {
      emit(const UpdateLocationState.loading());
      final result = await globalRepoImpl.updateAddresses(id, lat, long);
      result.fold(
        (l) {
          debugPrint('================= get Address (Bloc)  :$l ');
          emit(UpdateLocationState.error(error: KFailure.toError(l)));
        },
        (r) {
          emit(const UpdateLocationState.success());
        },
      );
    } catch (e) {
      debugPrint('================= get Address (Bloc)  :$e ');
      emit(UpdateLocationState.error(error: Tr.get.something_went_wrong));
    }
  }

  periodicUpdate() {
    debugPrint('=============================================================${isOnline.toString()}');

    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      if (isOnline == true) {
        getCurrentPosition();
      }
    });
    // } else {
    //   return;
    // }
  }

  bool? isOnline = KStorage.i.getUserInfo?.data?.isOnline;

  setIsOnline(bool? Online) {
    isOnline = Online!;
    periodicUpdate();
    _update;
  }

  get _update {
    emit(const UpdateLocationState.loading());
    emit(const UpdateLocationState.initial());
  }
}
