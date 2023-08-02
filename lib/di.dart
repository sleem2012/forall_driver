import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:forall_driver/data/repository/auth/auth_repo.dart';
import 'package:forall_driver/data/repository/delivering/delivering_repo.dart';
import 'package:forall_driver/data/repository/delivery_attributes/delivery_attributes_repo.dart';
import 'package:forall_driver/data/repository/global/global_repo.dart';
import 'package:forall_driver/data/repository/notifications/notificaions_repo.dart';
import 'package:forall_driver/data/repository/payment/payment_repo.dart';
import 'package:forall_driver/logic/auth/change_pass/change_pass_cubit.dart';
import 'package:forall_driver/logic/auth/forget_pass/forget_pass_bloc.dart';
import 'package:forall_driver/logic/auth/login/login_bloc.dart';
import 'package:forall_driver/logic/auth/logout/logout_bloc.dart';
import 'package:forall_driver/logic/auth/register/register_bloc.dart';
import 'package:forall_driver/logic/auth/reset_pass/reset_pass_bloc.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_bloc.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_bloc.dart';
import 'package:forall_driver/logic/auth/verfiy_code/verfiy_code_bloc.dart';
import 'package:forall_driver/logic/delivering/update_order/update_delivering_order_bloc.dart';
import 'package:forall_driver/logic/delivery_attributes/add/add_delivery_attr_bloc.dart';
import 'package:forall_driver/logic/delivery_attributes/get/delivery_attributes_bloc.dart';
import 'package:forall_driver/logic/get_commission/get_commission_bloc.dart';
import 'package:forall_driver/logic/global/adresses/address_bloc.dart';
import 'package:forall_driver/logic/global/currencies/currencies_bloc.dart';
import 'package:forall_driver/logic/global/languages/langugese_bloc.dart';
import 'package:forall_driver/logic/global/location/location_bloc.dart';
import 'package:forall_driver/logic/global/settings/settings_bloc.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_bloc.dart';
import 'package:forall_driver/logic/in_drive/update_trip/update_trip_cubit.dart';
import 'package:forall_driver/logic/main_view/main_view_bloc.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/logic/notifications/get_notifications/get_notifications_bloc.dart';
import 'package:forall_driver/logic/theme/theme_cubit.dart';
import 'package:forall_driver/logic/update_location/update_location_bloc.dart';
import 'package:forall_driver/logic/update_price/update_price_cubit.dart';
import 'package:forall_driver/main.dart';
import 'package:forall_driver/packages/chat/logic/msg_bloc/messages_bloc.dart';
import 'package:forall_driver/packages/chat/logic/rooms_bloc/chat_rooms_bloc.dart';
import 'package:forall_driver/packages/payment/logic/add_card_bloc/add_payment_card_bloc.dart';
import 'package:forall_driver/packages/payment/logic/add_payment_bloc/add_payment_bloc.dart';
import 'package:forall_driver/packages/payment/logic/get_my_payment_bloc/get_my_payment_bloc.dart';
import 'package:forall_driver/packages/payment/logic/get_tyeps_bloc/get_payment_type_bloc.dart';
import 'package:forall_driver/shared/observer.dart';
import 'package:forall_driver/views/map/logic/place_details_bloc/place_details_bloc.dart';
import 'package:forall_driver/views/range/update_range_cubit/update_range_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'data/repository/in_drive/in_drive_repo.dart';
import 'data/repository/orders/orders_repo.dart';
import 'logic/delivering/get_delivering_order/get_delivering_order_cubit.dart';
import 'logic/order/order_bloc.dart';
import 'logic/pick_image/pick_image_cubit.dart';
import 'packages/payment/logic/get_banks/get_banks_bloc.dart';
import 'packages/shared/api_client/api_client_impl.dart';
import 'packages/shared/api_client/endpoints.dart';
import 'packages/shared/api_midleware_bloc/api_client_bloc.dart';
import 'packages/shared/picker/logic/country_search_cubit/country_search_cubit.dart';
import 'shared/notifications_ctrl.dart/notifications_ctrl.dart';
import 'shared/socket/socket_ctrl.dart';
import 'views/map/logic/map_cubit/map_bloc.dart';
import 'views/range/data/update_range/update_range_repo.dart';

abstract class Di {
  static final GetIt _i = GetIt.instance;

  static reset(context) async {
    await _unReg();
    RestartWidget.restartApp(context);
    await _i.resetScope(dispose: true);
    _reg();
  }

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    Bloc.observer = MyBlocObserver();
    await NotificationCtrl.fcm_init('Forall Driver');

    _reg();
  }

  static _reg() {
    _i.registerSingleton<SocketCtrl>(SocketCtrl(KEndPoints.socket)..init);
    _i.registerLazySingleton(() => Connectivity());
    _i.registerLazySingleton(() => ThemeBloc());
    _i.registerLazySingleton(() => ApiClientBloc());
    _i.registerLazySingleton(() => NavEnforcerBloc(_i()));
    _i.registerLazySingleton(() => ImagePicker());
    _i.registerFactory(() => CurrenciesBloc( _i()));
    _i.registerFactory(() => MapBloc());
    _i.registerFactory(() => PlaceDetailsBloc());
    _i.registerFactory(() => LanguagesBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => SettingsBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => AddressBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => OrderBloc(ordersRepoImp: _i()));
    _i.registerFactory(() => PickImageCubit());
    _i.registerFactory(() => ChangePassCubit(authRepoImpl: _i()));
    _i.registerFactory(() => LocationBloc(globalRepoImpl: _i()));
    _i.registerFactory(() => NotificationsBloc(notificationsRepoImpl: _i()));
    _i.registerFactory(() => UpdateDeliveringOrderBloc(deliveringRepoImp: _i()));
    _i.registerFactory(() => RegisterBloc(authRepoImpl: _i()));
    _i.registerFactory(() => LoginBloc(authRepoImpl: _i()));
    _i.registerFactory(() => VerfiyCodeBloc(authRepoImpl: _i()));
    _i.registerFactory(() => GetDeliveringOrderBloc(deliveringRepoImp: _i()));
    _i.registerFactory(() => ForgetPasswordBloc(authRepoImpl: _i()));
    _i.registerFactory(() => LogoutBloc(authRepoImpl: _i()));
    _i.registerFactory(() => ResetPasswordBloc(authRepoImpl: _i()));
    _i.registerFactory(() => UserInfoBloc(authRepoImpl: _i()));
    _i.registerFactory(() => UpdateUserBloc(authRepoImpl: _i()));
    _i.registerLazySingleton(() => MainViewBloc());
    _i.registerLazySingleton(() => UpdateLocationBloc(globalRepoImpl: _i()));
    _i.registerLazySingleton(() => EmojiParser());

    _i.registerFactory(() => DeliveryAttributesBloc(deliveryAttributesRepoImp: _i()));
    _i.registerFactory(() => AddDeliveryAttrBloc(deliveryAttributesRepoImp: _i()));
    _i.registerFactory(() => GetCommissionBloc(payemntRepoImpl: _i()));
    _i.registerFactory(() => AddCardBloc());
    _i.registerFactory(() => AddPaymentTypeBloc());
    _i.registerFactory(() => MyPaymentsBloc());
    _i.registerFactory(() => GetPaymentTypeBloc());
    _i.registerFactory(() => CountrySearchCubit());
    _i.registerFactory(() => UpdatePriceCubit(deliveryAttributesRepoImp: _i()));
    _i.registerFactory(() => UpdateRangeCubit(updateRangeRepoImpl: _i()));
    _i.registerFactory(() => GetBanksBloc());

    ///Repo
    _i.registerFactory(() => OrdersRepoImp());

    _i.registerLazySingleton(() => DioClientImpl(apiClientBloc: _i()));
    _i.registerLazySingleton(() => GlobalRepoImpl());
    _i.registerLazySingleton(() => AuthRepoImpl());
    _i.registerLazySingleton(() => NotificationsRepoImpl());
    _i.registerLazySingleton(() => DeliveryAttributesRepoImp());
    _i.registerLazySingleton(() => DeliveringRepoImp());
    _i.registerLazySingleton(() => CommissionRepoImpl());
    _i.registerLazySingleton(() => UpdateRangeRepoImpl());

    ///Chat=========================================================================
    _i.registerFactory(() => MessagesBloc());
    _i.registerFactory(() => ChatRoomsBloc());
    // ==============================================================================

    //indrive
    _i.registerLazySingleton(() => InDriveRepoImp());
    _i.registerFactory(() => GetInDriveBloc(inDriveRepoImp: _i()));
    _i.registerFactory(() => UpdateTripCubit(inDriveRepoImp: _i()));
  }

  static _unReg() async {
    await _i.unregister<Connectivity>();
    await _i.unregister<MainViewBloc>();
    await _i.unregister<ThemeBloc>();
    await _i.unregister<MapBloc>();
    await _i.unregister<GetBanksBloc>();
    await _i.unregister<PlaceDetailsBloc>();
    await _i.unregister<ApiClientBloc>();
    await _i.unregister<LanguagesBloc>();
    await _i.unregister<SettingsBloc>();
    await _i.unregister<LocationBloc>();
    await _i.unregister<NotificationsBloc>();
    await _i.unregister<ChangePassCubit>();
    await _i.unregister<CurrenciesBloc>();
    await _i.unregister<UpdateDeliveringOrderBloc>();
    await _i.unregister<RegisterBloc>();
    await _i.unregister<UserInfoBloc>();
    await _i.unregister<UpdateUserBloc>();
    await _i.unregister<LoginBloc>();
    await _i.unregister<VerfiyCodeBloc>();
    await _i.unregister<ForgetPasswordBloc>();
    await _i.unregister<AddCardBloc>();
    await _i.unregister<LogoutBloc>();
    await _i.unregister<ResetPasswordBloc>();
    await _i.unregister<GetDeliveringOrderBloc>();
    await _i.unregister<NavEnforcerBloc>();
    await _i.unregister<PickImageCubit>();
    await _i.unregister<ChatRoomsBloc>();
    await _i.unregister<MessagesBloc>();
    await _i.unregister<EmojiParser>();
    await _i.unregister<SocketCtrl>();
    await _i.unregister<AddPaymentTypeBloc>();
    await _i.unregister<OrderBloc>();
    await _i.unregister<OrdersRepoImp>();
    await _i.unregister<AddDeliveryAttrBloc>();
    await _i.unregister<DeliveryAttributesBloc>();
    await _i.unregister<GetCommissionBloc>();
    await _i.unregister<UpdateTripCubit>();
    await _i.unregister<MyPaymentsBloc>();
    await _i.unregister<GetPaymentTypeBloc>();
    await _i.unregister<CountrySearchCubit>();
    await _i.unregister<UpdatePriceCubit>();
    await _i.unregister<UpdateRangeCubit>();

    // repo
    await _i.unregister<GlobalRepoImpl>();
    await _i.unregister<DeliveringRepoImp>();
    await _i.unregister<AuthRepoImpl>();
    await _i.unregister<NotificationsRepoImpl>();
    await _i.unregister<DeliveryAttributesRepoImp>();
    await _i.unregister<GetInDriveBloc>();
    await _i.unregister<InDriveRepoImp>();
  }

  // getters
  static DioClientImpl get dioClient => _i.get<DioClientImpl>();

  static Connectivity get connectivity => _i.get<Connectivity>();

  static MainViewBloc get mainViewBloc => _i.get<MainViewBloc>();

  static ThemeBloc get themeBloc => _i.get<ThemeBloc>();

  static ApiClientBloc get apiClientBloc => _i.get<ApiClientBloc>();

  static LanguagesBloc get languagesBloc => _i.get<LanguagesBloc>();

  static SettingsBloc get settingsBloc => _i.get<SettingsBloc>();

  static LocationBloc get locationBloc => _i.get<LocationBloc>();

  static NotificationsBloc get getNotifications => _i.get<NotificationsBloc>();

  static ChangePassCubit get changePass => _i.get<ChangePassCubit>();

  static CurrenciesBloc get currenciesBloc => _i.get<CurrenciesBloc>();

  static RegisterBloc get registerBloc => _i.get<RegisterBloc>();

  static UserInfoBloc get userInfoBloc => _i.get<UserInfoBloc>();

  static UpdateUserBloc get updateUserBloc => _i.get<UpdateUserBloc>();

  static LoginBloc get loginBloc => _i.get<LoginBloc>();

  static VerfiyCodeBloc get verfiyCodeBloc => _i.get<VerfiyCodeBloc>();

  static ForgetPasswordBloc get forgetPasswordBloc => _i.get<ForgetPasswordBloc>();

  static LogoutBloc get logoutBloc => _i.get<LogoutBloc>();

  static ResetPasswordBloc get resetPasswordBloc => _i.get<ResetPasswordBloc>();

  static NavEnforcerBloc get navEnforcerBloc => _i.get<NavEnforcerBloc>();

  static PickImageCubit get pickImageCubit => _i.get<PickImageCubit>();

  static DeliveryAttributesBloc get deliveryAttributesBloc => _i.get<DeliveryAttributesBloc>();

  static AddDeliveryAttrBloc get addDeliveryAttrBloc => _i.get<AddDeliveryAttrBloc>();

  ///Chat
  static ChatRoomsBloc get chatBloc => _i.get<ChatRoomsBloc>();

  static MessagesBloc get sendMsgBloc => _i.get<MessagesBloc>();

  static EmojiParser get emojiParser => _i.get<EmojiParser>();

  static SocketCtrl get socket => _i.get<SocketCtrl>();

  static ImagePicker get imagePicker => _i.get<ImagePicker>();

  static MapBloc get mapBloc => _i.get<MapBloc>();

  static PlaceDetailsBloc get placeDetailsBloc => _i.get<PlaceDetailsBloc>();

  static UpdateLocationBloc get updateLocationBloc => _i.get<UpdateLocationBloc>();

  static OrderBloc get orderBloc => _i.get<OrderBloc>();

  static UpdateDeliveringOrderBloc get updateDeliveringOrderBloc => _i.get<UpdateDeliveringOrderBloc>();

  static GetDeliveringOrderBloc get getDeliveringOrderBloc => _i.get<GetDeliveringOrderBloc>();

  static GetCommissionBloc get getCommissionBloc => _i.get<GetCommissionBloc>();

  static GetInDriveBloc get getInDrive => _i.get<GetInDriveBloc>();

  static UpdateTripCubit get updateTrip => _i.get<UpdateTripCubit>();

  static AddCardBloc get addCardBloc => _i.get<AddCardBloc>();

  static AddPaymentTypeBloc get addPaymentTypeBloc => _i.get<AddPaymentTypeBloc>();

  static MyPaymentsBloc get myPaymentsBloc => _i.get<MyPaymentsBloc>();

  static GetPaymentTypeBloc get getPaymentTypeBloc => _i.get<GetPaymentTypeBloc>();

  static CountrySearchCubit get countrySearchCubit => _i.get<CountrySearchCubit>();

  static UpdatePriceCubit get updatePriceCubit => _i.get<UpdatePriceCubit>();

  static UpdateRangeCubit get updateRangeCubit => _i.get<UpdateRangeCubit>();

  static GetBanksBloc get getBanksBloc => _i.get<GetBanksBloc>();
}
