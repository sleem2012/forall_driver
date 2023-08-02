import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forall_driver/data/models/global/currencies/currencies_model.dart';
import 'package:forall_driver/data/models/global/languages/languages_model.dart';
import 'package:forall_driver/data/models/global/location/adresses/adress_model.dart';
import 'package:forall_driver/data/models/global/location/cities/cities_model.dart';
import 'package:forall_driver/data/models/global/location/countries/countries_model.dart';
import 'package:forall_driver/data/models/global/settings/settings_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/packages/shared/api_client/dio_client_helper.dart';
import 'package:forall_driver/packages/shared/api_client/endpoints.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

abstract class _GlobalRepoAbs {
  Future<Either<KFailure, SettingsModel>> getSettings();

  Future<Either<KFailure, CountriesModel>> getCountries();

  Future<Either<KFailure, AddressModel>> getAddresses();

  Future<Either<KFailure, Unit>> updateAddresses(int id, double lat, double long);

  Future<Either<KFailure, CitiesModel>> getCities(String countryId);

  Future<Either<KFailure, LanguagesModel>> getLanguages();

  Future<Either<KFailure, CurrenciesModel>> getCurrencies();
}

class GlobalRepoImpl implements _GlobalRepoAbs {
  @override
  Future<Either<KFailure, SettingsModel>> getSettings() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.settings);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(SettingsModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CountriesModel>> getCountries() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.countries);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CountriesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, AddressModel>> getAddresses() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.addresses);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(AddressModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CitiesModel>> getCities(String countryId) async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.cities, params: {"country_id": countryId});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CitiesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, LanguagesModel>> getLanguages() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.lang);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(LanguagesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, CurrenciesModel>> getCurrencies() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.currencies);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(CurrenciesModel.fromJson(r)),
    );
  }

  @override
  Future<Either<KFailure, Unit>> updateAddresses(int id, double lat, double long) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.addresses, data: {"id": id, "latitude": lat, "longitude": long});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
