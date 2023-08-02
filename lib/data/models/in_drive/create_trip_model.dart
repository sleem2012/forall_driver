import 'package:flutter/foundation.dart';
import 'package:forall_driver/data/models/user_info/user_model.dart';


class TripModel {
  bool? success;
  String? status;
  String? message;
  TripModelData? data;

  TripModel({this.success, this.status, this.message, this.data});

  TripModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? TripModelData.fromJson(json['data']) : null;
  }

  TripModel copyWith({
    bool? success,
    String? status,
    String? message,
    TripModelData? data,
  }) {
    return TripModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.status == status &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode =>
      success.hashCode ^ status.hashCode ^ data.hashCode ^ message.hashCode;
}

class TripModelData {
  int? id;
  UserModelData? userId;
  UserModelData? driverId;
  String? fare;
  String? min;
  String? cost;
  String? state;
  String? type;
  String? userRate;
  String? driverRate;
  int? isVisible;
  List<TripRoads>? tripRoads;
  String? createdAt;

  TripModelData({
    this.id,
    this.userId,
    this.driverId,
    this.fare,
    this.min,
    this.cost,
    this.state,
    this.type,
    this.userRate,
    this.driverRate,
    this.isVisible,
    this.tripRoads,
    this.createdAt,
  });

  TripModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'] != null
        ? UserModelData.fromJson(json['user_id'])
        : null;
    driverId = json['driver_id'] != null
        ? UserModelData.fromJson(json['driver_id'])
        : null;
    fare = json['fare'];
    min = json['min'];
    cost = json['cost'];
    state = json['state'];
    type = json['type'];
    userRate = json['user_rate'];
    driverRate = json['driver_rate'];
    isVisible = json['is_visible'];
    if (json['trip_roads'] != null) {
      tripRoads = <TripRoads>[];
      json['trip_roads'].forEach((v) {
        tripRoads!.add(TripRoads.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  TripModelData copyWith({
    int? id,
    UserModelData? userId,
    UserModelData? driverId,
    String? fare,
    String? min,
    String? cost,
    String? state,
    String? type,
    String? userRate,
    String? driverRate,
    int? isVisible,
    List<TripRoads>? tripRoads,
    String? createdAt,
  }) {
    return TripModelData(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      driverId: driverId ?? this.driverId,
      fare: fare ?? this.fare,
      min: min ?? this.min,
      cost: cost ?? this.cost,
      state: state ?? this.state,
      type: type ?? this.type,
      userRate: userRate ?? this.userRate,
      driverRate: driverRate ?? this.driverRate,
      isVisible: isVisible ?? this.isVisible,
      tripRoads: tripRoads ?? this.tripRoads,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(covariant TripModelData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.driverId == driverId &&
        other.fare == fare &&
        other.min == min &&
        other.cost == cost &&
        other.state == state &&
        other.type == type &&
        other.userRate == userRate &&
        other.driverRate == driverRate &&
        other.isVisible == isVisible &&
        listEquals(other.tripRoads, tripRoads) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    userId.hashCode ^
    driverId.hashCode ^
    fare.hashCode ^
    min.hashCode ^
    cost.hashCode ^
    state.hashCode ^
    type.hashCode ^
    userRate.hashCode ^
    driverRate.hashCode ^
    isVisible.hashCode ^
    tripRoads.hashCode ^
    createdAt.hashCode;
  }
}

class TripRoads {
  String? latitude;
  String? longitude;
  String? name;
  String? position;

  TripRoads({this.latitude, this.longitude, this.name, this.position});

  TripRoads.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    position = json['position'];
  }

  TripRoads copyWith({
    String? latitude,
    String? longitude,
    String? name,
    String? position,
  }) {
    return TripRoads(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      position: position ?? this.position,
    );
  }

  @override
  bool operator ==(covariant TripRoads other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.name == name &&
        other.position == position;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
    longitude.hashCode ^
    name.hashCode ^
    position.hashCode;
  }
}
