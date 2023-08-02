import '../../model/dynamic_ui_model.dart';
import '../../model/fields_union/fields_union.dart';

abstract class DUIFinalMaps {
  static Map<String, dynamic> answer_collection({required Map<String, dynamic> values}) {
    final sorted = values.entries.toList()..sort((a, b) => (int.tryParse(a.key) ?? 0).compareTo((int.tryParse(b.key) ?? 0)));
    return makeAnsCol(sorted);
  }

  static Map<String, dynamic> grouped_answer_collection({required List<DUIFieldModel> fields, required Map<String, dynamic> values}) {
    final sorted = grouped_values(fields: fields, values: values).entries.toList()
      ..sort((a, b) => (int.tryParse(a.key) ?? 0).compareTo((int.tryParse(b.key) ?? 0)));
    return makeAnsCol(sorted);
  }

  static Map<String, dynamic> makeAnsCol(List<MapEntry<String, dynamic>> sorted) {
    Map<String, dynamic> attrs = {};
    for (var element in sorted) {
      final length = (element.value is List ? element.value.length : 1);
      if (length > 1 || element.value is List) {
        for (var i = 0; i < length; i++) {
          attrs.addAll({"answer_collections[${element.key}][$i]": element.value[i]});
        }
      } else {
        attrs.addAll({"answer_collections[${element.key}]": element.value});
      }
    }
    return attrs;
  }

  static Map<String, dynamic> grouped_values({required List<DUIFieldModel> fields, required Map<String, dynamic> values}) {
    final Map<String, dynamic> map = {};
    map.clear();
    for (var f in fields) {
      if (f.subFields.isNotEmpty && f.type is! DUIFieldsTypeLabel) {
        final sub_val = {};
        f.subFields.map((e) => sub_val.addAll({e.key: values[e.id]})).toList();
        map.addAll({f.id: sub_val});
      } else {
        map.addAll({f.id: values[f.id]});
      }
    }
    return map;
  }
}
