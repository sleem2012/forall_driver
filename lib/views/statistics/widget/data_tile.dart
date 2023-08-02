import 'package:flutter/material.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/theme/text_theme.dart';

class DataTile extends StatelessWidget {
  const DataTile({Key? key, required this.title, required this.Data}) : super(key: key);
  final String title;
  final String Data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      color: KColors.of(context).fillContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: KTextStyle.of(context).body,
          ),
          Text(Data, style: KTextStyle.of(context).body),
        ],
      ),
    );
  }
}
