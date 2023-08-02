import 'package:flutter/foundation.dart';

class LabelPLaceHolder {
  final String nPlaceHolder;
  final List<MapEntry<String, dynamic>> table;

  LabelPLaceHolder({required this.nPlaceHolder, required this.table});

  @override
  bool operator ==(covariant LabelPLaceHolder other) {
    if (identical(this, other)) return true;

    return other.nPlaceHolder == nPlaceHolder && listEquals(other.table, table);
  }

  @override
  int get hashCode => nPlaceHolder.hashCode ^ table.hashCode;
}
