import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../extensions.dart';
import '../../model/dynamic_ui_model.dart';
import '../../model/labels/label_ph.dart';
import '../helpers/actions_conditions_helper.dart';
import '../helpers/dates_helper.dart';
import '../helpers/drop_down_helper.dart';
import '../helpers/files_helper.dart';
import '../helpers/final_map.dart';
import '../helpers/radio_btn.dart';
import '../helpers/text_field_helper.dart';
import '../../view/widgets/dui_notifications.dart';
import 'dynamic_ui_states.dart';

class DynamicUiBloc extends Cubit<DynamicUiState> {
  DynamicUiBloc({required this.fields}) : super(const DynamicUiState.initial('-1')) {
    setter;
  }

  static DynamicUiBloc of(BuildContext context) => BlocProvider.of<DynamicUiBloc>(context);

  List<DUIFieldModel> fields;
  final Map<String, dynamic> _values = {};

  get setter {
    for (var field in fields) {
      field.type.whenOrNull(
        radioButton: () {
          addRadio(field, field.format?.initial == true);
        },
        dropDownButton: () {
          if (field.format?.initial != null) {
            addDropDownValue(field, DUICollectionModel.fromJson(field.format?.initial ?? {}));
          }
        },
        checkbox: () {
          if (field.format?.initial != null) {
            addCheckBoxValues(field, []);
          }
        },
        dateTimePiker: () {
          if (field.format?.initial != null) {
            addDate(field, field.format?.initial.toString());
          }
        },
        textField: () {
          if (field.format?.initial != null) {
            addText(field.id, field.format?.initial ?? '');
          }
        },
      );
    }
  }

  Map<String, dynamic> get _mapAllValues {
    _values.clear();

    for (var element in textMap.entries.toList()) {
      _values.addAll({element.key: element.value is Map<String, dynamic> ? element.value.values.toList() : element.value});
    }
    for (var element in checkBoxMap.entries.toList()) {
      _values.addAll({element.key: element.value});
    }
    for (var element in dateMap.entries.toList()) {
      _values.addAll({element.key: element.value is Map<String, dynamic> ? element.value.values.toList() : element.value});
    }
    for (var element in dropDownMap.entries.toList()) {
      _values.addAll({element.key: element.value.key});
    }
    for (var element in radioMap.entries.toList()) {
      _values.addAll({element.key: element.value});
    }
    for (var element in notificationsMap.entries.toList()) {
      _values.addAll({element.key: element.value.map((e) => e.toMap()).toList()});
    }
    for (var element in galleryMap.entries.toList()) {
      _values.addAll({element.key: element.value?.map((e) => MultipartFile.fromFileSync(e.path)).toList()});
    }
    for (var element in filesMap.entries.toList()) {
      final Map<String, MultipartFile> mpFilesMap = {};
      for (var file in element.value?.entries.toList() ?? <MapEntry<String, File?>>[]) {
        if (file.value != null) {
          mpFilesMap.addAll({file.key: MultipartFile.fromFileSync(file.value!.path)});
        }
      }
      _values.addAll({element.key: mpFilesMap});
    }

    return _values;
  }

  Map<String, dynamic> get values => _mapAllValues;
  Map<String, dynamic> get answer_collection => DUIFinalMaps.answer_collection(values: values);
  Map<String, dynamic> get grouped_answer_collection => DUIFinalMaps.grouped_answer_collection(fields: fields, values: values);

  _delValueFromAllMaps(key) {
    _values.remove(key);
    textMap.remove(key);
    checkBoxMap.remove(key);
    dropDownMap.remove(key);
    radioMap.remove(key);
    dateMap.remove(key);
    filesMap.remove(key);
  }

  // ============================================================
  // Handel Text Fields =========================================

  final Map<String, dynamic> textMap = DUITextFHelper.textMap;
  final Map<String, String> _filterTextResultMap = DUITextFHelper.filterTextResultMap;

  String? getFilteredText(key) => _filterTextResultMap[key];

  LabelPLaceHolder getPlaceholder(DUIFieldModel field) => DUITextFHelper.getPlaceholder(field);

  void addText(String fId, String val) => DUITextFHelper.addText(fid: fId, val: val, onEmit: emit);

  void addExtraText(String fId, String nVal) => DUITextFHelper.addExtraText(fId: fId, nVal: nVal, emit: emit);

  void removeExtraText(String fId, String key) => DUITextFHelper.removeExtraText(fId: fId, key: key, emit: emit);

  void triggerFilterOnTextField(DUIFieldModel field, String value) async {
    _loadingFunctionWrapper(
      additional: field.id,
      field,
      () async {
        for (var con in field.conditions) {
          fields = await DUITextFHelper.triggerFilterOnTextField(field: field, value: value, fields: fields, condition: con);
        }
      },
    );
  }

  // ============================================================
  // Handel DropDown  && CheckBox Fields =====================================

  final Map<String, DUICollectionModel> dropDownMap = DUIDropDownHelper.dropDownMap;
  final Map<String, List<dynamic>> checkBoxMap = DUIDropDownHelper.checkBoxMap;

  DUICollectionModel? getDropDownValue(DUIFieldModel field) => DUIDropDownHelper.getDropDownValue(field);
  void addCheckBoxValues(DUIFieldModel field, List<DUICollectionModel> val) => DUIDropDownHelper.addCheckBoxValues(field, val);

  void addDropDownValue(DUIFieldModel field, DUICollectionModel val) {
    dropDownMap.addAll({field.id: val});
    _checkConditions(field, val);
  }

  // =============================================================
  // Handel RadioButton Fields ===================================
  final Map<String, int> radioMap = DUIRadioBtnHelper.radioMap;
  void addRadio(DUIFieldModel field, bool val) => DUIRadioBtnHelper.addRadio(field, val);
  bool getRadio(DUIFieldModel field) => DUIRadioBtnHelper.getRadio(field);

  // ============================================================
  // Handel DateTimePicker Fields ===============================
  final Map<String, dynamic> dateMap = DUIDatesHelper.dateMap;

  void addDate(DUIFieldModel field, String? val) => DUIDatesHelper.addDate(field, val);

  void removeExtraDate(String fId, String key) => DUIDatesHelper.removeExtraDate(fId: fId, key: key, emit: emit);

  void addExtraDate(DUIFieldModel field, String? p0) => DUIDatesHelper.addMoreDate(field: field, p0: p0, emit: emit);

  // ==================================================================
  // Handel Notifications Fields ======================================
  final Map<String, List<NotifyModel>> notificationsMap = {};
  addExtraNotification(String fid, List<NotifyModel> l) => notificationsMap.addAll({fid: l});

  // =================================================================
  // Handel ImageInput &&  FileInput  &&  Gallery Fields =============
  final Map<String, List<File>?> galleryMap = DUIFilesFHelper.galleryMap;
  final Map<String, Map<String, File?>?> filesMap = DUIFilesFHelper.filesMap;

  selectGallery({required List<File> gallery, required DUIFieldModel field}) {
    DUIFilesFHelper.selectGallery(gallery: gallery, field: field);
  }

  selectFile({required String colKey, required File? file, required DUIFieldModel field}) {
    DUIFilesFHelper.filesMapsMode(colKey: colKey, file: file, fid: field.id);
  }

  // ==================================================================
  //Modify Conditional Field===========================================

  _checkConditions(DUIFieldModel field, DUICollectionModel value) async {
    _loadingFunctionWrapper(
      field,
      () async {
        for (var condition in field.conditions) {
          await condition.condition?.whenOrNull(
            equal: () async => await _modifyConditionalField(con: condition, value: value, condition: value.key == condition.value),
            notEqual: () async => await _modifyConditionalField(con: condition, value: value, condition: value.key != condition.value),
          );
        }
      },
    );
  }

  Future<void> _modifyConditionalField({required FieldsConditions con, required DUICollectionModel value, required bool condition}) async {
    _delValueFromAllMaps(con.actionId);

    await (condition ? con.action_true : con.action_false)?.when(
      invisible: () async => await _toggleFieldVisible(con.actionId, false),
      visible: () async => await _toggleFieldVisible(con.actionId, true),
      filter: () async => await _filterDropDown(con, value),
      non: () async => await Future.value(),
    );
  }

  Future _filterDropDown(FieldsConditions con, DUICollectionModel value) async {
    fields = await DUIConditionsHelper.filterDropDown(con: con, value: value, fields: fields);
  }

  Future _toggleFieldVisible(String? cActionId, bool isVisible) async {
    DUIFieldModel? actionField = fields.toList().firstWhereOrNull((element) => element.id == cActionId);
    if (actionField.isNull) return fields;
    fields = fields.toList().replace(actionField!, actionField.copyWith(isVisible: isVisible));
  }

  // ===============================================================
  //Handel Loading Fields ==========================================
  final List<String?> _loadingFields = [];
  bool isLoading(key) => _loadingFields.contains(key);

  _loadingFunctionWrapper(DUIFieldModel field, Function() callback, {String? additional}) async {
    final actionsIds = field.conditions.map((e) => e.actionId).toList()..add(additional);
    _loadAllActions(actionsIds);
    await callback.call();
    _unLoadAllActions(actionsIds);
  }

  _unLoadAllActions(List<String?> actionsIds) {
    for (var id in actionsIds) {
      _loadingFields.removeWhere((element) => element == id);
      emit(DynamicUiState.update(id));
    }
  }

  _loadAllActions(List<String?> actionsIds) {
    for (var id in actionsIds) {
      _loadingFields.add(id);
      emit(DynamicUiState.update(id));
    }
  }

  // ===============================================================
  // Getter =============================================

  DUIFieldModel fieldRef(String? fieldId, {bool? isSub}) => fields.firstWhere((element) => element.id == fieldId);

  int getFieldIndex(String? fid) => fields.indexWhere((element) => element.isVisible && fid == element.id);

  Map<String, dynamic> getTextMap(String? fid) => ((textMap[fid] is Map<String, dynamic> ? textMap[fid] : <String, dynamic>{}));

  Map<String, dynamic> getDateMap(String? fid) => ((dateMap[fid] is Map<String, dynamic> ? dateMap[fid] : <String, dynamic>{}));

  // ==================================================================
}
