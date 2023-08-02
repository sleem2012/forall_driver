import 'package:freezed_annotation/freezed_annotation.dart';
part 'keyboard_union.freezed.dart';

@freezed
class DynamicKeyboardUnion with _$DynamicKeyboardUnion {
  const factory DynamicKeyboardUnion.name() = DynamicKeyboardUnionName;
  const factory DynamicKeyboardUnion.email() = DynamicKeyboardUnionEmail;
  const factory DynamicKeyboardUnion.phone() = DynamicKeyboardUnionPhone;
  const factory DynamicKeyboardUnion.password() = DynamicKeyboardUnionPassword;
  const factory DynamicKeyboardUnion.number() = DynamicKeyboardUnionNumber;
  const factory DynamicKeyboardUnion.integer() = DynamicKeyboardUnionInteger;
  const factory DynamicKeyboardUnion.money() = DynamicKeyboardUnionMoney;
  const factory DynamicKeyboardUnion.quantity() = DynamicKeyboardUnionQuantity;
  const factory DynamicKeyboardUnion.dateTime() = DynamicKeyboardUnionDateTime;
  const factory DynamicKeyboardUnion.time() = DynamicKeyboardUnionTime;
  const factory DynamicKeyboardUnion.date() = DynamicKeyboardUnionDate;
  const factory DynamicKeyboardUnion.avatar() = DynamicKeyboardUnionAvatar;
  const factory DynamicKeyboardUnion.file() = DynamicKeyboardUnionFile;
  const factory DynamicKeyboardUnion.string() = DynamicKeyboardUnionString;
  const factory DynamicKeyboardUnion.volume() = DynamicKeyboardUnionVolume;
  const factory DynamicKeyboardUnion.duration() = DynamicKeyboardUnionDuration;
  const factory DynamicKeyboardUnion.weight() = DynamicKeyboardUnionWeight;
  const factory DynamicKeyboardUnion.length() = DynamicKeyboardUnionLength;

  static DynamicKeyboardUnion fromString(String? type) {
    switch (type) {
      case 'weight':
        return const DynamicKeyboardUnion.weight();
      case 'length':
        return const DynamicKeyboardUnion.length();
      case 'duration':
        return const DynamicKeyboardUnion.duration();
      case 'volume':
        return const DynamicKeyboardUnion.volume();
      case 'name':
        return const DynamicKeyboardUnion.name();
      case 'email':
        return const DynamicKeyboardUnion.email();
      case 'phone':
        return const DynamicKeyboardUnion.phone();
      case 'password':
        return const DynamicKeyboardUnion.password();
      case 'number':
        return const DynamicKeyboardUnion.number();
      case 'integer':
        return const DynamicKeyboardUnion.integer();
      case 'money':
        return const DynamicKeyboardUnion.money();
      case 'quantity':
        return const DynamicKeyboardUnion.quantity();
      case 'datetime':
        return const DynamicKeyboardUnion.dateTime();
      case 'time':
        return const DynamicKeyboardUnion.time();
      case 'date':
        return const DynamicKeyboardUnion.date();
      case 'string':
        return const DynamicKeyboardUnion.string();
      case 'avatar':
        return const DynamicKeyboardUnion.avatar();
      case 'file':
        return const DynamicKeyboardUnion.file();
      default:
        return const DynamicKeyboardUnion.string();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs