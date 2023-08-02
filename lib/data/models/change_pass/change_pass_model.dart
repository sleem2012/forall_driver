// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChangePasswordModel {
  String? currentPass;
  String? newPass;
  String? confirmNewPass;
  ChangePasswordModel({
    this.currentPass,
    this.newPass,
    this.confirmNewPass,
  });

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    currentPass = json['current_password'];
    newPass = json['password'];
    confirmNewPass = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_password'] = currentPass;
    data['password'] = newPass;
    data['password_confirmation'] = confirmNewPass;

    return data;
  }

  ChangePasswordModel copyWith({
    String? currentPass,
    String? newPass,
    String? confirmNewPass,
  }) {
    return ChangePasswordModel(
      currentPass: currentPass ?? this.currentPass,
      newPass: newPass ?? this.newPass,
      confirmNewPass: confirmNewPass ?? this.confirmNewPass,
    );
  }

  @override
  bool operator ==(covariant ChangePasswordModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.currentPass == currentPass &&
      other.newPass == newPass &&
      other.confirmNewPass == confirmNewPass;
  }

  @override
  int get hashCode => currentPass.hashCode ^ newPass.hashCode ^ confirmNewPass.hashCode;
}
