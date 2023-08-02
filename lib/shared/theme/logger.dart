import 'package:flutter/foundation.dart';
import 'dart:math' as math;

const int _maxWidth = 120;

printMap(Map? map, {String? header , bool? trim = true }) {
  if (map == null || map.isEmpty) return;
  _printLine('╔', '');
  map.forEach((dynamic key, dynamic value) => _printKV(key.toString(), trim! ? _trimString(value) : value));
  _printLine('╚', '');
}

String _trimString(value) {
  if (value.toString().length > 100) {
    return '${value.toString().replaceRange(100, value.toString().length, '')}....More';
  } else {
    return value.toString();
  }
}

_printLine([String pre = '', String suf = '╝']) => debugPrint('$pre${'═' * _maxWidth}$suf');

_printKV(String? key, Object? v) {
  final pre = '╟ $key: ';
  final msg = v.toString();

  if (pre.length + msg.length > _maxWidth) {
    debugPrint(pre);
    _printBlock(msg);
  } else {
    debugPrint('$pre$msg');
  }
}

_printBlock(String msg) {
  final lines = (msg.length / _maxWidth).ceil();
  for (var i = 0; i < lines; ++i) {
    debugPrint((i >= 0 ? '║ ' : '') + msg.substring(i * _maxWidth, math.min<int>(i * _maxWidth + _maxWidth, msg.length)));
  }
}
