import 'package:flutter/material.dart';
import 'package:forall_driver/extensions.dart';


import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../model/labels/label_ph.dart';
import 'sub_widgets/doted_separator.dart';

class DynamicLabels extends StatelessWidget {
  const DynamicLabels({Key? key, required this.placeHolder}) : super(key: key);
  final LabelPLaceHolder placeHolder;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).fillContainer,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(placeHolder.nPlaceHolder.capitalized, style: KTextStyle.of(context).labels),
                ),
              ),
            ],
          ),
          if (placeHolder.table.isNotEmpty) ...[
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = placeHolder.table[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text(item.key, style: KTextStyle.of(context).labels)),
                    Expanded(flex: 2, child: Text(item.value, style: KTextStyle.of(context).labelsB)),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => MySeparator(height: 1, color: KColors.of(context).accentColor),
            itemCount: placeHolder.table.length,
          ),
          ]
        ],
      ),
    );
  }
}
