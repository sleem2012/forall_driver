import 'package:forall_driver/data/models/user_info/company_model.dart';

class UserModel {
  bool? success;
  String? status;
  String? message;
  UserModelData? data;

  UserModel({this.success, this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserModelData {
  int? id;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? mobile;
  UserImage? image;
  String? gender;
  String? birthdate;
  String? fcmToken;
  String? timezone;
  int? nationality;
  Type? type;
  UserLanguage? language;
  UserCurrency? currency;
  UserAddress? address;
  CompanyModel? company;
  UserCompanyBranchModel? companyBranch;
  Rider? rider;
  String? earning;
  String? token;
  String? tokenExpired;
  Category? category;
  bool? forallUser;
  bool? isOnline;
  bool? isBlocked;
  String? blockReason;

  UserModelData(
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
      this.language,
      this.currency,
      this.address,
      this.company,
      this.companyBranch,
      this.rider,
      this.earning,
      this.token,
      this.tokenExpired,
      this.category,
      this.forallUser,
      this.isOnline,
      this.isBlocked,
      this.blockReason});

  UserModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    isEmailVerified = json['is_email_verified'];
    mobile = json['mobile'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    fcmToken = json['fcmToken'];
    timezone = json['timezone'];
    nationality = json['nationality'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    language = json['language'] != null ? UserLanguage.fromJson(json['language']) : null;
    currency = json['currency'] != null ? UserCurrency.fromJson(json['currency']) : null;
    address = json['address'] != null ? UserAddress.fromJson(json['address']) : null;
    company = json['company'];
    companyBranch = json['company_branch'] != null ? UserCompanyBranchModel.fromJson(json['company_branch']) : null;
    company = json['company'] != null ? CompanyModel.fromJson(json['company']) : null;
    rider = json['rider'] != null ? Rider.fromJson(json['rider']) : null;
    earning = json['earning'];
    token = json['token'];
    tokenExpired = json['token_expired'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    forallUser = json['forall_user'];
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['is_email_verified'] = isEmailVerified;
    data['mobile'] = mobile;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['fcmToken'] = fcmToken;
    data['timezone'] = timezone;
    data['nationality'] = nationality;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    if (language != null) {
      data['language'] = language!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['company'] = company;
    data['company_branch'] = companyBranch;
    if (rider != null) {
      data['rider'] = rider!.toJson();
    }
    data['earning'] = earning;
    data['token'] = token;
    data['token_expired'] = tokenExpired;
    data['category'] = category;
    data['forall_user'] = forallUser;
    data['is_online'] = isOnline;
    data['is_blocked'] = isBlocked;
    data['block_reason'] = blockReason;
    return data;
  }
}

class UserImage {
  String? s16px;
  String? s32px;
  String? s64px;
  String? s128px;
  String? s256px;
  String? s512px;

  UserImage({this.s16px, this.s32px, this.s64px, this.s128px, this.s256px, this.s512px});

  UserImage.fromJson(Map<String, dynamic> json) {
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

class Type {
  int? id;
  String? role;

  // ActionCollection? actionCollection;
  // SearchCollection? searchCollection;
  Name? name;

  Type(
      {this.id,
      this.role,
      // this.actionCollection,
      // this.searchCollection,
      this.name});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    // actionCollection = json['action_collection'] != null
    //     ? ActionCollection.fromJson(json['action_collection'])
    //     : null;
    // searchCollection = json['search_collection'] != null
    //     ? SearchCollection.fromJson(json['search_collection'])
    //     : null;
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    // if (actionCollection != null) {
    //   data['action_collection'] = actionCollection!.toJson();
    // }
    // if (searchCollection != null) {
    //   data['search_collection'] = searchCollection!.toJson();
    // }
    if (name != null) {
      data['name'] = name!.toJson();
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

class UserLanguage {
  int? id;
  String? symbols;
  Name? nameValues;

  UserLanguage({this.id, this.symbols, this.nameValues});

  UserLanguage.fromJson(Map<String, dynamic> json) {
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

class UserCurrency {
  int? id;
  double? dollar;
  String? symbols;
  Name? name;
  bool? isVisible;

  UserCurrency({this.id, this.dollar, this.symbols, this.name, this.isVisible});

  UserCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dollar = double.parse(json['dollar'].toString());
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

class UserAddress {
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
  AddressCity? cityId;

  UserAddress(
      {this.id,
      this.latitude,
      this.longitude,
      this.state,
      this.street,
      this.building,
      this.intercom,
      this.floor,
      this.zipcode,
      this.detailedAddress,
      this.cityId});

  UserAddress.fromJson(Map<String, dynamic> json) {
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
    cityId = json['city_id'] != null ? AddressCity.fromJson(json['city_id']) : null;
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

class AddressCity {
  int? id;
  String? symbols;
  Name? name;
  AddressCountryId? countryId;
  bool? isVisible;

  AddressCity({this.id, this.symbols, this.name, this.countryId, this.isVisible});

  AddressCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    countryId = json['country_id'] != null ? AddressCountryId.fromJson(json['country_id']) : null;
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

class AddressCountryId {
  int? id;
  String? symbols;
  Name? name;
  UserLanguage? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  AddressCountryId({this.id, this.symbols, this.name, this.defaultLanguage, this.flag, this.isVisible});

  AddressCountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    defaultLanguage = json['default_language'] != null ? UserLanguage.fromJson(json['default_language']) : null;
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

class Rider {
  int? id;
  int? userId;
  String? state;
  Commercial? commercial;

  Rider({
    this.id,
    this.userId,
    this.state,
    this.commercial,
  });

  Rider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    state = json['state'];
    commercial = json['commercial'] != null ? Commercial.fromJson(json['commercial']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['state'] = state;
    if (commercial != null) {
      data['commercial'] = commercial!.toJson();
    }
    return data;
  }
}

class Commercial {
  Price? price;
  Range? range;
  Driver? driver;
  Vehicle? vehicle;
  Identity? identity;

  Commercial({
    this.price,
    this.driver,
    this.vehicle,
    this.identity,
  });

  Commercial.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    range = json['range'] != null ? Range.fromJson(json['range']) : null;
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    vehicle = json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
    identity = json['identity'] != null ? Identity.fromJson(json['identity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (range != null) {
      data['range'] = range!.toJson();
    }
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    if (identity != null) {
      data['identity'] = identity!.toJson();
    }
    return data;
  }
}

class Price {
  String? min15;
  String? min30;
  String? min45;
  String? min60;

  Price({this.min15, this.min30, this.min45, this.min60});

  Price.fromJson(Map<String, dynamic> json) {
    min15 = json['min15'];
    min30 = json['min30'];
    min45 = json['min45'];
    min60 = json['min60'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min15'] = min15;
    data['min30'] = min30;
    data['min45'] = min45;
    data['min60'] = min60;
    return data;
  }
}

class Range {
  String? lat;
  String? long;
  String? range;

  Range({
    this.lat,
    this.long,
    this.range,
  });

  Range.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['lang'];
    range = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lang'] = long;
    data['distance'] = range;
    return data;
  }
}

class Driver {
  UserImage? photo;
  License? license;
  String? serviceType;
  DateOfBirth? dateOfBirth;
  String? sequenceNumber;

  Driver({this.photo, this.license, this.serviceType, this.dateOfBirth, this.sequenceNumber});

  Driver.fromJson(Map<String, dynamic> json) {
    photo = json['photo'] != null ? UserImage.fromJson(json['photo']) : null;
    license = json['license'] != null ? License.fromJson(json['license']) : null;
    serviceType = json['service_type'];
    dateOfBirth = json['date_of_birth'] != null ? DateOfBirth.fromJson(json['date_of_birth']) : null;
    sequenceNumber = json['sequence_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    if (license != null) {
      data['license'] = license!.toJson();
    }
    data['service_type'] = serviceType;
    if (dateOfBirth != null) {
      data['date_of_birth'] = dateOfBirth!.toJson();
    }
    data['sequence_number'] = sequenceNumber;
    return data;
  }
}

class License {
  UserImage? back;
  String? type;
  String? value;
  UserImage? front;

  License({this.back, this.type, this.front});

  License.fromJson(Map<String, dynamic> json) {
    back = json['back'] != null ? UserImage.fromJson(json['back']) : null;
    type = json['type'];
    value = json['value'];
    front = json['front'] != null ? UserImage.fromJson(json['front']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (back != null) {
      data['back'] = back!.toJson();
    }
    data['type'] = type;
    data['value'] = value;
    if (front != null) {
      data['front'] = front!.toJson();
    }
    return data;
  }
}

class DateOfBirth {
  String? hijri;
  String? gregorian;

  DateOfBirth({this.hijri, this.gregorian});

  DateOfBirth.fromJson(Map<String, dynamic> json) {
    hijri = json['hijri'];
    gregorian = json['gregorian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hijri'] = hijri;
    data['gregorian'] = gregorian;
    return data;
  }
}

class Vehicle {
  String? model;
  Plate? plate;
  Images? images;
  License? license;
  String? vehicle_name;
  Certificate? certificate;
  String? vehicleType;

  Vehicle({this.model, this.plate, this.images, this.license, this.certificate, this.vehicleType});

  Vehicle.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    plate = json['plate'] != null ? Plate.fromJson(json['plate']) : null;
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    license = json['license'] != null ? License.fromJson(json['license']) : null;
    certificate = json['certificate'] != null ? Certificate.fromJson(json['certificate']) : null;
    vehicleType = json['vehicle_type'];
    vehicle_name = json['vehicle_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    if (plate != null) {
      data['plate'] = plate!.toJson();
    }
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (license != null) {
      data['license'] = license!.toJson();
    }
    if (certificate != null) {
      data['certificate'] = certificate!.toJson();
    }
    data['vehicle_type'] = vehicleType;
    data['vehicle_name'] = vehicle_name;
    return data;
  }
}

class Plate {
  String? left;
  String? right;
  String? middle;
  String? number;

  Plate({this.left, this.right, this.middle, this.number});

  Plate.fromJson(Map<String, dynamic> json) {
    left = json['left'];
    right = json['right'];
    middle = json['middle'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['left'] = left;
    data['right'] = right;
    data['middle'] = middle;
    data['number'] = number;
    return data;
  }
}

class Images {
  UserImage? back;
  UserImage? left;
  UserImage? plat;
  UserImage? front;
  UserImage? right;

  Images({this.back, this.left, this.plat, this.front, this.right});

  Images.fromJson(Map<String, dynamic> json) {
    back = json['back'] != null ? UserImage.fromJson(json['back']) : null;
    left = json['left'] != null ? UserImage.fromJson(json['left']) : null;
    plat = json['plat'] != null ? UserImage.fromJson(json['plat']) : null;
    front = json['front'] != null ? UserImage.fromJson(json['front']) : null;
    right = json['right'] != null ? UserImage.fromJson(json['right']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (back != null) {
      data['back'] = back!.toJson();
    }
    if (left != null) {
      data['left'] = left!.toJson();
    }
    if (plat != null) {
      data['plat'] = plat!.toJson();
    }
    if (front != null) {
      data['front'] = front!.toJson();
    }
    if (right != null) {
      data['right'] = right!.toJson();
    }
    return data;
  }
}

class Certificate {
  UserImage? criminalCase;
  UserImage? drugAnalysis;

  Certificate({this.criminalCase, this.drugAnalysis});

  Certificate.fromJson(Map<String, dynamic> json) {
    criminalCase = json['criminal_case'] != null ? UserImage.fromJson(json['criminal_case']) : null;
    drugAnalysis = json['drug_analysis'] != null ? UserImage.fromJson(json['drug_analysis']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (criminalCase != null) {
      data['criminal_case'] = criminalCase!.toJson();
    }
    if (drugAnalysis != null) {
      data['drug_analysis'] = drugAnalysis!.toJson();
    }
    return data;
  }
}

class Identity {
  String? type;
  String? value;
  UserImage? fileBack;
  UserImage? fileFront;

  Identity({this.type, this.value, this.fileBack, this.fileFront});

  Identity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    fileBack = json['file_back'] != null ? UserImage.fromJson(json['file_back']) : null;
    fileFront = json['file_front'] != null ? UserImage.fromJson(json['file_front']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['value'] = value;
    if (fileBack != null) {
      data['file_back'] = fileBack!.toJson();
    }
    if (fileFront != null) {
      data['file_front'] = fileFront!.toJson();
    }
    return data;
  }
}

class UserCompany {
  int? id;
  Name? name;
  Name? description;
  UserImage? logo;
  List<CompanyCoverPhotos>? coverPhotos;
  List<String>? hotlines;
  List<Commercial>? commercial;
  CompanyOwner? owner;
  dynamic agent;
  String? lock_reason;
  bool? is_lock;
  CompanyPackages? packages;
  int? packagesEndAt;

  UserCompany(
      {this.id,
      this.name,
      this.description,
      this.logo,
      this.coverPhotos,
      this.hotlines,
      this.commercial,
      this.owner,
      this.agent,
      this.packages,
      this.is_lock,
      this.lock_reason,
      this.packagesEndAt});

  UserCompany.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    is_lock = json['is_lock'];
    lock_reason = json['lock_reason'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
    logo = json['logo'] != null ? UserImage.fromJson(json['logo']) : null;
    if (json['cover_photos'] != null) {
      coverPhotos = <CompanyCoverPhotos>[];
      json['cover_photos'].forEach((v) {
        coverPhotos!.add(CompanyCoverPhotos.fromJson(v));
      });
    }
    hotlines = json['hotlines'].cast<String>();
    if (json['commercial'] != null) {
      commercial = <Commercial>[];
      json['commercial'].forEach((v) {
        commercial!.add(Commercial.fromJson(v));
      });
    }
    owner = json['owner'] != null ? CompanyOwner.fromJson(json['owner']) : null;
    agent = json['agent'];
    packages = json['packages'] != null ? CompanyPackages.fromJson(json['packages']) : null;
    packagesEndAt = json['packages_end_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lock_reason'] = lock_reason;
    data['is_lock'] = is_lock;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (packages != null) {
      data['packages'] = packages!.toJson();
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
    data['hotlines'] = hotlines;
    if (commercial != null) {
      data['commercial'] = commercial!.map((v) => v.toJson()).toList();
    }
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['packages_end_at'] = packagesEndAt;

    return data;
  }
}

class CompanyCoverPhotos {
  String? s128px;
  String? s256px;
  String? s512px;
  String? s1024px;

  CompanyCoverPhotos({this.s128px, this.s256px, this.s512px, this.s1024px});

  CompanyCoverPhotos.fromJson(Map<String, dynamic> json) {
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

class CompanyOwner {
  int? id;
  String? name;
  String? email;
  String? mobile;
  UserImage? image;
  String? gender;
  String? birthdate;
  int? typeId;
  int? langId;
  int? currencyId;
  AddressId? addressId;
  bool? isOnline;
  bool? isBlocked;
  String? blockReason;
  List<OwnerPaymentInfos>? paymentInfos;

  CompanyOwner({
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
    this.blockReason,
    this.paymentInfos,
  });

  CompanyOwner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'] != null ? UserImage.fromJson(json['image']) : null;
    gender = json['gender'];
    birthdate = json['birthdate'];
    typeId = json['type_id'];
    langId = json['lang_id'];
    currencyId = json['currency_id'];
    addressId = json['address'] != null ? AddressId.fromJson(json['address']) : null;
    isOnline = json['is_online'];
    isBlocked = json['is_blocked'];
    blockReason = json['block_reason'];
    if (json['payment_infos'] != null) {
      paymentInfos = <OwnerPaymentInfos>[];
      json['payment_infos'].forEach((v) {
        paymentInfos!.add(OwnerPaymentInfos.fromJson(v));
      });
    }
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
    data['block_reason'] = blockReason;
    if (paymentInfos != null) {
      data['payment_infos'] = paymentInfos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyPackages {
  int? id;
  String? code;
  String? price;
  Name? name;
  Name? description;
  int? subscribeDays;

  CompanyPackages({
    this.id,
    this.code,
    this.price,
    this.name,
    this.description,
    this.subscribeDays,
  });

  CompanyPackages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    price = json['price'];
    subscribeDays = json['subscribe_days'];

    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    description = json['description'] != null ? Name.fromJson(json['description']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['price'] = price;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['subscribe_days'] = subscribeDays;

    if (description != null) {
      data['description'] = description!.toJson();
    }

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
    cityId = json['city_id'];
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

class OwnerPaymentInfos {
  int? id;
  PaymentType? type;
  dynamic value;
  bool? isVisible;

  OwnerPaymentInfos({this.id, this.type, this.value, this.isVisible});

  OwnerPaymentInfos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'] != null ? PaymentType.fromJson(json['type']) : null;
    value = json['value'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    data['value'] = value;
    data['is_visible'] = isVisible;
    return data;
  }
}

class PaymentType {
  int? id;
  String? type;
  int? name;
  int? isVisible;
  String? createdAt;
  String? updatedAt;

  PaymentType({this.id, this.type, this.name, this.isVisible, this.createdAt, this.updatedAt});

  PaymentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    isVisible = json['is_visible'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['is_visible'] = isVisible;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserCompanyBranchModel {
  int? id;
  UserCompany? company;
  Address? address;

  UserCompanyBranchModel({this.id, this.company, this.address});

  UserCompanyBranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] != null ? UserCompany.fromJson(json['company']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  Name? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    return data;
  }
}

class Address {
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

  Address(
      {this.id,
      this.latitude,
      this.longitude,
      this.state,
      this.street,
      this.building,
      this.intercom,
      this.floor,
      this.zipcode,
      this.detailedAddress,
      this.cityId});

  Address.fromJson(Map<String, dynamic> json) {
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

class CountryId {
  int? id;
  String? symbols;
  Name? name;
  DefaultLanguage? defaultLanguage;
  Flag? flag;
  bool? isVisible;

  CountryId({this.id, this.symbols, this.name, this.defaultLanguage, this.flag, this.isVisible});

  CountryId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbols = json['symbols'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
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
