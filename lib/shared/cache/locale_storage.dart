import 'package:flutter/foundation.dart';
import 'package:forall_driver/data/models/global/settings/settings_model.dart';
import 'package:forall_driver/data/models/user_info/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

class KStorageKeys {
  static const String themeMode = 'themeMode';
  static const String locale = 'locale';
  static const String lang = 'language';
  static const String langId = 'languageId';
  static const String currency = 'currency';
  static const String currencyId = 'currencyId';
  static const String token = 'token';
  static const String fcmToken = 'fcmToken';
  static const String userModel = 'userModel';
  static const String isSplashSeen = 'isSplashSeen';
  static const String selectedPaymentId = 'selectedPaymentId';
  static const String isOnline = 'isOnline';
  static const String location = 'location';
  static const String server = 'server';
  static const String settings = 'settings';
  static const String price = 'price';
  static const String range = 'range';
  static const String defaultMail = 'defaultMail';

}

class KStorage {
  KStorage();

  final GetStorage _storage = GetStorage();
  static KStorage i = _kStorage;

  static KStorage get _kStorage {
    if (GetIt.instance.isRegistered<KStorage>()) {
      return GetIt.instance.get<KStorage>();
    } else {
      GetIt.instance.registerLazySingleton(() => KStorage());
      return GetIt.instance.get<KStorage>();
    }
  }

  get erase async => await _storage.erase();

  setLang(String lang) => _storage.write(KStorageKeys.lang, lang);

  setServer(String? v) => _storage.write(KStorageKeys.server, v);

  String? get getServer => _storage.read(KStorageKeys.server);

  String? get getLang => _storage.read(KStorageKeys.lang);

  setLangId(int lang) => _storage.write(KStorageKeys.langId, lang);

  String? get getLangId => _storage.read(KStorageKeys.langId).toString();

  setCurrency(String currency) =>
      _storage.write(KStorageKeys.currency, currency);

  String? get getcurrency => _storage.read(KStorageKeys.currency);

  setCurrencyId(int currency) =>
      _storage.write(KStorageKeys.currencyId, currency);

  String? get getcurrencyId =>
      _storage.read(KStorageKeys.currencyId).toString();

  setPaymentId(int id) => _storage.write(KStorageKeys.selectedPaymentId, id);

  int? get getPaymentId => _storage.read(KStorageKeys.selectedPaymentId);

  setToken(String? token) => _storage.write(KStorageKeys.token, token);

  get delToken => _storage.remove(KStorageKeys.token);

  String? get getToken => _storage.read(KStorageKeys.token);

  setUserInfo(UserModel? model) => _storage.write(
      KStorageKeys.userModel, model?.toJson() as Map<String, dynamic>);

  setPrice(Price? model) {
    debugPrint(model?.min15);
    debugPrint(model?.min30);

    return _storage.write(
        KStorageKeys.price, model?.toJson() as Map<String, dynamic>);
  }

  setRange(Range? model) => _storage.write(
      KStorageKeys.range, model?.toJson() as Map<String, dynamic>);

  get delUserInfo => _storage.remove(KStorageKeys.userModel);

  UserModel? get getUserInfo {
    if (_storage.read(KStorageKeys.userModel) != null) {
      return UserModel.fromJson(_storage.read(KStorageKeys.userModel));
    } else {
      return null;
    }
  }

  Price? get getPrice {
    if (_storage.read(KStorageKeys.price) != null) {
      return Price.fromJson(_storage.read(KStorageKeys.price));
    } else {
      return null;
    }
  }

  Range? get getRange {
    if (_storage.read(KStorageKeys.range) != null) {
      return Range.fromJson(_storage.read(KStorageKeys.range));
    } else {
      return null;
    }
  }

  setIsSplashSeen() => _storage.write(KStorageKeys.isSplashSeen, true);

  bool get isSplashSeen => _storage.read(KStorageKeys.isSplashSeen) ?? false;

  setFcmToken(String? token) => _storage.write(KStorageKeys.fcmToken, token);

  String? get getFcmToken => _storage.read(KStorageKeys.fcmToken);

  setLocation(Position? location) =>
      _storage.write(KStorageKeys.location, location?.toJson());

  Position? get getLocation {
    debugPrint(
        '================= >>>> Location form cache  :${_storage.read(KStorageKeys.location)} ');
    if (_storage.read(KStorageKeys.location) != null) {
      return Position.fromMap(_storage.read(KStorageKeys.location));
    }
    return null;
  }

  setOnline(bool? isOnline) =>
      _storage.write(KStorageKeys.isOnline, isOnline ?? false);

  bool? get getOnline => _storage.read(KStorageKeys.isOnline);

  setSettings(SettingsModel? model) => _storage.write(
      KStorageKeys.settings, model?.toJson() as Map<String, dynamic>);

  SettingsModel? get getSettings {
    if (_storage.read(KStorageKeys.settings) != null) {
      return SettingsModel.fromJson(_storage.read(KStorageKeys.settings));
    } else {
      return null;
    }
  }

  setDefaultMail(String? email) => _storage.write(KStorageKeys.defaultMail, email);

  String? get getDefaultMail => _storage.read(KStorageKeys.defaultMail);
}
