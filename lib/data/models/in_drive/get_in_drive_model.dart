// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'create_trip_model.dart';

class GetInDriveModel {
  bool? success;
  String? status;
  String? message;
  List<TripModelData>? data;

  GetInDriveModel({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  GetInDriveModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TripModelData>[];
      json['data'].forEach((v) {
        data!.add(TripModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;

    return data;
  }

  GetInDriveModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<TripModelData>? data,
  }) {
    return GetInDriveModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(covariant GetInDriveModel other) {
    if (identical(this, other)) return true;

    return other.success == success && other.status == status && other.message == message && listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return success.hashCode ^ status.hashCode ^ message.hashCode ^ data.hashCode;
  }
}
