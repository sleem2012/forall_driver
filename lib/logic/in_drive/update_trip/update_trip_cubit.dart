import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/data/models/in_drive/update_trip_model.dart';
import 'package:forall_driver/data/repository/in_drive/in_drive_repo.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_bloc.dart';
import 'package:forall_driver/logic/in_drive/update_trip/update_trip_state.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class UpdateTripCubit extends Cubit<UpdateTripState> {
  UpdateTripCubit({required this.inDriveRepoImp}) : super(const UpdateTripState.initial());

  static UpdateTripCubit of(context) => BlocProvider.of(context);

  final InDriveRepoImp inDriveRepoImp;

  UpdateTripModel updateTripModel = UpdateTripModel();

  setId(value) {
    updateTripModel = updateTripModel.copyWith(id: value);
  }

  setFare(value) {
    updateTripModel = updateTripModel.copyWith(fare: value);
  }

  setDriverId(value) {
    updateTripModel = updateTripModel.copyWith(driverId: value);
  }

  setState(value) {
    updateTripModel = updateTripModel.copyWith(state: value);
  }

  TripModel? tripModel;

  updateTrip({int? id, String? State, int? driver, String? fare, required BuildContext context}) async {
    setId(id);
    setFare(fare);
    setDriverId(driver);
    setState(State);
    try {
      emit(const UpdateTripState.loading());
      final result = await inDriveRepoImp.updateTrip(updateTripModel);
      result.fold(
        (l) {
          debugPrint('================= UpdateInDrive Bloc : ${KFailure.toError(l)}');
          emit(UpdateTripState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= UpdateInDrive Bloc : ${r.toString()}');
          emit(const UpdateTripState.success());
          socketEmit(order_id: r.data?.id ?? 0, state: r.data?.state ?? '');
          GetInDriveBloc.of(context).setSelectedOrderData(r.data!);
        },
      );
    } catch (e) {
      debugPrint('================= UpdateInDrive Bloc (Catch): ${e.toString()} ');

      emit(UpdateTripState.error(error: Tr.get.something_went_wrong));
    }
  }

  socketEmit({required int order_id, required String state}) {
    Di.socket.emit(
      'book_trip',
      {
        "id": order_id,
        "type": "driver",
        "data": {"state": state}
      },
    );
  }

  clear() {
    updateTripModel.driverId = null;
    updateTripModel.state = null;
    updateTripModel.id = null;
    // updateTripModel.cost=null;
    updateTripModel.fare = null;
    // _update;
  }
}
