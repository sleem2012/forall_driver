import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_state.dart';
import 'package:forall_driver/logic/theme/theme_cubit.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/theme_data.dart';
import 'package:forall_driver/splash_screen/splash_screen.dart';
import 'package:forall_driver/views/Auth/login/login_screen.dart';
import 'package:forall_driver/views/Auth/pin_code/pin_code_screen.dart';
import 'package:forall_driver/views/main_screen/main_screen.dart';
import 'package:forall_driver/views/onboarding_screen/choose_lang_screen.dart';
import 'package:forall_driver/views/widgets/error/error_view.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/no_connection_view.dart';
import 'package:forall_driver/views/widgets/on_success_view.dart';
import 'package:get/get.dart';

import 'packages/shared/api_midleware_bloc/api_client_bloc.dart';
import 'packages/shared/api_midleware_bloc/api_client_state.dart';
import 'packages/shared/error/failures.dart';
import 'packages/shared/picker/logic/location_cubit/location_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.themeBloc..loadTheme()),
        BlocProvider(create: (context) => Di.languagesBloc..getAllLangs()),
        BlocProvider(create: (context) => Di.settingsBloc..getSettings()),
        BlocProvider(create: (context) => Di.currenciesBloc..getCurrencies()),
        BlocProvider(create: (context) => Di.locationBloc..getCountries()),
        BlocProvider(create: (context) => Di.navEnforcerBloc),
        BlocProvider(create: (context) => Di.apiClientBloc),
        BlocProvider(create: (context) => Di.currenciesBloc),
        BlocProvider(create: (context) => Di.logoutBloc),
        BlocProvider(create: (context) => Di.userInfoBloc),
        BlocProvider(create: (context) => Di.mainViewBloc),
        BlocProvider(create: (context) => Di.getCommissionBloc..get()),
        BlocProvider(create: (context) => Di.getPaymentTypeBloc..gettypes()),
        BlocProvider(create: (context) => Di.myPaymentsBloc..getMyPayments()),
        BlocProvider(create: (context) => GetLocationCubit()),
        BlocProvider(
          create: (context) => Di.getDeliveringOrderBloc..getDeliveringOrders(),
        ),
        BlocProvider(
            create: (context) => Di.updateLocationBloc
              ..id = KStorage.i.getUserInfo?.data?.address?.id
              ..getCurrentPosition()),
        BlocProvider(
            create: (context) => Di.updateLocationBloc
              ..id = KStorage.i.getUserInfo?.data?.address?.id
              ..periodicUpdate()),
        BlocProvider(
            create: (context) => Di.getDeliveringOrderBloc
              ..getDeliveringOrders()
              ..init_delivering_socket()),
        BlocProvider(
          create: (context) => Di.updateLocationBloc
            ..id = KStorage.i.getUserInfo?.data?.address?.id
            ..getCurrentPosition()
            ..periodicUpdate(),
        ),
        BlocProvider(create: (context) => Di.chatBloc..get_all_rooms()),
        BlocProvider(create: (context) => Di.getInDrive..init_socket()),
        BlocProvider(create: (context) => Di.updateTrip),
        BlocProvider(
          create: (context) => Di.orderBloc
            ..getOrder()
            ..init_socket(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocListener<ApiClientBloc, ApiClientState>(
            listener: (context, state) {
              state.whenOrNull(
                error: (failure) {
                  KHelper.showSnackBar(KFailure.toError(failure));
                  failure.whenOrNull(
                    error409: () {
                      Get.offAll(() => PinCodeScreen(destination: const MainNavigationView(), msg: Tr.get.not_verfied));
                    },
                    offline: (options) {
                      Get.dialog(const KOfflineView(), barrierColor: Colors.transparent, barrierDismissible: false);
                    },
                    error401: () {
                      if (KStorage.i.getToken != null) {
                        KStorage.i.delToken;
                        KStorage.i.delUserInfo;
                        Get.offAll(() => const LoginScreen());
                      }
                    },
                  );
                },
              );
            },
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: BlocListener<NavEnforcerBloc, NavEnforcerState>(
                listener: (context, nav) {
                  nav.when(
                    loading: () {
                      Get.offAll(() => const Scaffold(body: KLoadingOverlay(isLoading: true)));
                    },
                    toSuccess: (msg, destination) {
                      if (msg != null) {
                        Get.offAll(() => OnSuccessView(msg: msg, destination: destination));
                      } else {
                        Get.offAll(() => destination);
                      }
                    },
                    error: (msg) {
                      Get.offAll(
                        () => KErrorView(
                          error: msg,
                          onTryAgain: () {
                            Get.offAll(() => const Wrapper());
                            Di.reset(context);
                          },
                        ),
                      );
                    },
                  );
                },
                child: GetMaterialApp(
                  title: 'FORALL DRIVER',
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: Tr.delegates,
                  supportedLocales: Tr.supportedLocales,
                  navigatorKey: Nav.navigator,
                  locale: ThemeBloc.of(context).locale,
                  localeResolutionCallback: (locale, iterable) => ThemeBloc.of(context).locale,
                  theme: KThemeData.light,
                  darkTheme: KThemeData.dark,
                  themeMode: ThemeBloc.of(context).themeMode,
                  home: Builder(
                    builder: (context) {
                      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
                      return AnnotatedRegion<SystemUiOverlayStyle>(
                        value: KThemeData.of(context).overlayStyle,
                        child: const SplashScreen(),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => nav());
  }

  nav() {
    if (KStorage.i.getToken != null) {
      Nav.offAll(const MainNavigationView());
    } else if (KStorage.i.getLang != null && KStorage.i.getcurrency != null) {
      Nav.offAll(const LoginScreen());
    } else {
      Nav.offAll(const ChooseLangScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
