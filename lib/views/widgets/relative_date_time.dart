import 'package:flutter/material.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';

class RelativeDateTimeWidget extends StatelessWidget {
  const RelativeDateTimeWidget({Key? key, required this.dateTime, this.textStyle, this.other}) : super(key: key);

  final DateTime dateTime;
  final DateTime? other;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    final RelativeDateFormat relativeDateFormatter = RelativeDateFormat(Localizations.localeOf(context));
    RelativeDateTime relativeDateTime = RelativeDateTime(dateTime: other ?? DateTime.now(), other: dateTime);

    return Text(relativeDateFormatter.format(relativeDateTime), style: textStyle);
  }
}
