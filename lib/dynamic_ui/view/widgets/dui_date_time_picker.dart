import 'package:flutter/material.dart';
import '../../../extensions.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../views/widgets/date_picker.dart';
import '../../../views/widgets/text_field.dart';
import '../../model/dynamic_ui_model.dart';
import '../dynamic_helper/dynamic_helper.dart';
import 'sub_widgets/plus_btn.dart';

class DynamicDateTimePicker extends StatefulWidget {
  const DynamicDateTimePicker({
    Key? key,
    required this.field,
    required this.onChanged,
    this.onAdd,
    this.error,
    required this.skipValidation,
  }) : super(key: key);
  final DUIFieldModel field;
  final Function(String?) onChanged;
  final Function(String?)? onAdd;
  final String? error;
  final bool skipValidation;
  @override
  State<DynamicDateTimePicker> createState() => _DynamicDateTimePickerState();
}

class _DynamicDateTimePickerState extends State<DynamicDateTimePicker> {
  final TextEditingController dateController = TextEditingController();
  List<DateTime> get dateList => DynamicUiVM.dateList(widget.field);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final date = await SfDatePicker.showDateTimePickerHG(
                context,
                type: DynamicUiVM.allowedInput(widget.field).dateTimePickerType,
                start: dateList[0],
                initial: dateList[1],
                end: dateList[2],
              );
              if (date == null) return;
              dateController.text = date;
              widget.onChanged(date);
            },
            child: KTextFormField(
              hintText: widget.field.placeholder.capitalized,
              controller: dateController,
              enabled: false,
              errorText: widget.error,
              style: KTextStyle.of(context).body2,
              validator: (p0) {
                if (((p0 == null || p0.isEmpty) && widget.field.isRequired) && widget.skipValidation) {
                  return Tr.get.field_required;
                }
                return null;
              },
            ),
          ),
        ),
        if (widget.field.multi && widget.onAdd != null) const SizedBox(width: 5),
        if (widget.field.multi && widget.onAdd != null)
          DUIPlusBtn(
            onPressed: () {
              if (dateController.text.isNotEmpty) {
                widget.onAdd?.call(dateController.text);
                dateController.clear();
              }
            },
          )
      ],
    );
  }
}
