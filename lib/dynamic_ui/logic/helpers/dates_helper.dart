import 'package:flutter/foundation.dart';
import '../../model/dynamic_ui_model.dart';
import '../bloc/dynamic_ui_states.dart';

abstract class DUIDatesHelper {
  static final Map<String, dynamic> dateMap = {};

  static void addDate(DUIFieldModel field, String? val) {
    if (dateMap[field.id] is Map<String, dynamic>) {
      dateMap.update(
        field.id,
        (value) {
          if ((value as Map<String, dynamic>).containsKey((value.entries.length + 1).toString())) {
            return value..update("${value.entries.length + 1}", (value) => val);
          } else {
            return value;
          }
        },
      );
    } else {
      dateMap.addAll({field.id: val});
    }
  }

  static removeExtraDate({required String fId, required String key, required Function(DynamicUiState s) emit}) {
    final newMap = <String, dynamic>{};
    final entries = (dateMap[fId] as Map<String, dynamic>)..remove(key);
    for (int i = 0; i < entries.values.length; i++) {
      newMap.addAll({(i + 1).toString(): entries.values.toList()[i]});
    }
    dateMap.update(fId, (value) => newMap);
    if (newMap.isNotEmpty) {
      dateMap.update(fId, (value) => newMap);
    } else {
      dateMap.update(fId, (value) => '');
    }
    emit(DynamicUiState.update(fId, key: UniqueKey().toString()));
  }

  static addMoreDate({required DUIFieldModel field, String? p0, required Function(DynamicUiState s) emit}) {
    if ((p0 ?? '').isEmpty) return;
    if (dateMap.containsKey(field.id)) {
      dateMap.update(
        field.id,
        (value) {
          if (value is Map<String, dynamic>) {
            return value..addAll({(value.entries.length + 1).toString(): p0});
          } else {
            return <String, dynamic>{"1": value};
          }
        },
      );
    }
    emit(DynamicUiState.update(field.id, key: UniqueKey().toString()));
  }
}
