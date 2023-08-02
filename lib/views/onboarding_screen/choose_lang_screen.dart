import 'package:flutter/material.dart';
import 'package:forall_driver/logic/global/currencies/currencies_bloc.dart';
import 'package:forall_driver/logic/global/languages/langugese_bloc.dart';
import 'package:forall_driver/logic/global/settings/settings_bloc.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/logic/theme/theme_cubit.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/onboarding_screen/on_boarding_screen.dart';
import 'package:forall_driver/views/widgets/currency_drop.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/lang_dropdown.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';
import 'package:get/get.dart';

import '../../packages/cache/locale_storage.dart';

class ChooseLangScreen extends StatelessWidget {
  const ChooseLangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/select_lang_asset.png",
                  fit: BoxFit.cover,

                  width: Get.width,
                ),
                const SizedBox(height: 30,),

                Text(
                  Tr.get.started,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: KColors.of(context).accentColor,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      LanguageDropdown(
                        onSelect: (val) {
                          LanguagesBloc.of(context).selectLang(val!);
                          CurrenciesBloc.of(context).getCurrencies();
                        },
                      ),
                      const SizedBox(height: 5),
                      CurrenciesDropdown(
                        onSelect: (val) {
                          CurrenciesBloc.of(context).selectCurrency(val!);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: KButton(
                      title: Tr.get.go,
                      onPressed: () {
                        if (KStorage.i.getLang != null && KStorage.i.getcurrencyId != null) {
                          ThemeBloc.of(context).updateLocale(KStorage.i.getLang??"en");
                          Nav.offAll(const OnBoarding());
                          SettingsBloc.of(context).getSettings();
                        } else if (KStorage.i.getcurrencyId != null || KStorage.i.getLang != null) {
                          KHelper.showSnackBar(Tr.get.general_validation);
                        }
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
