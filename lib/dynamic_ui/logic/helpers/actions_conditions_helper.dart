import 'package:flutter/foundation.dart';
import '../../../di.dart';
import '../../model/dynamic_ui_model.dart';
import '../../../extensions.dart';
import 'text_field_helper.dart';

abstract class DUIConditionsHelper {
  static Future<List<DUIFieldModel>> filterDropDown({
    required FieldsConditions con,
    required DUICollectionModel value,
    required List<DUIFieldModel> fields,
  }) async {
    try {
      final url = con.api_collections! + value.key!;
      final result = await Di.dioClient.get(url);
      List<DUICollectionModel> newCollection = [];

      if (result.statusCode == 200) {
        if (result.data['data'] is List) {
          final data = (result.data['data'] is List) ? result.data['data'] as List : [];
          for (var json in data) {
            newCollection.add(DUICollectionModel.fromJson(json));
          }
        }

        if (result.data['data'] is Map<String, dynamic>) {
          final label = result.data['data']?['${con.value}'].toString();
          fields = DUITextFHelper.replaceInitValuesForLabels(result: label ?? '', fields: fields, condition: con);
        }
      }
      List<DUIFieldModel> nList = fields.toList();
      DUIFieldModel? actionField = nList.firstWhereOrNull((element) => element.id == con.actionId);
      if (actionField == null) return fields;
      nList = nList.replace(actionField, actionField.copyWith(collection: newCollection));
      return nList;
    } catch (e) {
      debugPrint('=================  DUIConditionsHelper Filter Drop Down : $e ');
      return fields;
    }
  }
}
