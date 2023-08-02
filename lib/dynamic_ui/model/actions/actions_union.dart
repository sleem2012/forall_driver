import 'package:freezed_annotation/freezed_annotation.dart';
part 'actions_union.freezed.dart';

@freezed
class DynamicActions with _$DynamicActions {
  const factory DynamicActions.visible() = DynamicActionsVisible;
  const factory DynamicActions.invisible() = DynamicActionsNotVisible;
  const factory DynamicActions.filter() = DynamicActionsFilter;
  const factory DynamicActions.non() = DynamicActionsNoN;
  static List<String> list = ['visible', 'invisible', 'filter'];

  static DynamicActions fromStr(String act) {
    switch (act) {
      case 'visible':
        return const DynamicActions.visible();
      case 'invisible':
        return const DynamicActions.invisible();
      case 'filter':
        return const DynamicActions.filter();
      default:
        return const DynamicActions.non();
    }
  }
}
// flutter pub run build_runner watch --delete-conflicting-outputs