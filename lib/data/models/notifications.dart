// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationsModel {
  bool? success;
  String? status;
  String? message;
  List<NotificationsData>? notificationsData;

  NotificationsModel({this.success, this.status, this.message, this.notificationsData});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      notificationsData = <NotificationsData>[];
      json['data'].forEach((v) {
        notificationsData!.add(NotificationsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (notificationsData != null) {
      data['data'] = notificationsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  NotificationsModel copyWith({
    bool? success,
    String? status,
    String? message,
    List<NotificationsData>? notificationsData,
  }) {
    return NotificationsModel(
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
      notificationsData: notificationsData ?? this.notificationsData,
    );
  }
}

class NotificationsData {
  int? id;
  Title? title;
  Title? body;
  String? image;
  bool? isRead;
  String? createdAt;

  NotificationsData({this.id, this.title, this.body, this.image, this.isRead,this.createdAt});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    body = json['body'] != null ? Title.fromJson(json['body']) : null;
    image = json['image'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    data['image'] = image;
    data['is_read'] = isRead;
    data['created_at'] = createdAt;

    return data;
  }

  NotificationsData copyWith({
    int? id,
    Title? title,
    Title? body,
    String? image,
    bool? isRead,
    String? createdAt,
  }) {
    return NotificationsData(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class Title {
  String? key;
  String? value;

  Title({this.key, this.value});

  Title.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }

  Title copyWith({
    String? key,
    String? value,
  }) {
    return Title(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }
}
