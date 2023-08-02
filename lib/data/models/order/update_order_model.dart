class UpdateOrderModel {
  int? shippingId;
  int? rider;
  String? state;
  String? canceledReason;
  String? qrClient;
  String? qrVendor;
  String? paymentValue;

  UpdateOrderModel({
    this.shippingId,
    this.rider,
    this.state,
    this.canceledReason,
    this.qrClient,
    this.qrVendor,
    this.paymentValue
  });

  UpdateOrderModel.fromJson(Map<String, dynamic> json) {
    shippingId = json['shipping_id'];
    rider = json['rider'];
    state = json['state'];
    canceledReason = json['canceled_reason'];
    qrClient = json['qr_client'];
    qrVendor = json['qr_vendor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = shippingId;
    data['rider'] = rider;
    if (state != null) data['state'] = state;
    if (canceledReason != null) data['canceled_reason'] = canceledReason;
    if (qrClient != null) data['qr_client'] = qrClient;
    if (qrVendor != null) data['qr_vendor'] = qrVendor;
    if (paymentValue != null) data['payment_values'] = paymentValue;
    return data;
  }

  UpdateOrderModel copyWith({
    int? shippingId,
    int? rider,
    String? state,
    String? canceledReason,
    String? qrClient,
    String? qrVendor,
    String? paymentValue
  }) {
    return UpdateOrderModel(
      shippingId: shippingId ?? this.shippingId,
      rider: rider ?? this.rider,
      state: state ?? this.state,
      canceledReason: canceledReason ?? this.canceledReason,
      qrClient: qrClient ?? this.qrClient,
      qrVendor: qrVendor ?? this.qrVendor,
      paymentValue: paymentValue ?? this.paymentValue,
    );
  }
}
