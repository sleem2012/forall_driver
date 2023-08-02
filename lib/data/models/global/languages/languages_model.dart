class LanguagesModel {
  bool? success;
  String? status;
  String? message;
  List<LangDatum>? data;

  LanguagesModel({this.success, this.status, this.message, this.data});

  LanguagesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LangDatum>[];
      json['data'].forEach((v) {
        data!.add(LangDatum.fromJson(v));
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
}

class LangDatum {
  int? id;
  String? symbols;
  NameValues? nameValues;

  LangDatum({this.id, this.symbols, this.nameValues});

  LangDatum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    nameValues = json['name_values'] != null ? NameValues.fromJson(json['name_values']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (nameValues != null) {
      data['name_values'] = nameValues!.toJson();
    }
    return data;
  }
}

class NameValues {
  String? key;
  String? value;

  NameValues({this.key, this.value});

  NameValues.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}
