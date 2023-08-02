import 'package:freezed_annotation/freezed_annotation.dart';
part 'conditions_union.freezed.dart';

@freezed
class DynamicConditions with _$DynamicConditions {
  const factory DynamicConditions.equal() = DynamicConditionsEqual;
  const factory DynamicConditions.notEqual() = DynamicConditionsNotEqual;
  const factory DynamicConditions.lower() = DynamicConditionsLower;
  const factory DynamicConditions.greater() = DynamicConditionsGreater;
  const factory DynamicConditions.greater_equal() = DynamicConditionsGreaterEqual;
  const factory DynamicConditions.lower_equal() = DynamicConditionsLowerEqual;
  const factory DynamicConditions.start_with() = DynamicConditionsStartWith;
  const factory DynamicConditions.alike() = DynamicConditionsALike;
  const factory DynamicConditions.non() = DynamicConditionsNoN;

  ///static List<String> list = ['equal', 'notequal', 'greater', 'lower', 'greater_equal', 'lower_equal', 'start_with', 'alike'];

  static DynamicConditions fromStr(String act) {
    switch (act) {
      case 'equal':
        return const DynamicConditions.equal();
      case 'notequal':
        return const DynamicConditions.notEqual();
      case 'greater':
        return const DynamicConditions.greater();
      case 'lower':
        return const DynamicConditions.lower();
      case 'greater_equal':
        return const DynamicConditions.greater_equal();
      case 'lower_equal':
        return const DynamicConditions.lower_equal();
      case 'start_with':
        return const DynamicConditions.start_with();
      case 'alike':
        return const DynamicConditions.alike();
      default:
        return const DynamicConditions.non();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs