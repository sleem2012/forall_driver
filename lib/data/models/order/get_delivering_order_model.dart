// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'order_model.dart';

class GetDeliveringOrderModel {
  bool? success;
  String? status;
  String? message;
  List<DeliveringOrderData>? data;

  GetDeliveringOrderModel({this.success, this.status, this.message, this.data});

  GetDeliveringOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DeliveringOrderData>[];
      json['data'].forEach((v) {
        data!.add(DeliveringOrderData.fromJson(v));
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

  GetDeliveringOrderModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<DeliveringOrderData>? data,
  }) {
    return GetDeliveringOrderModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class DeliveringOrderData {
  int? id;
  num? supTotalPrice;
  num? riderCommission;
  num? discountPrice;
  num? couponPrice;
  num? shippingPrice;
  num? totalPrice;
  String? currency;
  OrderUser? orderUser;

  String? dollarRate;
  String? userNote;
  bool? hasPayShipping;
  bool? hasPaySupTotal;
  String? provider;
  dynamic completedCode;
  dynamic orderRider;
  Source? source;
  Source? destination;
  String? state;
  String? type;
  dynamic riderChat;
  String? createdAt;

  DeliveringOrderData({
    this.id,
    this.supTotalPrice,
    this.riderCommission,
    this.discountPrice,
    this.couponPrice,
    this.shippingPrice,
    this.totalPrice,
    this.currency,
    this.dollarRate,
    this.userNote,
    this.hasPayShipping,
    this.hasPaySupTotal,
    this.orderUser,
    this.provider,
    this.completedCode,
    this.orderRider,
    this.source,
    this.destination,
    this.state,
    this.type,
    this.riderChat,
    this.createdAt,
  });

  DeliveringOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    supTotalPrice = json['sup_total_price'];
    riderCommission = json['rider_commission'];
    discountPrice = json['discount_price'];
    couponPrice = json['coupon_price'];
    shippingPrice = json['shipping_price'];
    totalPrice = json['total_price'];
    currency = json['currency'];
    dollarRate = json['dollar_rate'];
    userNote = json['user_note'];
    hasPayShipping = json['has_pay_shipping'];
    hasPaySupTotal = json['has_pay_sup_total'];
    provider = json['provider'];
    completedCode = json['completed_code'];
    orderRider = json['order_rider'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    orderUser = json['order_user'] != null ? OrderUser.fromJson(json['order_user']) : null;

    destination = json['destination'] != null ? Source.fromJson(json['destination']) : null;
    state = json['state'];
    type = json['type'];
    riderChat = json['rider_chat'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sup_total_price'] = supTotalPrice;
    data['rider_commission'] = riderCommission;
    data['discount_price'] = discountPrice;
    data['coupon_price'] = couponPrice;
    data['shipping_price'] = shippingPrice;
    data['total_price'] = totalPrice;
    data['currency'] = currency;
    data['dollar_rate'] = dollarRate;
    data['user_note'] = userNote;
    data['has_pay_shipping'] = hasPayShipping;
    data['has_pay_sup_total'] = hasPaySupTotal;
    data['provider'] = provider;
    data['completed_code'] = completedCode;
    data['order_rider'] = orderRider;
    if (source != null) {
      data['source'] = source!.toJson();
    }
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    data['state'] = state;
    data['type'] = type;
    data['rider_chat'] = riderChat;
    data['created_at'] = createdAt;
    return data;
  }

  DeliveringOrderData copyWith({
    int? id,
    int? supTotalPrice,
    double? riderCommission,
    int? discountPrice,
    int? couponPrice,
    double? shippingPrice,
    int? totalPrice,
    String? currency,
    String? dollarRate,
    String? userNote,
    bool? hasPayShipping,
    bool? hasPaySupTotal,
    String? provider,
    dynamic completedCode,
    dynamic orderRider,
    Source? source,
    Source? destination,
    String? state,
    String? type,
    dynamic riderChat,
    String? createdAt,
    OrderUser? orderUser,

  }) {
    return DeliveringOrderData(
      id: id ?? this.id,
      supTotalPrice: supTotalPrice ?? this.supTotalPrice,
      riderCommission: riderCommission ?? this.riderCommission,
      discountPrice: discountPrice ?? this.discountPrice,
      couponPrice: couponPrice ?? this.couponPrice,
      shippingPrice: shippingPrice ?? this.shippingPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      currency: currency ?? this.currency,
      dollarRate: dollarRate ?? this.dollarRate,
      userNote: userNote ?? this.userNote,
      hasPayShipping: hasPayShipping ?? this.hasPayShipping,
      hasPaySupTotal: hasPaySupTotal ?? this.hasPaySupTotal,
      provider: provider ?? this.provider,
      completedCode: completedCode ?? this.completedCode,
      orderRider: orderRider ?? this.orderRider,
      source: source ?? this.source,
      destination: destination ?? this.destination,
      state: state ?? this.state,
      type: type ?? this.type,
      riderChat: riderChat ?? this.riderChat,
      createdAt: createdAt ?? this.createdAt,
      orderUser: orderUser ?? this.orderUser,
    );
  }
}

class Source {
  int? id;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  CityId? cityId;

  Source({this.id, this.latitude, this.longitude, this.state, this.street, this.building, this.intercom, this.floor, this.zipcode, this.detailedAddress, this.cityId});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    cityId = json['city_id'] != null ? CityId.fromJson(json['city_id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    if (cityId != null) {
      data['city_id'] = cityId!.toJson();
    }
    return data;
  }
}

class CityId {
  int? id;
  String? symbols;
  Name? name;
  CountryId? countryId;
  bool? isVisible;

  CityId({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  CityId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    countryId = json['country_id'] != null ? CountryId.fromJson(json['country_id']) : null;
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbols'] = symbols;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (countryId != null) {
      data['country_id'] = countryId!.toJson();
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

class CountryId {
  int? id;
  String? symbols;
  Name? name;
  Name? nationality;
  DefaultLanguage? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  CountryId({this.id, this.symbols, this.name, this.nationality, this.defaultLanguage, this.flag, this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    nationality = json['nationality'] != null ? Name.fromJson(json['nationality']) : null;
    defaultLanguage = json['default_language'] != null ? DefaultLanguage.fromJson(json['default_language']) : null;
    flag = json['flag'] != null ? Flag.fromJson(json['flag']) : null;
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
      data['flag'] = flag!.toJson();
    }
    data['is_visible'] = isVisible;
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
