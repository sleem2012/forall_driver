import '../global/location/adresses/adress_model.dart';
import '../global/product/img_model.dart';
import '../order/shipment_type.dart';

class CompanyModel {
  int? id;
  NameModel? name;
  NameModel? description;
  ImagesModel? logo;
  dynamic coverPhotos;
  SocialLinks? socialLinks;
  Emails? emails;
  dynamic hotlines;
  CommercialModel? commercials;
  double? review;
  bool? isLock;
  String? lockReason;
  CompanyOwner? owner;
  dynamic agent;
  CompanyPackages? packages;
  int? packagesEndAt;

  CompanyModel({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.coverPhotos,
    this.socialLinks,
    this.emails,
    this.hotlines,
    this.commercials,
    this.review,
    this.isLock,
    this.lockReason,
    this.owner,
    this.agent,
    this.packages,
    this.packagesEndAt,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? NameModel.fromJson(json['name']) : null;
    description = json['description'] != null ? NameModel.fromJson(json['description']) : null;
    logo = json['logo'] != null ? ImagesModel.fromJson(json['logo']) : null;
    coverPhotos = json['cover_photos'];
    socialLinks = json['social_links'] != null ? SocialLinks.fromJson(json['social_links']) : null;
    emails = json['emails'] != null ? Emails.fromJson(json['emails']) : null;
    hotlines = json['hotlines'];
    commercials = json['commercial'] != null ? CommercialModel.fromJson(json['commercial']) : null;
    review = json['review'];
    isLock = json['is_lock'];
    lockReason = json['lock_reason'];
    owner = json['owner'] != null ? CompanyOwner.fromJson(json['owner']) : null;
    agent = json['agent'];
    packages = json['packages'] != null ? CompanyPackages.fromJson(json['packages']) : null;
    packagesEndAt = json['packages_end_at'];
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
    data['cover_photos'] = coverPhotos;
    if (socialLinks != null) {
      data['social_links'] = socialLinks!.toJson();
    }
    if (emails != null) {
      data['emails'] = emails!.toJson();
    }
    data['hotlines'] = hotlines;
    if (commercials != null) {
      data['commercial'] = commercials!.toJson();
    }
    data['review'] = review;
    data['is_lock'] = isLock;
    data['lock_reason'] = lockReason;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['agent'] = agent;
    if (packages != null) {
      data['packages'] = packages!.toJson();
    }
    data['packages_end_at'] = packagesEndAt;
    return data;
  }
}

class NameModel {
  String? key;
  String? value;

  NameModel({this.key, this.value});

  NameModel.fromJson(Map<String, dynamic> json) {
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

class SocialLinks {
  String? youTube;
  String? twitter;
  String? website;
  String? whatsApp;
  String? facebook;
  String? linkedin;
  String? snapchat;
  String? instagram;
  String? company_mobile;

  SocialLinks({this.youTube, this.twitter, this.website, this.whatsApp, this.facebook, this.linkedin, this.snapchat, this.instagram});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    youTube = json['YouTube'];
    twitter = json['twitter'];
    website = json['website'];
    whatsApp = json['WhatsApp'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    snapchat = json['snapchat'];
    instagram = json['instagram'];
    company_mobile = json['company_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['YouTube'] = youTube;
    data['twitter'] = twitter;
    data['website'] = website;
    data['WhatsApp'] = whatsApp;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['snapchat'] = snapchat;
    data['instagram'] = instagram;
    data['company_mobile'] = company_mobile;
    return data;
  }
}

class Emails {
  String? sales;
  String? contact;
  String? recruitment;

  Emails({this.sales, this.contact, this.recruitment});

  Emails.fromJson(Map<String, dynamic> json) {
    sales = json['sales'];
    contact = json['contact'];
    recruitment = json['recruitment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sales'] = sales;
    data['contact'] = contact;
    data['recruitment'] = recruitment;
    return data;
  }
}

class Commercial {
  Tax? tax;
  Tax? maarof;
  Tax? entity;
  Tax? commercial;

  Commercial({this.tax, this.maarof, this.entity, this.commercial});

  Commercial.fromJson(Map<String, dynamic> json) {
    tax = json['tax'] != null ? Tax.fromJson(json['tax']) : null;
    maarof = json['Maarof'] != null ? Tax.fromJson(json['Maarof']) : null;
    entity = json['entity'] != null ? Tax.fromJson(json['entity']) : null;
    commercial = json['commercial'] != null ? Tax.fromJson(json['commercial']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tax != null) {
      data['tax'] = tax!.toJson();
    }
    if (maarof != null) {
      data['Maarof'] = maarof!.toJson();
    }
    if (entity != null) {
      data['entity'] = entity!.toJson();
    }
    if (commercial != null) {
      data['commercial'] = commercial!.toJson();
    }
    return data;
  }
}

class CommercialModel {
  Tax? tax;
  Tax? maarof;
  Tax? entity;
  Tax? commercial;
  Tax? chamberMembership;

  CommercialModel({this.tax, this.maarof, this.entity, this.commercial, this.chamberMembership});

  CommercialModel.fromJson(Map<String, dynamic> json) {
    tax = json['tax'] != null ? Tax.fromJson(json['tax']) : null;
    maarof = json['Maarof'] != null ? Tax.fromJson(json['Maarof']) : null;
    entity = json['entity'] != null ? Tax.fromJson(json['entity']) : null;
    commercial = json['commercial'] != null ? Tax.fromJson(json['commercial']) : null;
    chamberMembership = json['chamber_membership'] != null ? Tax.fromJson(json['chamber_membership']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tax != null) {
      data['tax'] = tax!.toJson();
    }
    if (maarof != null) {
      data['Maarof'] = maarof!.toJson();
    }
    if (entity != null) {
      data['entity'] = entity!.toJson();
    }
    if (commercial != null) {
      data['commercial'] = commercial!.toJson();
    }
    if (chamberMembership != null) {
      data['chamber_membership'] = chamberMembership!.toJson();
    }
    return data;
  }
}

class Tax {
  ImagesModel? file;
  String? value;

  Tax({this.file, this.value});

  Tax.fromJson(Map<String, dynamic> json) {
    file = (json['file'] != null && json['file'] != '') ? ImagesModel.fromJson(json['file']) : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (file != null) {
      data['file'] = file!.toJson();
    }
    data['value'] = value;
    return data;
  }
}

class CompanyOwner {
  int? id;
  String? name;
  String? email;
  String? mobile;
  ImagesModel? image;
  String? gender;
  String? birthdate;
  String? timezone;
  int? nationality;
  int? typeId;
  int? langId;
  int? currencyId;
  AddressModel? addressId;
  bool? isOnline;
  bool? isBlocked;
  dynamic blockReason;

  CompanyOwner(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.gender,
      this.birthdate,
      this.timezone,
      this.nationality,
      this.typeId,
      this.langId,
      this.currencyId,
      this.addressId,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  CompanyOwner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? ImagesModel.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address'] != null ? AddressModel.fromJson(json['address']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
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
    data['timezone'] = timezone;
    data['nationality'] = nationality;
    data['type_id'] = typeId;
    data['lang_id'] = langId;
    data['currency_id'] = currencyId;
    if (addressId != null) {
      data['address'] = addressId!.toJson();
    }
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    return data;
  }
}

class CompanyPackages {
  int? id;
  String? code;
  int? subscribeDays;
  String? price;
  NameModel? name;
  NameModel? description;
  CompanyType? companyType;

  CompanyPackages({this.id, this.code, this.subscribeDays, this.price, this.name, this.description, this.companyType});

  CompanyPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    subscribeDays = json['subscribe_days'];
    price = json['price'];
    name = json['name'] != null ? NameModel.fromJson(json['name']) : null;
    description = json['description'] != null ? NameModel.fromJson(json['description']) : null;
    companyType = json['company_type'] != null ? CompanyType.fromJson(json['company_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['subscribe_days'] = subscribeDays;
    data['price'] = price;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (companyType != null) {
      data['company_type'] = companyType!.toJson();
    }
    return data;
  }
}

class CompanyType {
  int? id;
  String? key;
  ServiceType? service_type;
  NameModel? name;
  Icons? icons;

  CompanyType({this.id, this.service_type, this.name, this.icons});

  CompanyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service_type = ServiceType.formString(json['key']);
    key = json['key'];
    name = json['name'] != null ? NameModel.fromJson(json['name']) : null;
    icons = json['icons'] != null ? Icons.fromJson(json['icons']) : null;
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

class Icons {
  String? svg;

  Icons({this.svg});

  Icons.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }
}
