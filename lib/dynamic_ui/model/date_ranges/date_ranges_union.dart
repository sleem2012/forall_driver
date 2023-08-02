import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_ranges_union.freezed.dart';

@freezed
class DynamicDateRanges with _$DynamicDateRanges {
  const factory DynamicDateRanges.present() = DynamicFormatsPresent;
  const factory DynamicDateRanges.past() = DynamicFormatsPast;
  const factory DynamicDateRanges.plus18() = DynamicFormatsPlus18;
  const factory DynamicDateRanges.plus21() = DynamicFormatsPlus21;
  const factory DynamicDateRanges.non() = DynamicFormatsPlusNon;

  static DynamicDateRanges fromString(String? type) {
    switch (type) {
      case 'present':
        return const DynamicDateRanges.present();
      case 'past':
        return const DynamicDateRanges.past();
      case 'plus18':
        return const DynamicDateRanges.plus18();
      case 'plus21':
        return const DynamicDateRanges.plus21();
      default:
        return const DynamicDateRanges.non();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs