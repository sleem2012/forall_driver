// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' hide Category;

import 'package:forall_driver/data/models/global/product/img_model.dart';
import 'package:forall_driver/data/models/global/product/product_model.dart';
import 'package:forall_driver/data/models/user_info/user_model.dart' hide Category, Name;

import '../global/product/product_details_model.dart';
import '../user_info/company_model.dart';
import 'shipment_type.dart';

class OrderModel {
  bool? success;
  String? status;
  String? message;
  List<OrderData>? data;

  OrderModel({this.success, this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderData>[];
      json['data'].forEach((v) {
        data!.add(OrderData.fromJson(v));
      });
    }
  }

  OrderModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<OrderData>? data,
  }) {
    return OrderModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }
}

class OrderData {
  int? id;
  String? state;
  String? created_at;
  String? updated_at;
  Vendor? vendor;
  OrderUser? orderUser;
  String? distanceMeters;
  num? riderCost;
  num? vendorCost;
  String? currency;
  OrderRider? orderRider;
  Address? source;
  Address? destination;
  int? vendorChatId;
  int? riderChatId;
  int? followingId;
  String? provider;
  String? qrVendor;
  String? qrClient;
  String? user_note;
  String? canceledReason;
  ShippingContent? shippingContent;
  ProviderOfferModel? shippingProviderContent;

  OrderData({
    this.id,
    this.state,
    this.vendor,
    this.orderUser,
    this.orderRider,
    this.source,
    this.distanceMeters,
    this.riderCost,
    this.vendorCost,
    this.currency,
    this.destination,
    this.vendorChatId,
    this.riderChatId,
    this.followingId,
    this.provider,
    this.qrVendor,
    this.qrClient,
    this.canceledReason,
    this.shippingContent,
    this.created_at,
    this.updated_at,
    this.user_note,
    this.shippingProviderContent,
  });

  OrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    distanceMeters = json['distance_meters'];
    riderCost = json['rider_cost'];
    vendorCost = json['vendor_cost'];
    currency = json['currency'];
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
    orderRider = json['order_rider'] != null ? OrderRider.fromJson(json['order_rider']) : null;
    source = json['source'] != null ? Address.fromJson(json['source']) : null;
    destination = json['destination'] != null ? Address.fromJson(json['destination']) : null;
    orderUser = json['order_user'] != null ? OrderUser.fromJson(json['order_user']) : null;
    vendorChatId = json['vendor_chat_id'];
    riderChatId = json['rider_chat_id'];
    followingId = json['following_id'];
    provider = json['provider'];
    user_note = json['user_note'];
    qrVendor = json['qr_vendor'];
    qrClient = json['qr_client'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    canceledReason = json['canceled_reason'];
    shippingContent = json['shipping_content'] != null ? ShippingContent.fromJson(json['shipping_content']) : null;
    shippingProviderContent = json['shipping_provider_content'] != null ? ProviderOfferModel.fromJson(json['shipping_provider_content']) : null;
    // if (json['products'] != null) {
    //   products = <Products>[];
    //   json['products'].forEach((v) {
    //     products!.add(Products.fromJson(v));
    //   });
    // }
  }




  OrderData copyWith({
    int? id,
    String? state,
    String? created_at,
    String? updated_at,
    Vendor? vendor,
    OrderUser? orderUser,
    String? distanceMeters,
    num? riderCost,
    num? vendorCost,
    String? currency,
    OrderRider? orderRider,
    Address? source,
    Address? destination,
    int? vendorChatId,
    int? riderChatId,
    int? followingId,
    String? provider,
    String? qrVendor,
    String? qrClient,
    String? user_note,
    String? canceledReason,
    ShippingContent? shippingContent,
    ProviderOfferModel? shippingProviderContent,
  }) {
    return OrderData(
      id: id ?? this.id,
      state: state ?? this.state,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      vendor: vendor ?? this.vendor,
      orderUser: orderUser ?? this.orderUser,
      distanceMeters: distanceMeters ?? this.distanceMeters,
      riderCost: riderCost ?? this.riderCost,
      vendorCost: vendorCost ?? this.vendorCost,
      currency: currency ?? this.currency,
      orderRider: orderRider ?? this.orderRider,
      source: source ?? this.source,
      destination: destination ?? this.destination,
      vendorChatId: vendorChatId ?? this.vendorChatId,
      riderChatId: riderChatId ?? this.riderChatId,
      followingId: followingId ?? this.followingId,
      provider: provider ?? this.provider,
      qrVendor: qrVendor ?? this.qrVendor,
      qrClient: qrClient ?? this.qrClient,
      user_note: user_note ?? this.user_note,
      canceledReason: canceledReason ?? this.canceledReason,
      shippingContent: shippingContent ?? this.shippingContent,
      shippingProviderContent: shippingProviderContent ?? this.shippingProviderContent,
    );
  }




}

class Items {
  int? id;
  String? name;
  String? description;
  ProductColor? productColor;
  ProductSize? productSize;
  List<ImagesModel>? images;
  String? quantity;
  num? price;
  num? discount;
  bool? isOffer;
  bool? isCouponAdded;
  String? timePikerFrom;
  String? timePikerTo;
  String? note;
  // List<CartItemExtra>? extras;

  Items({
    this.id,
    this.name,
    this.description,
    this.productColor,
    this.productSize,
    this.images,
    this.quantity,
    this.price,
    this.discount,
    this.isOffer,
    this.isCouponAdded,
    this.timePikerFrom,
    this.timePikerTo,
    this.note,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? json['name']['value'] : null;
    description = json['description'] != null ? json['description']['value'] : null;
    productColor = json['product_color'] != null ? ProductColor.fromJson(json['product_color']) : null;
    productSize = json['product_size'] != null ? ProductSize.fromJson(json['product_size']) : null;
    if (json['images'] != null) {
      images = <ImagesModel>[];
      json['images'].forEach((v) {
        images!.add(ImagesModel.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    isOffer = json['is_offer'] ?? false;
    isCouponAdded = json['is_coupon_added'];
    timePikerFrom = json['time_piker_from'];
    timePikerTo = json['time_piker_to'];
    note = json['note'];
  }
}

class Shippers {
  Distance? distance;
  Weight? weight;
  Weight? duration;
  List<ProviderOfferModel>? offers;

  Shippers({this.distance, this.weight, this.duration, this.offers});

  Shippers.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null ? Distance.fromJson(json['distance']) : null;
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    duration = json['duration'] != null ? Weight.fromJson(json['duration']) : null;
    if (json['offers'] != null) {
      offers = <ProviderOfferModel>[];
      json['offers'].forEach((v) {
        offers!.add(ProviderOfferModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (distance != null) {
      data['distance'] = distance!.toJson();
    }
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (duration != null) {
      data['duration'] = duration!.toJson();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProviderContentModel {
  int? id;
  String? icon;
  String? name;

  ProviderContentModel({this.id, this.icon, this.name});

  ProviderContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['icon'] = icon;
    data['name'] = name;
    return data;
  }
}

class Distance {
  String? unit;
  num? total;

  Distance({this.unit, this.total});

  Distance.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['total'] = total;
    return data;
  }
}

class Weight {
  String? unit;
  num? total;

  Weight({this.unit, this.total});

  Weight.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['total'] = total;
    return data;
  }
}

class ProviderOfferModel {
  int? id;
  String? name;
  String? icon;
  String? type;
  String? price;
  num? rider_commission_gross;
  num? rider_commission_nett;

  ProviderOfferModel({this.id, this.name, this.icon, this.type, this.price, this.rider_commission_gross, this.rider_commission_nett});

  ProviderOfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    type = json['type'];
    price = json['price'];
    rider_commission_gross = json['rider_commission_gross'];
    rider_commission_nett = json['rider_commission_nett'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['type'] = type;
    data['price'] = price;
    return data;
  }

  @override
  bool operator ==(covariant ProviderOfferModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.icon == icon && other.type == type && other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ icon.hashCode ^ type.hashCode ^ price.hashCode;
  }
}

class ShippingContent {
  int? id;
  List<Items>? items;
  ServiceType? features;
  int? quantity;
  Shippers? shippers;
  String? supTotal;
  double? vendorCommissionNett;
  double? vendorCommissionGross;

  ShippingContent(
      {this.id, this.items, this.features, this.quantity, this.shippers, this.supTotal, this.vendorCommissionNett, this.vendorCommissionGross});

  ShippingContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    quantity = json['quantity'];
    shippers = json['shippers'] != null ? Shippers.fromJson(json['shippers']) : null;
    supTotal = json['sup_total'];
    vendorCommissionNett = json['vendor_commission_nett'];
    vendorCommissionGross = json['vendor_commission_gross'];
    features = ServiceType.formString(json['features']);
  }
}

class DriverAttribute {
  int? id;
  int? attributeId;
  String? key;
  String? placeholder;
  String? type;
  List<AnswerCollections>? answerCollections;

  DriverAttribute({this.id, this.attributeId, this.key, this.placeholder, this.answerCollections});

  DriverAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    key = json['key'];
    type = json['type'];
    placeholder = (json['placeholder'] != null && json['placeholder'].toString().isNotEmpty) ? json['placeholder']["value"] : null;
    if (json['answer_collections'] != null) {
      answerCollections = <AnswerCollections>[];
      json['answer_collections'].forEach((v) {
        answerCollections!.add(AnswerCollections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute_id'] = attributeId;
    data['key'] = key;
    data['type'] = type;
    if (placeholder != null) {
      data['placeholder'] = {"value": placeholder};
    }
    if (answerCollections != null) {
      data['answer_collections'] = answerCollections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnswerCollections {
  String? key;
  String? placeholder;
  String? value;

  AnswerCollections({this.key, this.placeholder, this.value});

  AnswerCollections.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    placeholder = (json['placeholder'] != null && json['placeholder'].toString().isNotEmpty) ? json['placeholder']["value"] : null;
    value = json['value'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['placeholder'] = {"value": placeholder};
    data['value'] = value;
    return data;
  }
}

class OrderUser {
  int? id;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? mobile;
  ImagesModel? image;
  String? gender;
  String? birthdate;
  String? fcmToken;
  String? timezone;
  Type? type;
  Currency? currency;
  Address? address;
  CompanyModel? company;
  UserCompanyBranchModel? companyBranch;
  String? token;
  String? tokenExpired;
  bool? isOnline;
  bool? isBlocked;

  OrderUser({
    this.id,
    this.name,
    this.email,
    this.isEmailVerified,
    this.mobile,
    this.image,
    this.gender,
    this.birthdate,
    this.fcmToken,
    this.timezone,
    this.type,
    this.currency,
    this.address,
    this.company,
    this.companyBranch,
    this.token,
    this.tokenExpired,
    this.isOnline,
    this.isBlocked,
  });

  OrderUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isEmailVerified = json['is_email_verified'];
    mobile = json['mobile'];
    image = json['image'] != null ? ImagesModel.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;

    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    company = json['company'] != null ? CompanyModel.fromJson(json['company']) : null;
    companyBranch = json['company_branch'];

    token = json['token'];
    tokenExpired = json['token_expired'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
  }
}

class Vendor {
  int? id;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? mobile;
  ImagesModel? image;
  String? gender;
  String? birthdate;
  String? fcmToken;
  String? timezone;
  int? nationality;
  Type? type;
  Currency? currency;
  Address? address;
  Company? company;
  UserCompanyBranchModel? companyBranch;
  String? token;
  String? tokenExpired;
  Category? category;
  bool? isOnline;
  bool? isBlocked;
  String? blockReason;

  Vendor(
      {this.id,
      this.name,
      this.email,
      this.isEmailVerified,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.fcmToken,
      this.timezone,
      this.nationality,
      this.type,
      this.currency,
      this.address,
      this.company,
      this.companyBranch,
      this.token,
      this.tokenExpired,
      this.category,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isEmailVerified = json['is_email_verified'];
    mobile = json['mobile'];
    image = json['image'] != null ? ImagesModel.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    companyBranch = json['company_branch'];
    token = json['token'];
    tokenExpired = json['token_expired'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }
}

class Type {
  int? id;
  String? role;
  String? name;

  Type({this.id, this.role, this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'] != null ? json['name']['value'] : null;
  }
}

class OrderRider {
  int? id;
  String? name;
  String? email;
  Rider? attrs;
  bool? isEmailVerified;
  String? mobile;
  ImagesModel? image;
  String? gender;
  String? birthdate;
  String? fcmToken;
  String? timezone;
  int? nationality;
  Type? type;
  Currency? currency;
  Address? address;
  Company? company;
  UserCompanyBranchModel? companyBranch;
  String? token;
  String? tokenExpired;
  Category? category;
  bool? isOnline;
  bool? isBlocked;
  String? blockReason;

  OrderRider(
      {this.id,
      this.name,
      this.email,
      this.isEmailVerified,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.fcmToken,
      // this.rider,
      this.timezone,
      this.nationality,
      this.type,
      this.currency,
      this.address,
      this.company,
      this.companyBranch,
      this.token,
      this.tokenExpired,
      this.category,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  OrderRider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    attrs = json['rider'] != null ? Rider.fromJson(json['rider']) : null;

    isEmailVerified = json['is_email_verified'];
    mobile = json['mobile'];
    image = json['image'] != null ? ImagesModel.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    company = json['company'];
    companyBranch = json['company_branch'];
    token = json['token'];
    tokenExpired = json['token_expired'];
    category = json['category'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }
}
