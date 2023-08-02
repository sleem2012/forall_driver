import 'package:collection/collection.dart';
import 'package:forall_driver/data/models/global/product/product_details_model.dart';

class ProductModel {
  bool? success;
  String? status;
  String? message;
  List<ProductSysData>? data;

  ProductModel({this.success, this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductSysData>[];
      json['data'].forEach((v) {
        data!.add(ProductSysData.fromJson(v));
      });
    }
  }

  ProductModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<ProductSysData>? data,
  }) {
    return ProductModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }
}

class ProductSysData {
  int? id;
  Company? company;
  Name? name;
  Name? smallDescription;
  Name? description;
  int? position;
  bool? isVisible;
  List<ProductMenuData>? products;

  ProductSysData({this.id, this.company, this.name, this.smallDescription, this.description, this.position, this.products, this.isVisible});

  ProductSysData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    smallDescription = json['small_description'] != null ? Name.fromJson(json['small_description']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;

    position = json['position'];
    if (json['products'] != null) {
      products = <ProductMenuData>[];
      json['products'].forEach((v) {
        products!.add(ProductMenuData.fromJson(v));
      });
    }
    isVisible = json['is_visible'];
  }

  ProductSysData copyWith({
    int? id,
    Company? company,
    Name? name,
    Name? smallDescription,
    Name? description,
    int? position,
    bool? isVisible,
    List<ProductMenuData>? products,
  }) {
    return ProductSysData(
      id: id ?? this.id,
      company: company ?? this.company,
      name: name ?? this.name,
      smallDescription: smallDescription ?? this.smallDescription,
      description: description ?? this.description,
      position: position ?? this.position,
      isVisible: isVisible ?? this.isVisible,
      products: products ?? this.products,
    );
  }
}

class Company {
  int? id;
  Name? name;
  Name? description;
  Logo? logo;
  List<CoverPhotos>? coverPhotos;
  SocialLinks? socialLinks;
  Emails? emails;
  List<Commercial>? commercial;
  double? review;
  Owner? owner;
  Packages? packages;

  Company({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.coverPhotos,
    this.socialLinks,
    this.emails,
    this.commercial,
    this.review,
    this.owner,
    this.packages,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    if (json['cover_photos'] != null) {
      coverPhotos = <CoverPhotos>[];
      json['cover_photos'].forEach((v) {
        coverPhotos!.add(CoverPhotos.fromJson(v));
      });
    }
    socialLinks = json['social_links'] != null ? SocialLinks.fromJson(json['social_links']) : null;
    emails = json['emails'] != null ? Emails.fromJson(json['emails']) : null;
    // if (json['commercial'] != null) {
    //   commercial = <Commercial>[];
    //   json['commercial'].forEach((v) {
    //     commercial!.add(Commercial.fromJson(v));
    //   });
    // }
    review = json['review'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    packages = json['packages'] != null ? Packages.fromJson(json['packages']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (logo != null) {
      data['logo'] = logo!.toJson();
    }
    if (coverPhotos != null) {
      data['cover_photos'] = coverPhotos!.map((v) => v.toJson()).toList();
    }
    if (socialLinks != null) {
      data['social_links'] = socialLinks!.toJson();
    }
    if (emails != null) {
      data['emails'] = emails!.toJson();
    }
    if (commercial != null) {
      data['commercial'] = commercial!.map((v) => v.toJson()).toList();
    }
    data['review'] = review;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (packages != null) {
      data['packages'] = packages!.toJson();
    }
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

class Logo {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  Logo({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  Logo.fromJson(Map<String, dynamic> json) {
    s16px = json['16px'];
    s32px = json['32px'];
    s64px = json['64px'];
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['16px'] = s16px;
    data['32px'] = s32px;
    data['64px'] = s64px;
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    return data;
  }
}

class CoverPhotos {
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  CoverPhotos({this.s128px, this.s256px, this.s512px, this.s1024px});

  CoverPhotos.fromJson(Map<String, dynamic> json) {
    s128px = json['128px'];
    s256px = json['256px'];
    s512px = json['512px'];
    s1024px = json['1024px'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['128px'] = s128px;
    data['256px'] = s256px;
    data['512px'] = s512px;
    data['1024px'] = s1024px;
    return data;
  }
}

class SocialLinks {
  String? facebook;

  SocialLinks({this.facebook});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facebook'] = facebook;
    return data;
  }
}

class Emails {
  String? sales;
  String? support;

  Emails({this.sales, this.support});

  Emails.fromJson(Map<String, dynamic> json) {
    sales = json['sales'];
    support = json['support'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sales'] = sales;
    data['support'] = support;
    return data;
  }
}

class Commercial {
  String? id;
  String? key;
  String? file;

  Commercial({this.id, this.key, this.file});

  Commercial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['file'] = file;
    return data;
  }
}

class Owner {
  int? id;
  String? name;
  String? email;
  String? mobile;
  Logo? image;
  String? gender;
  String? birthdate;
  int? typeId;
  int? langId;
  int? currencyId;
  AddressId? addressId;
  bool? isOnline;
  bool? isBlocked;

  Owner({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.image,
    this.gender,
    this.birthdate,
    this.typeId,
    this.langId,
    this.currencyId,
    this.addressId,
    this.isOnline,
    this.isBlocked,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? Logo.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address'] != null ? AddressId.fromJson(json['address']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    return data;
  }
}

class AddressId {
  int? id;
  int? cityId;
  String? latitude;
  String? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailedAddress;
  String? createdAt;
  String? updatedAt;

  AddressId(
      {this.id,
      this.cityId,
      this.latitude,
      this.longitude,
      this.state,
      this.street,
      this.building,
      this.intercom,
      this.floor,
      this.zipcode,
      this.detailedAddress,
      this.createdAt,
      this.updatedAt});

  AddressId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    state = json['state'];
    street = json['street'];
    building = json['building'];
    intercom = json['intercom'];
    floor = json['floor'];
    zipcode = json['zipcode'];
    detailedAddress = json['detailed_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city_id'] = cityId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['state'] = state;
    data['street'] = street;
    data['building'] = building;
    data['intercom'] = intercom;
    data['floor'] = floor;
    data['zipcode'] = zipcode;
    data['detailed_address'] = detailedAddress;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Packages {
  int? id;
  String? code;
  double? cost;
  double? tax;
  double? fees;
  Name? name;
  Name? description;
  CompanyType? companyType;
  Currency? currency;

  Packages({this.id, this.code, this.cost, this.tax, this.fees, this.name, this.description, this.companyType, this.currency});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    cost = double.tryParse(json['cost'].toString());
    tax = double.tryParse(json['tax'].toString());
    fees = double.tryParse(json['fees'].toString());
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    companyType = json['company_type'] != null ? CompanyType.fromJson(json['company_type']) : null;
    currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['cost'] = cost;
    data['tax'] = tax;
    data['fees'] = fees;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (companyType != null) {
      data['company_type'] = companyType!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

class CompanyType {
  int? id;
  String? key;
  Name? name;
  Iconss? icons;

  CompanyType({this.id, this.key, this.name, this.icons});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    icons = json['icons'] != null ? Iconss.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    return data;
  }
}

class Iconss {
  String? svg;

  Iconss({this.svg});

  Iconss.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }
}

class Currency {
  int? id;
  double? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  Currency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  Currency.fromJson(Map<String, dynamic> json) {
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
}
