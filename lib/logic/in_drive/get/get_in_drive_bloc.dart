import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/data/repository/in_drive/in_drive_repo.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/theme/logger.dart';
import 'package:forall_driver/views/map/logic/location_helper.dart';
import '../../../data/models/in_drive/get_in_drive_model.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import 'get_in_drive_state.dart';

class GetInDriveBloc extends Cubit<GetInDriveState> {
  GetInDriveBloc({required this.inDriveRepoImp})
      : super(const GetInDriveState.loading()) {
    get().whenComplete(() => sp);
  }

  static GetInDriveBloc of(BuildContext context) =>
      BlocProvider.of<GetInDriveBloc>(context);

  final InDriveRepoImp inDriveRepoImp;
  GetInDriveModel? getInDriveModel;

  get sp => LocationHelper.positionStream((p0) {
        printMap(p0?.toJson());
        emit(GetInDriveState.updatePos(p0));
      });

  Future<void> get() async {
    try {
      emit(const GetInDriveState.loading());
      final result = await inDriveRepoImp.get_in_drive();
      result.fold(
        (l) {
          debugPrint(
              '================= GetInDrive Bloc : ${KFailure.toError(l)}');
          emit(GetInDriveState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= GetInDrive Bloc : ${r.toString()}  ');
          getInDriveModel = r;
          emit(const GetInDriveState.success());
        },
      );
    } catch (e) {
      debugPrint('================= GetInDrive Bloc (Catch): ${e.toString()} ');
      emit(GetInDriveState.error(error: Tr.get.something_went_wrong));

      rethrow;
    }
  }

  List<TripModelData>? filterList() {
    return getInDriveModel?.data;
  }

 final plate =   KStorage.i.getUserInfo?.data?.rider?.commercial?.vehicle?.plate;

  Future update_order_socket({
    required int? orderId,
    required double? offer,
  }) async {
    if (orderId != null) {
      await Di.socket.emit('book_trip', {
        "id": orderId,
        "name": KStorage.i.getUserInfo?.data?.name,
        "image": KStorage.i.getUserInfo?.data?.image?.s128px,
        "user_id": KStorage.i.getUserInfo?.data?.id,
        "offer": offer,
        "created_at": DateTime.now().millisecondsSinceEpoch,
        "data": {
          "driver_lat": KStorage.i.getLocation?.latitude,
          "driver_lng": KStorage.i.getLocation?.longitude,
          "car_model": KStorage.i.getUserInfo?.data?.rider?.commercial?.vehicle?.model,
          "car_plate": '${plate?.left} ${plate?.middle} ${plate?.right} ${plate?.number}',
          "car_photo": KStorage.i.getUserInfo?.data?.rider?.commercial?.vehicle?.images?.front?.s128px,
          "car_type": KStorage.i.getUserInfo?.data?.rider?.commercial?.vehicle?.vehicleType,
        }
      });
      emit(const GetInDriveState.onUpdateSocket());

      debugPrint('sent$orderId');
    }
  }

  TripModelData? _selectedTripData;

  setSelectedOrderData(TripModelData data) {
    _selectedTripData = data;
    emit(GetInDriveState.initial(data));
  }

  TripModelData? get selectedTripData {
    return _selectedTripData;
  }

  int? get my_id => KStorage.i.getUserInfo?.data?.id;

  init_socket() {
    debugPrint('================= init_socket for myTaxi-$my_id');
    Di.socket.on('my-taxi-$my_id', (data) {
      from_server(data);
    });
    debugPrint(
        '=================> Server Connection State : ${Di.socket.connected} ');
  }

  from_server(json) {
    debugPrint('================= From Server : $json');
    if (json['operation'] == null) {
      TripModelData inDriveData = TripModelData.fromJson(json['value']);
      updateLocalState(data: inDriveData);
      debugPrint(
          '============id===========>>>>>>>>${inDriveData.id.toString()} ');
      setSelectedOrderData(inDriveData);



    } else if (json['operation'] == 'remove') {
      removeLocal(id: json['id'] as int, data: TripModelData().copyWith(state: "removed"));
    }
  }

  removeLocal({required int id, data}) {
    getInDriveModel = getInDriveModel?.copyWith(
        data: getInDriveModel?.data
          ?..removeWhere((element) => element.id == id));
    emit(GetInDriveState.initial(data));
  }

  updateLocalState({
    required TripModelData data,
  }) {
    getInDriveModel = getInDriveModel?.copyWith(
      data: getInDriveModel?.data?..insert(0, data),
    );
    debugPrint('==========,,,,,,,, ${data.userId?.address?.latitude}');
    debugPrint('==========,,,,,,,, ${data.userId?.address?.longitude}');
    emit(GetInDriveState.initial(data));
  }

  @override
  close() async {
    Di.socket.off('my-taxi-$my_id');
    super.close();
  }
}
