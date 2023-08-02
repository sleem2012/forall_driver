import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../extensions.dart';
import '../../../packages/multi_select_dialog/index.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../model/dynamic_ui_model.dart';

class DynamicCheckBox extends StatelessWidget {
  const DynamicCheckBox({Key? key, required this.field, required this.onChanged, this.error}) : super(key: key);
  final Function(List<DUICollectionModel>) onChanged;
  final DUIFieldModel field;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return MultiSelector.multi<DUICollectionModel>(
      items: field.collection
          .map(
            (e) => KHelper.of(context).itemView<DUICollectionModel>(
              itemText: e.placeholder ?? '',
              value: e,
              icon: e.icon != null ? SvgPicture.network(e.icon.toString(), width: 25, height: 25) : null,
            ),
          )
          .toList(),
      onChanged: onChanged,
      type: SelectorViewType.sheet,
      title: field.placeholder.capitalized,
      error: error?.capitalized,
      btnDecoration: KHelper.of(context).filled,
      popupDecoration: KHelper.of(context).elevatedBox,
      validator: (p0) {
        if ((p0 == null || p0.isEmpty) && field.isRequired) {
          return Tr.get.field_required;
        } else {
          return null;
        }
      },
    );
  }
}
