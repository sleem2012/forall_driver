class CommissionModel {
  bool? success;
  String? status;
  String? message;
  List<CommissionData>? data;
  GeneralCommission? general;

  CommissionModel({this.success, this.status, this.message, this.data, this.general});

  CommissionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CommissionData>[];
      json['data'].forEach((v) {
        data!.add(CommissionData.fromJson(v));
      });
    }
    general = json['general'] != null ? GeneralCommission.fromJson(json['general']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (general != null) {
      data['general'] = general!.toJson();
    }
    return data;
  }
}

class CommissionData {
  int? id;
  int? userId;
  String? type;
  String? trackId;
  String? currency;
  String? amount;
  String? forallAmount;
  String? state;
  dynamic transactionAt;
  String? transactionDetails;
  String? createdAt;

  CommissionData({
    this.id,
    this.userId,
    this.type,
    this.trackId,
    this.currency,
    this.amount,
    this.forallAmount,
    this.state,
    this.transactionAt,
    this.transactionDetails,
    this.createdAt,
  });

  CommissionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    trackId = json['track_id'];
    currency = json['currency'];
    amount = json['amount'];
    forallAmount = json['forall_amount'];
    state = json['state'];
    transactionAt = json['transaction_at'];
    transactionDetails = json['transaction_details'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['type'] = type;
    data['track_id'] = trackId;
    data['currency'] = currency;
    data['amount'] = amount;
    data['forall_amount'] = forallAmount;
    data['state'] = state;
    data['transaction_at'] = transactionAt;
    data['transaction_details'] = transactionDetails;
    data['created_at'] = createdAt;
    return data;
  }
}

class GeneralCommission {
  Pending? pending;
  Pending? inProgress;
  Pending? completed;
  Pending? canceled;
  Pending? orders;
  List<Map<String, dynamic>>? days;

  GeneralCommission({this.pending, this.inProgress, this.completed, this.canceled, this.orders, this.days});

  GeneralCommission.fromJson(Map<String, dynamic> json) {
    pending = json['pending'] != null ? Pending.fromJson(json['pending']) : null;
    inProgress = json['in_progress'] != null ? Pending.fromJson(json['in_progress']) : null;
    completed = json['completed'] != null ? Pending.fromJson(json['completed']) : null;
    canceled = json['canceled'] != null ? Pending.fromJson(json['canceled']) : null;
    orders = json['orders'] != null ? Pending.fromJson(json['orders']) : null;
    days = <Map<String, dynamic>>[];
    if (json['days'] != null) {
      for (var element in (json['days'] as List)) {
        days?.add(element);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pending != null) {
      data['pending'] = pending!.toJson();
    }
    if (inProgress != null) {
      data['in_progress'] = inProgress!.toJson();
    }
    if (completed != null) {
      data['completed'] = completed!.toJson();
    }
    if (canceled != null) {
      data['canceled'] = canceled!.toJson();
    }
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    return data;
  }
}

class Pending {
  int? count;
  String? amount;

  Pending({this.count, this.amount});

  Pending.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['amount'] = amount;
    return data;
  }
}



class MyBarChartData {
  MyBarChartData(this.slug, this.value);
  final String slug;
  final double value;
}
