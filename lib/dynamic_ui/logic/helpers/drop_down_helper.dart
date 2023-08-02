import '../../model/dynamic_ui_model.dart';

abstract class DUIDropDownHelper {
  // Handel DropDown Fields =====================================
  static final Map<String, DUICollectionModel> dropDownMap = {};
  static DUICollectionModel? getDropDownValue(DUIFieldModel field) => dropDownMap[field.id];

  static void addDropDownValue(DUIFieldModel field, DUICollectionModel val) {
    dropDownMap.addAll({field.id: val});
   /// _checkConditions(field, val);
  }

  // Handel CheckBox Fields =====================================
  static final Map<String, List<dynamic>> checkBoxMap = {};
  static void addCheckBoxValues(DUIFieldModel field, List<DUICollectionModel> val) {
    final List list = [];
    if (val.isNotEmpty) {
      for (var element in val) {
        list.add(element.key);
      }
      checkBoxMap.addAll({field.id: list});
    } else {
      checkBoxMap.remove(field.id);
    }
  }
}
