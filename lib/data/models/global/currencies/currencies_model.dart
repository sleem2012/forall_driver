import 'package:flutter/foundation.dart';

class CurrenciesModel {
  bool? success;
  String? status;
  String? message;
  List<CurrenciesData>? data;

  CurrenciesModel({this.success, this.status, this.message, this.data});

  CurrenciesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CurrenciesData>[];
      json['data'].forEach((v) {
        data!.add(CurrenciesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(covariant CurrenciesModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }

  CurrenciesModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<CurrenciesData>? data,
  }) {
    return CurrenciesModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class CurrenciesData {
  int? id;
  double? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  CurrenciesData({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  CurrenciesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dollar = double.tryParse(json['dollar'].toString());
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dollar'] = dollar;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['is_visible'] = isVisible;
    return data;
  }

  @override
  bool operator ==(covariant CurrenciesData other) {
    if (identical(this, other)) return true;

    return other.id == id && other.dollar == dollar && other.symbols == symbols && other.name == name && other.isVisible == isVisible;
  }

  @override
  int get hashCode {
    return id.hashCode ^ dollar.hashCode ^ symbols.hashCode ^ name.hashCode ^ isVisible.hashCode;
  }

  CurrenciesData copyWith({
    int? id,
    double? dollar,
    String? symbols,
    Name? name,
    bool? isVisible,
  }) {
    return CurrenciesData(
      id: id ?? this.id,
      dollar: dollar ?? this.dollar,
      symbols: symbols ?? this.symbols,
      name: name ?? this.name,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}

class Name {
  String? key;
  String? value;

  Name({this.key, this.value});

  Name.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }

  @override
  bool operator ==(covariant Name other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;

  Name copyWith({
    String? key,
    String? value,
  }) {
    return Name(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}
