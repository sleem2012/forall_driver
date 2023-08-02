
import 'package:forall_driver/data/models/user_info/user_model.dart';

class UpdateDateModel {
  bool? success;
  String? status;
  String? message;
  Data? data;

  UpdateDateModel({this.success, this.status, this.message, this.data});

  UpdateDateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  int? userId;
  String? state;
  Commercial? commercial;

  Data({this.id, this.userId, this.state, this.commercial});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    state = json['state'];
    commercial = json['commercial'] != null
        ? Commercial.fromJson(json['commercial'])
        : null;
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





