import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../extensions.dart';
import '../../../packages/multi_select_dialog/index.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../model/dynamic_ui_model.dart';

class DynamicDropDown extends StatelessWidget {
  const DynamicDropDown({Key? key, required this.onChanged, required this.field, this.value, this.error}) : super(key: key);
  final Function(DUICollectionModel?) onChanged;
  final DUIFieldModel field;
  final DUICollectionModel? value;
  final String? error;
  @override
  Widget build(BuildContext context) {
    final items = field.collection
        .map((v) => KHelper.of(context).itemView<DUICollectionModel>(
              value: v,
              itemText: v.placeholder ?? '',
              icon: v.icon != null ? SvgPicture.network(v.icon.toString(), width: 25, height: 25) : null,
            ))
        .toList();

    return MultiSelector.single<DUICollectionModel>(
      title: field.placeholder.capitalized,
      items: items,
      value: value,
      error: error?.capitalized,
      type: SelectorViewType.sheet,
      btnDecoration: KHelper.of(context).filled,
      popupDecoration: KHelper.of(context).elevatedBox,
      onChanged: onChanged,
      validator: (p0) {
        if (p0 == null && field.isRequired) {
          return Tr.get.field_required;
        } else {
          return null;
        }
      },
    );
  }
}
