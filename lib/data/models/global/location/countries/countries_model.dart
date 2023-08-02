class CountriesModel {
  bool? success;
  String? status;
  String? message;
  List<CountriesDatum>? data;

  CountriesModel({this.success, this.status, this.message, this.data});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CountriesDatum>[];
      json['data'].forEach((v) {
        data!.add(CountriesDatum.fromJson(v));
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

class CountriesDatum {
  int? id;
  String? symbols;
  Name? name;
  Name? nationality;
  DefaultLanguage? defaultLanguage;
  String? flag;
  bool? isVisible;

  CountriesDatum({this.id, this.symbols, this.name, this.nationality, this.defaultLanguage, this.flag, this.isVisible});

  CountriesDatum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    nationality = json['nationality'] != null ? Name.fromJson(json['nationality']) : null;
    defaultLanguage = json['default_language'] != null ? DefaultLanguage.fromJson(json['default_language']) : null;
    flag = json['flag'] != null
        ? json['flag'] is List
            ? null
            : json['flag']['svg']
        : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (nationality != null) {
      data['nationality'] = nationality!.toJson();
    }
    if (defaultLanguage != null) {
      data['default_language'] = defaultLanguage!.toJson();
    }
    if (flag != null) {
      data['flag'] = flag;
    }
    data['is_visible'] = isVisible;
    return data;
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
}

class DefaultLanguage {
  int? id;
  String? symbols;
  Name? nameValues;

  DefaultLanguage({this.id, this.symbols, this.nameValues});

  DefaultLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    nameValues = json['name_values'] != null ? Name.fromJson(json['name_values']) : null;
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

class Flag {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;

  Flag({this.s16px, this.s32px, this.s64px, this.s128px});

  Flag.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
    s128px = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    return data;
  }
}
