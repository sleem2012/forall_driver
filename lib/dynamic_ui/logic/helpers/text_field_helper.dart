import 'package:flutter/foundation.dart';
import '../../../extensions.dart';

import '../../../di.dart';
import '../../../shared/theme/logger.dart';
import '../../model/dynamic_ui_model.dart';
import '../../model/labels/label_ph.dart';
import '../bloc/dynamic_ui_states.dart';

abstract class DUITextFHelper {
  static Map<String, dynamic> textMap = {};
  static final Map<String, String> filterTextResultMap = {};

  static addText({required String fid, required String val, required Function(DynamicUiState s) onEmit}) {
    debugPrint('=================>> $val');

    if (filterTextResultMap.containsKey(fid)) {
      filterTextResultMap.remove(fid);
      onEmit.call(DynamicUiState.update(fid, key: UniqueKey().toString()));
    }
    if (val.isNotEmpty) {
      if (textMap[fid] is Map<String, dynamic>) {
        textMap.update(
          fid,
          (value) {
            if ((value as Map<String, dynamic>).containsKey((value.entries.length + 1).toString())) {
              return value..update("${value.entries.length + 1}", (value) => val);
            } else {
              return value;
            }
          },
        );
      } else {
        textMap.addAll({fid: val});
      }
    } else {
      if (textMap[fid] is Map<String, dynamic>) {
        textMap.update(
          fid,
          (value) {
            if ((value as Map<String, dynamic>).containsKey((value.entries.length + 1).toString())) {
              return value..remove("${value.entries.length + 1}");
            } else {
              return value;
            }
          },
        );
      } else {
        textMap.remove(fid);
      }
    }
  }

  static removeExtraText({required String fId, required String key, required Function(DynamicUiState s) emit}) {
    final newMap = <String, dynamic>{};

    final entries = (textMap[fId] as Map<String, dynamic>)..remove(key);
    for (int i = 0; i < entries.values.length; i++) {
      newMap.addAll({(i + 1).toString(): entries.values.toList()[i]});
    }
    if (newMap.isNotEmpty) {
      textMap.update(fId, (value) => newMap);
    } else {
      textMap.update(fId, (value) => '');
    }
    emit.call(DynamicUiState.update(fId, key: UniqueKey().toString()));
  }

  static addExtraText({required String fId, required String nVal, required Function(DynamicUiState s) emit}) {
    if (nVal.isEmpty) return textMap;
    textMap.update(
      fId,
      (value) {
        if (value is Map<String, dynamic>) {
          return value..addAll({(value.entries.length + 1).toString(): nVal});
        } else {
          return <String, dynamic>{"1": value};
        }
      },
      ifAbsent: () {
        debugPrint('=================  Absence of $fId >>> : $nVal');
      },
    );
    emit.call(DynamicUiState.update(fId, key: UniqueKey().toString()));
  }

  static Future<List<DUIFieldModel>> triggerFilterOnTextField({
    required DUIFieldModel field,
    required String value,
    required List<DUIFieldModel> fields,
    required FieldsConditions condition,
  }) async {
    if (value.isEmpty) return fields;
    printMap(condition.toMap());

    try {
      debugPrint('=>> Update field =>> ${condition.actionId} , With Action =>>  ${condition.toString()}');
      final url = condition.api_collections! + value;
      final api_response = await Di.dioClient.get(url);
      if (api_response.statusCode == 200) {
        if ((api_response.data['data'] as Map<String, dynamic>).containsKey(condition.value)) {
          final result = api_response.data['data']['${condition.value}'].toString();
          filterTextResultMap.addAll({field.id: result});

          ///
          ///replace Init Values For Labels
          fields = replaceInitValuesForLabels(result: result, fields: fields, condition: condition);

          ///
        } else {
          filterTextResultMap.addAll({field.id: api_response.data.toString()});
        }
      } else {
        filterTextResultMap.remove(field.id);
      }
      return fields;
    } catch (e) {
      debugPrint('=================  Trigger Filter On TextField : $e ');

      rethrow;
    }
  }

  static LabelPLaceHolder getPlaceholder(DUIFieldModel field) {
    if (field.format?.initial is! Map<String, dynamic>) return LabelPLaceHolder(nPlaceHolder: '', table: []);
    final vars = (field.format?.initial as Map<String, dynamic>).entries.toList();

    String nPH = field.placeholder;

    final regX = RegExp(r"\T({.*?})");
    List<MapEntry<String, dynamic>> table = <MapEntry<String, dynamic>>[];
    final x = regX.allMatches(nPH);
    for (var reg in x) {
      final v = reg[1].toString().split('-');
      table.add(MapEntry(v[0].toString().replaceAll('{', '').capitalized, v[1].toString().replaceAll('}', '').capitalized));
      nPH = nPH.replaceAll('T${reg[1].toString()}', '');
    }
    for (var element in vars) {
      nPH = nPH.replaceAll(":${element.key}", element.value.toString());
    }
    final finalTable = <MapEntry<String, dynamic>>[];
    table.map((e) {
      for (var element in vars) {
        if (e.value.toString().replaceAll(":", '') == element.key) {
          finalTable.add(MapEntry(e.key.toString(), element.value.toString()));
        }
      }
    }).toList();

    return LabelPLaceHolder(nPlaceHolder: nPH, table: finalTable);
  }

  static List<DUIFieldModel> replaceInitValuesForLabels({
    required String result,
    required List<DUIFieldModel> fields,
    required FieldsConditions condition,
  }) {
    DUIFieldModel? actionField = fields.toList().firstWhere((element) => element.id == condition.actionId);
    final nInitial = (actionField.format?.initial as Map<dynamic, dynamic>)..update(condition.value.toString(), (value) => result, ifAbsent: () => result);
    fields = fields.toList().replace(
          actionField,
          actionField.copyWith(format: actionField.format?.copyWith(initial: nInitial)),
        );
    debugPrint('================= ${nInitial.toString()} : ');
    return fields;
  }
}
