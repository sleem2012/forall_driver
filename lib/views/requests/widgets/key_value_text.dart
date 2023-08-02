import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';

class KeyValueText extends StatelessWidget {
  final String title, value;
  const KeyValueText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            title,
            style: KTextStyle.of(context).tileProps.copyWith(
              fontSize: 8
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: KTextStyle.of(context).tilePropsValues,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
