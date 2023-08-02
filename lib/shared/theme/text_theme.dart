import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/colors.dart';

abstract class KTextStyle {
  static TextStyleGetters of(BuildContext context) {
    return TextStyleGetters.of(context);
  }

  static const String fontFamily = 'font';

  //Light
  static const Color mainL = Color(0xFF2F2E41);
  static const Color subL = Color(0xFF2F2E41);
  static const Color orangeText = Color(0xFF05B646);

  //Dark
  static const Color mainD = Color(0xffd5d5d5);
  static const Color subD = Color(0xFF45C0BE);
}

class TextStyleGetters {
  static BuildContext? _context;
  static TextStyleGetters? _instance;
  TextStyleGetters._internal() {
    _instance = this;
  }
  static TextStyleGetters of(BuildContext context) {
    _context = context;
    return _instance ?? TextStyleGetters._internal();
  }

  //Getters
  TextStyle get headers {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get labels {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 12,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get labelsB {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 12,
      fontFamily: KTextStyle.fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get headers2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get names {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get profileTiles {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : KTextStyle.subD,
      fontSize: 13,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get tileProps {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 11,
      fontWeight: FontWeight.bold,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get listTileTitle {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get listTileSub {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 11,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get tilePropsValues {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 10,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get body {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 15,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get body2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 12.5,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get body3 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 10,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get title1 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get tapBar {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 13,
      fontFamily: KTextStyle.fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get editBTN {
    return const TextStyle(
      color: Colors.white,
      fontSize: 10,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get freeShiping {
    return const TextStyle(
      color: KTextStyle.mainL,
      fontSize: 10,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get enabled {
    return const TextStyle(color: KTextStyle.orangeText, fontSize: 12, fontFamily: KTextStyle.fontFamily, fontWeight: FontWeight.bold);
  }

  TextStyle get error {
    return const TextStyle(color: Color(0xFFBE0202), fontSize: 14, fontFamily: KTextStyle.fontFamily);
  }

  TextStyle get success {
    return const TextStyle(color: Colors.green, fontSize: 14, fontFamily: KTextStyle.fontFamily);
  }

  TextStyle get hint {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 12,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get hint2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL.withOpacity(.5) : KTextStyle.mainD.withOpacity(.5),
      fontSize: 10,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get topHint {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.subL : KTextStyle.subD,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get title {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get transTitle {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KColors.accentColorL : KTextStyle.mainD,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get titleReverse {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KColors.backgroundD : KColors.backgroundL,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get title2 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? KTextStyle.mainL : KTextStyle.mainD,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get title3 {
    return TextStyle(
      color: Theme.of(_context!).brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: 12,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get btntitle {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: KTextStyle.fontFamily,
    );
  }

  TextStyle get textBtn {
    return const TextStyle(
      color: Colors.blue,
      fontSize: 14,
      fontFamily: KTextStyle.fontFamily,
    );
  }
}
