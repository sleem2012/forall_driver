import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';

class KThemeData {
  static BuildContext? _context;
  static KThemeData? _instance;
  KThemeData._internal() {
    _instance = this;
  }
  static KThemeData of(BuildContext context) {
    _context = context;
    return _instance ?? KThemeData._internal();
  }

  ThemeData get themeData {
    return Theme.of(_context!).brightness == Brightness.light ? light : dark;
  }

  SystemUiOverlayStyle get overlayStyle {
    return Theme.of(_context!).brightness == Brightness.light ? _lightOverLay : _darkOverLay;
  }

  static ThemeData get light {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundL,
      primaryColor: Colors.pink[800],
      appBarTheme: const AppBarTheme(
        color: KColors.backgroundL,
        systemOverlayStyle: _lightOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.iconL),
        iconTheme: IconThemeData(color: KColors.iconL),
      ),
      shadowColor: KColors.shadowL,
      inputDecorationTheme: inputDecorationTheme(accentColor: Colors.transparent),
      iconTheme: const IconThemeData(color: KColors.iconL),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowL, background: KColors.accentColorL),
      switchTheme: const SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundD,
      appBarTheme: const AppBarTheme(
        color: KColors.backgroundD,
        systemOverlayStyle: _darkOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.iconD),
      ),
      shadowColor: KColors.shadowD,
      inputDecorationTheme: inputDecorationTheme(accentColor: Colors.transparent),
      iconTheme: const IconThemeData(color: KColors.iconD),
      elevatedButtonTheme: elevatedBtnTheme(shadow: KColors.shadowD, background: KColors.accentColorD),
    );
  }

  static ElevatedButtonThemeData elevatedBtnTheme({required Color shadow, required Color background}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(shadow),
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(background),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KHelper.cornerRadius),
          ),
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme({required Color accentColor}) {
    return InputDecorationTheme(
      border: outlineInputBorder(color: accentColor),
      disabledBorder: outlineInputBorder(color: accentColor),
      errorBorder: outlineInputBorder(color: Colors.red),
      focusedErrorBorder: outlineInputBorder(color: Colors.red),
      enabledBorder: outlineInputBorder(color: accentColor),
      focusedBorder: outlineInputBorder(color: Colors.grey),
    );
  }

  static InputDecoration inputDecoration(BuildContext context) => InputDecoration(
        border: outlineInputBorder(color: KColors.of(context).accentColor),
        disabledBorder: outlineInputBorder(color: KColors.of(context).accentColor),
        errorBorder: outlineInputBorder(color: Colors.red),
        focusedErrorBorder: outlineInputBorder(color: Colors.red),
        enabledBorder: outlineInputBorder(color: KColors.of(context).accentColor),
        focusedBorder: outlineInputBorder(color: KColors.of(context).accentColor),
      );

  static OutlineInputBorder outlineInputBorder({required Color color}) => OutlineInputBorder(
        borderSide: BorderSide(width: .75, color: color),
        borderRadius: BorderRadius.circular(20),
      );

  static const SystemUiOverlayStyle _darkOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle _lightOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
