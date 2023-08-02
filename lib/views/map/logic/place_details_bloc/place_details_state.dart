import 'package:forall_driver/views/map/logic/model/place.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'place_details_state.freezed.dart';

@freezed
abstract class PlaceDetailsState with _$PlaceDetailsState{
  const factory PlaceDetailsState.initial() = PlaceDetailsStateInitial;
  const factory PlaceDetailsState.loading() =PlaceDetailsStateLoading;
  const factory PlaceDetailsState.error({String? error}) = PlaceDetailsStateError;
  const factory PlaceDetailsState.success({Place?place}) =PlaceDetailsStateSuccess;


}
