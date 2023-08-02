import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

enum KDateTimePickerType { dateHijri, dateGregorian, dateTimeHijri, dateTimeGregorian, time }

final TextEditingController dateController = TextEditingController();

class SfDatePicker extends StatelessWidget {
  static Future<String?> showDateTimePickerHG(
    BuildContext context, {
    required KDateTimePickerType type,
    required DateTime initial,
    required DateTime start,
    required DateTime end,
  }) async {
    if (type == KDateTimePickerType.time) {
      final localizations = MaterialLocalizations.of(context);
      final time = await _timePicker(context);
      if (time != null) {
        final formattedTimeOfDay = localizations.formatTimeOfDay(time);
        return formattedTimeOfDay.toString();
      }
    } else {
      final date = await Get.dialog<String>(
        SfDatePicker(
          hijri: type == KDateTimePickerType.dateHijri || type == KDateTimePickerType.dateTimeHijri,
          type: type,
          hasTime: type == KDateTimePickerType.dateTimeGregorian || type == KDateTimePickerType.dateTimeHijri,
          initial: initial,
          start: start,
          end: end,
        ),
      );
      return date;
    }
    return null;
  }

  const SfDatePicker({
    Key? key,
    required this.hijri,
    required this.hasTime,
    required this.initial,
    required this.start,
    required this.end,
    required this.type,
  }) : super(key: key);

  final bool hijri;
  final bool hasTime;
  final KDateTimePickerType type;
  final DateTime initial, start, end;

  static Future<TimeOfDay?> _timePicker(context) async {
    TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    return pickedTime;
  }

  onSubmit(BuildContext context, value) async {
    String? formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.tryParse(value.toString()) ?? initial);
    dateController.text = formattedDate;
    final nav = Navigator.of(context);
    if (hasTime) {
      final localizations = MaterialLocalizations.of(context);
      final pickedTime = await _timePicker(context);
      if (pickedTime != null) {
        final formattedTimeOfDay = localizations.formatTimeOfDay(pickedTime);
        dateController.text = '$formattedDate - $formattedTimeOfDay ';
      }
      nav.pop<String>(dateController.text);
    } else {
      nav.pop<String>(dateController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        height: height * .6,
        margin: const EdgeInsets.all(12),
        decoration: KHelper.of(context).elevatedBox,
        child: hijri
            ? SfHijriDateRangePicker(
                minDate: HijriDateTime.fromDateTime(start),
                initialSelectedDate: HijriDateTime.fromDateTime(initial),
                maxDate: HijriDateTime.fromDateTime(end),
                selectionMode: DateRangePickerSelectionMode.single,
                showActionButtons: true,
                onCancel: () => Navigator.of(context).pop(),
                onSubmit: (p0) => onSubmit(context, p0),
              )
            : SfDateRangePicker(
                minDate: start,
                initialSelectedDate: initial,
                maxDate: end,
                selectionMode: DateRangePickerSelectionMode.single,
                showActionButtons: true,
                onCancel: () => Navigator.of(context).pop(),
                onSubmit: (p0) => onSubmit(context, p0),
              ),
      ),
    );
  }
}
