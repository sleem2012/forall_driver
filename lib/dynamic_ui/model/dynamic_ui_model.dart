// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import '../../extensions.dart';
import 'actions/actions_union.dart';
import 'conditions/conditions_union.dart';
import 'fields_union/fields_union.dart';
import 'keyboard_union/keyboard_union.dart';

class DynamicUiModel {
  List<DUIFieldModel> fields;
  bool hasAttr;

  DynamicUiModel({required this.fields, required this.hasAttr});

  factory DynamicUiModel.fromJson(Map<String, dynamic> json) {
    List<DUIFieldModel> fields = <DUIFieldModel>[];
    if (json["data"] != null && json["data"]['fields'] != null) {
      json["data"]['fields'].forEach((v) => fields.add(DUIFieldModel.fromJson(v)));
    }
    return DynamicUiModel(fields: fields, hasAttr: json["data"] != null ? json["data"]['has_attr'] ?? false : false);
  }

  DynamicUiModel copyWith({
    List<DUIFieldModel>? fields,
    bool? hasAttr,
  }) {
    return DynamicUiModel(
      fields: fields ?? this.fields,
      hasAttr: hasAttr ?? this.hasAttr,
    );
  }

  @override
  bool operator ==(covariant DynamicUiModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.fields, fields) && other.hasAttr == hasAttr;
  }

  @override
  int get hashCode => fields.hashCode ^ hasAttr.hashCode;
}

class DUIFieldModel {
  DUIFieldModel({
    required this.type,
    required this.key,
    required this.placeholder,
    required this.keyboard,
    required this.isRequired,
    required this.collection,
    required this.isVisible,
    required this.multi,
    required this.id,
    this.isSub = false,
    this.format,
    required this.conditions,
    required this.subFields,
  });

  final DUIFieldsType type;
  final String key;
  final String id;
  final String placeholder;
  final DynamicKeyboardUnion keyboard;
  final bool isRequired;
  final bool isVisible;
  final bool multi;
  final bool isSub;
  final List<DUICollectionModel> collection;
  final FieldFormatModel? format;
  final List<FieldsConditions> conditions;
  final List<DUIFieldModel> subFields;

  factory DUIFieldModel.fromJson(Map<String, dynamic> json, {bool isSub = false}) {
    return DUIFieldModel(
      type: DUIFieldsType.fromString(json["type"]),
      key: json["key"],
      isSub: isSub,
      id: (json["id"] ?? -1).toString(),
      placeholder: json["placeholder"] != null
          ? json["placeholder"].runtimeType == String
              ? json["placeholder"]
              : json["placeholder"]['value'].toString().capitalized
          : '',
      keyboard: DynamicKeyboardUnion.fromString(json["keyboard"]),
      isRequired: json["is_required"] ?? false,
      multi: json["has_multiple"] ?? false,
      isVisible: json["is_visible"] ?? true,
      collection: json["collections"] == null ? [] : List<DUICollectionModel>.from(json["collections"].map((x) => DUICollectionModel.fromJson(x))),
      format: json['format'] != null ? FieldFormatModel.fromJson(json["format"]) : null,
      conditions: json['conditions'] == null ? [] : List<FieldsConditions>.from(json["conditions"].map((x) => FieldsConditions.fromJson(x))),
      subFields: json['sub_fields'] == null ? [] : List<DUIFieldModel>.from(json["sub_fields"].map((x) => DUIFieldModel.fromJson(x, isSub: true))),
    );
  }

  DUIFieldModel copyWith({
    DUIFieldsType? type,
    String? key,
    String? id,
    String? placeholder,
    DynamicKeyboardUnion? keyboard,
    bool? isRequired,
    bool? isVisible,
    bool? multi,
    List<DUICollectionModel>? collection,
    FieldFormatModel? format,
    List<FieldsConditions>? conditions,
    List<DUIFieldModel>? subFields,
  }) {
    return DUIFieldModel(
      type: type ?? this.type,
      key: key ?? this.key,
      id: id ?? this.id,
      placeholder: placeholder ?? this.placeholder,
      keyboard: keyboard ?? this.keyboard,
      isRequired: isRequired ?? this.isRequired,
      multi: multi ?? this.multi,
      isVisible: isVisible ?? this.isVisible,
      collection: collection ?? this.collection,
      format: format ?? this.format,
      conditions: conditions ?? this.conditions,
      subFields: subFields ?? this.subFields,
    );
  }

  @override
  String toString() {
    return 'DUIFieldModel(type: $type, key: $key, id: $id, placeholder: $placeholder, keyboard: $keyboard, isRequired: $isRequired, isVisible: $isVisible, collection: $collection format: $format, conditions: $conditions)';
  }

  @override
  bool operator ==(covariant DUIFieldModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.key == key &&
        other.id == id &&
        other.placeholder == placeholder &&
        other.keyboard == keyboard &&
        other.isRequired == isRequired &&
        other.isVisible == isVisible &&
        other.multi == multi &&
        listEquals(other.collection, collection) &&
        other.format == format &&
        listEquals(other.conditions, conditions) &&
        listEquals(other.subFields, subFields);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        key.hashCode ^
        id.hashCode ^
        placeholder.hashCode ^
        keyboard.hashCode ^
        isRequired.hashCode ^
        isVisible.hashCode ^
        multi.hashCode ^
        collection.hashCode ^
        format.hashCode ^
        conditions.hashCode ^
        subFields.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toString(),
      'key': key,
      'id': id,
      'placeholder': placeholder,
      'keyboard': keyboard.toString(),
      'isRequired': isRequired,
      'isVisible': isVisible,
      'multi': multi,
      'isSub': isSub,
      'collection': collection.map((x) => x.toMap()).toList(),
      'format': format?.toMap(),
      'conditions': conditions.map((x) => x.toMap()).toList(),
      'subFields': subFields.map((x) => x.toMap()).toList(),
    };
  }
}

class DUICollectionModel {
  DUICollectionModel({
    required this.icon,
    required this.key,
    required this.placeholder,
    required this.isRequired,
  });

  final String? icon;
  final String? key;
  final String? placeholder;
  final bool isRequired;

  factory DUICollectionModel.fromJson(Map<String, dynamic> json) {
    return DUICollectionModel(
      icon: json["icon"] is Map ? json["icon"]['svg'] : json["icon"],
      key: json["key"].toString(),
      placeholder: json["value"] != null ? json["value"]['value'] : null,
      isRequired: json["is_required"] == true,
    );
  }

  DUICollectionModel copyWith({
    String? icon,
    String? key,
    String? placeholder,
    bool? isRequired,
  }) {
    return DUICollectionModel(
      icon: icon ?? this.icon,
      key: key ?? this.key,
      placeholder: placeholder ?? this.placeholder,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'icon': icon, 'key': key, 'placeholder': placeholder, "is_required": isRequired};
  }

  @override
  bool operator ==(covariant DUICollectionModel other) {
    if (identical(this, other)) return true;

    return other.icon == icon && other.key == key && other.placeholder == placeholder && other.isRequired == isRequired;
  }

  @override
  int get hashCode {
    return icon.hashCode ^ key.hashCode ^ placeholder.hashCode ^ isRequired.hashCode;
  }
}

class FieldFormatModel {
  dynamic max;
  dynamic min;
  dynamic date;
  dynamic format;
  dynamic initial;

  FieldFormatModel({this.max, this.min, this.format, this.initial, this.date});

  FieldFormatModel.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    min = json['min'];
    format = json['format'];
    initial = json['initial'];
    date = json['date'];
  }

  @override
  bool operator ==(covariant FieldFormatModel other) {
    if (identical(this, other)) return true;

    return other.max == max && other.min == min && other.format == format && other.initial == initial;
  }

  @override
  int get hashCode {
    return max.hashCode ^ min.hashCode ^ format.hashCode ^ initial.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'max': max,
      'min': min,
      'date': date,
      'format': format,
      'initial': initial,
    };
  }

  FieldFormatModel copyWith({
    dynamic max,
    dynamic min,
    dynamic date,
    dynamic format,
    dynamic initial,
  }) {
    return FieldFormatModel(
      max: max ?? this.max,
      min: min ?? this.min,
      date: date ?? this.date,
      format: format ?? this.format,
      initial: initial ?? this.initial,
    );
  }
}

class FieldsConditions {
  DynamicConditions? condition;
  String? value;
  String? actionId;
  String? api_collections;
  DynamicActions? action_true;
  DynamicActions? action_false;

  FieldsConditions({this.condition, this.value,  this.actionId, this.action_false, this.action_true});

  FieldsConditions.fromJson(Map<String, dynamic> json) {
    condition = DynamicConditions.fromStr(json['condition'].toString());
    action_false = DynamicActions.fromStr(json['action_false'].toString());
    action_true = DynamicActions.fromStr(json['action_true'].toString());
    value = json['value'];
    api_collections = json['api_collections'];
    actionId = json['action_id'].toString();
  }

  @override
  String toString() {
    return 'FieldsConditions(condition: $condition, actionId: $actionId, action_true: $action_true, action_false: $action_false)';
  }

  @override
  bool operator ==(covariant FieldsConditions other) {
    if (identical(this, other)) return true;

    return other.condition == condition &&
        other.value == value &&
        other.actionId == actionId &&
        other.api_collections == api_collections &&
        other.action_true == action_true &&
        other.action_false == action_false;
  }

  @override
  int get hashCode {
    return condition.hashCode ^
        value.hashCode ^
        actionId.hashCode ^
        api_collections.hashCode ^
        action_true.hashCode ^
        action_false.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'condition': condition?.toString(),
      'value': value,
      'actionId': actionId,
      'api_collections': api_collections,
      'action_true': action_true?.toString(),
      'action_false': action_false?.toString(),
    };
  }
}
