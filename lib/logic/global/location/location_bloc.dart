import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/global/location/cities/cities_model.dart';
import 'package:forall_driver/data/models/global/location/countries/countries_model.dart';
import 'package:forall_driver/data/repository/global/global_repo.dart';
import 'package:forall_driver/logic/global/location/location_state.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class LocationBloc extends Cubit<LocationState> {
  LocationBloc({required this.globalRepoImpl}) : super(const LocationState.initial());

  static LocationBloc of(BuildContext context) {
    return BlocProvider.of<LocationBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;
  CountriesModel? countriesModel;
  CitiesModel? citiesModel;

  Future getCountries() async {
    emit(const LocationState.loading());
    try {
      final result = await globalRepoImpl.getCountries();
      result.fold(
        (l) {
          debugPrint('================= get Countries (Bloc)  :$l ');

          emit(LocationState.error(error: KFailure.toError(l)));
        },
        (r) {
          countriesModel = r;
          emit(const LocationState.success());
        },
      );
    } catch (e) {
      debugPrint('================= get Countries (Bloc)  :$e ');
      emit(LocationState.error(error: Tr.get.something_went_wrong));
    }
  }

  Future getCities(String countryId) async {
    emit(const LocationState.loading());
    try {
      final result = await globalRepoImpl.getCities(countryId);
      result.fold(
        (l) {
          debugPrint('================= get Cities (Bloc)  :$l ');

          emit(LocationState.error(error: KFailure.toError(l)));
        },
        (r) {
          citiesModel = r;
          emit(const LocationState.success());
        },
      );
    } catch (e) {
      debugPrint('================= get Cities (Bloc)  :$e ');
      emit(LocationState.error(error: Tr.get.something_went_wrong));
    }
  }
}
