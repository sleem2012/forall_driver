import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  static const bool _testMode = kDebugMode;

  static String get bannerAdUnit {
    if (_testMode) {
      return Platform.isAndroid
          ? "ca-app-pub-3940256099942544/6300978111"
          : "ca-app-pub-3940256099942544/2934735716";
    } else {
      return Platform.isAndroid
          ? "ca-app-pub-2779211214555257/5895083330"
          : "ca-app-pub-2779211214555257/8222503745";
    }
  }
}
