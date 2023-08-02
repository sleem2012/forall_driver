import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? birthdate;
  String? fcmToken;
  String? lang_id;
  String? currency_id;
  int? city_id;
  int? nationality_id;
  double? latitude;
  double? longitude;
  String? state;
  String? street;
  String? building;
  String? intercom;
  String? floor;
  String? zipcode;
  String? detailed_address;
  String? password_confirmation;
  String? gender;
  File? image;
  String? timeZone;

  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.mobile,
    this.birthdate,
    this.fcmToken,
    this.lang_id,
    this.currency_id,
    this.city_id,
    this.latitude,
    this.longitude,
    this.nationality_id,
    this.state,
    this.street,
    this.building,
    this.intercom,
    this.floor,
    this.zipcode,
    this.detailed_address,
    this.password_confirmation,
    this.gender,
    this.image,
    this.timeZone,
  });

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? mobile,
    String? birthdate,
    String? fcmToken,
    String? lang_id,
    String? currency_id,
    int? city_id,
    double? latitude,
    double? longitude,
    String? state,
    String? street,
    String? building,
    int? nationality_id,
    String? intercom,
    String? floor,
    String? zipcode,
    String? detailed_address,
    String? password_confirmation,
    String? gender,
    File? image,
    String? timeZone,
  }) {
    return RegisterModel(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        mobile: mobile ?? this.mobile,
        birthdate: birthdate ?? this.birthdate,
        fcmToken: fcmToken ?? this.fcmToken,
        lang_id: lang_id ?? this.lang_id,
        currency_id: currency_id ?? this.currency_id,
        city_id: city_id ?? this.city_id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        state: state ?? this.state,
        street: street ?? this.street,
        building: building ?? this.building,
        intercom: intercom ?? this.intercom,
        floor: floor ?? this.floor,
        zipcode: zipcode ?? this.zipcode,
        detailed_address: detailed_address ?? this.detailed_address,
        password_confirmation: password_confirmation ?? this.password_confirmation,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        nationality_id: nationality_id ?? this.nationality_id,
        timeZone: timeZone ?? this.timeZone);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'mobile': mobile,
      'birthdate': birthdate,
      'fcmToken': fcmToken,
      'lang_id': lang_id,
      'currency_id': currency_id,
      'city_id': city_id,
      'latitude': latitude,
      'longitude': longitude,
      'state': state,
      'street': street,
      'building': building,
      'intercom': intercom,
      'floor': floor,
      'zipcode': zipcode,
      'detailed_address': detailed_address,
      'password_confirmation': password_confirmation,
      'gender': gender,
        if(image != null  ) 'image': MultipartFile.fromFileSync(image?.path ??'' , filename: image?.path.split('/').last),
      'timezone': timeZone,
      'nationality_id': nationality_id,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'RegisterModel(name: $name, nationality_id: $nationality_id, email: $email, password: $password, mobile: $mobile, birthdate: $birthdate, fcmToken: $fcmToken, lang_id: $lang_id, currency_id: $currency_id, city_id: $city_id, latitude: $latitude, longitude: $longitude, state: $state, street: $street, building: $building, intercom: $intercom, floor: $floor, zipcode: $zipcode, detailed_address: $detailed_address, password_confirmation: $password_confirmation, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.mobile == mobile &&
        other.birthdate == birthdate &&
        other.fcmToken == fcmToken &&
        other.lang_id == lang_id &&
        other.currency_id == currency_id &&
        other.city_id == city_id &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.state == state &&
        other.nationality_id == nationality_id &&
        other.street == street &&
        other.building == building &&
        other.intercom == intercom &&
        other.floor == floor &&
        other.zipcode == zipcode &&
        other.detailed_address == detailed_address &&
        other.password_confirmation == password_confirmation &&
        other.gender == gender &&
        other.image == image &&
        other.timeZone == timeZone;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        mobile.hashCode ^
        birthdate.hashCode ^
        fcmToken.hashCode ^
        lang_id.hashCode ^
        currency_id.hashCode ^
        city_id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        state.hashCode ^
        street.hashCode ^
        nationality_id.hashCode ^
        building.hashCode ^
        intercom.hashCode ^
        floor.hashCode ^
        zipcode.hashCode ^
        detailed_address.hashCode ^
        password_confirmation.hashCode ^
        gender.hashCode ^
        timeZone.hashCode ^
        image.hashCode;
  }
}
