import '../../model/dynamic_ui_model.dart';

abstract class DUIRadioBtnHelper {
  static final Map<String, int> radioMap = {};

  static addRadio(DUIFieldModel field, bool val) => radioMap.addAll({field.id: val ? 1 : 0});
  static bool getRadio(DUIFieldModel field) {
    if (radioMap[field.id] != null) {
      return radioMap[field.id] == 1 ? true : false;
    } else {
      return field.format?.initial is bool ? field.format?.initial : true;
    }
  }
}
