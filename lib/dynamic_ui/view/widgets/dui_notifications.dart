// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/text_theme.dart';
import '../../model/dynamic_ui_model.dart';
import '../../../extensions.dart';
import '../dynamic_helper/dynamic_helper.dart';
import 'dui_date_time_picker.dart';
import 'dui_text_field.dart';
import 'sub_widgets/plus_btn.dart';

class DynamicNotification extends StatefulWidget {
  const DynamicNotification({Key? key, required this.field, this.failure, this.onAdd, required this.onConfirm}) : super(key: key);
  final DUIFieldModel field;
  final KFailure? failure;
  final Function(String)? onAdd;
  final Function(List<NotifyModel>) onConfirm;

  @override
  State<DynamicNotification> createState() => _DynamicNotificationState();
}

class _DynamicNotificationState extends State<DynamicNotification> {
  final List<NotifyModel> list = [];

  NotifyModel model = NotifyModel(title: '', description: '', date: '');

  @override
  Widget build(BuildContext context) {
    return FormField<List<NotifyModel>>(
      validator: (value) {
        if (!list.contains(model) && !model.containsEmpty) {
          list.add(model);
          setState(() {});
        }
        if (list.isEmpty) {
          return Tr.get.field_required;
        }
        widget.onConfirm.call(list);
        return null;
      },
      builder: (formState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                children: [
                  Expanded(child: Text(widget.field.placeholder.capitalized, style: KTextStyle.of(context).title2)),
                  DUIPlusBtn(
                    onPressed: () {
                      if (!list.contains(model) && !model.containsEmpty) {
                        list.add(model);
                        setState(() {});
                        widget.onConfirm.call(list);
                      }
                    },
                  )
                ],
              ),
            ),
            DUIChips(
              list: list,
              onDeleted: (e) {
                list.remove(e);
                setState(() {});
              },
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DynamicTextField(
                    field: NotifyModel.typeTitle,
                    onChanged: (p0) {
                      model = model.copyWith(title: p0);
                    },
                    error: DynamicUiVM.error422Text(widget.field.key, widget.failure),
                    skipValidation: list.isEmpty,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: DynamicDateTimePicker(
                    field: NotifyModel.typeDate,
                    onChanged: (p0) {
                      model = model.copyWith(date: p0);
                    },
                    error: DynamicUiVM.error422Text(widget.field.key, widget.failure),
                    skipValidation: list.isEmpty,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            DynamicTextField(
              field: NotifyModel.typeDescription,
              onChanged: (p0) {
                model = model.copyWith(description: p0);
              },
              error: DynamicUiVM.error422Text(widget.field.key, widget.failure),
              skipValidation: list.isEmpty,
            ),
            if (formState.hasError || widget.failure != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        (formState.errorText ?? KFailure.toError(widget.failure!)).capitalized,
                        style: const TextStyle(color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 4),
            const KDivider(),
          ],
        );
      },
    );
  }
}

class NotifyModel {
  final String title;
  final String description;
  final String date;

  NotifyModel({required this.title, required this.description, required this.date});

  NotifyModel copyWith({
    String? title,
    String? description,
    String? date,
  }) {
    return NotifyModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
    };
  }

  bool get containsEmpty {
    return title == '' || description == '' || date == '';
  }

  factory NotifyModel.fromMap(Map<String, dynamic> map) {
    return NotifyModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
    );
  }

  static DUIFieldModel typeTitle = DUIFieldModel.fromJson(
    {
      "id": 30,
      "key": "title",
      "type": "TextField",
      "keyboard": "string",
      "placeholder": {"key": "placeholder", "value": Tr.get.title},
      "collections": [],
      "format": {"validated": "nullable"},
      "is_required": true,
      "is_visible": true
    },
  );
  static DUIFieldModel typeDescription = DUIFieldModel.fromJson(
    {
      "id": 30,
      "key": "description",
      "type": "TextField",
      "keyboard": "string",
      "placeholder": {"key": "placeholder", "value": Tr.get.description},
      "collections": [],
      "format": {"validated": "nullable"},
      "is_required": true,
      "is_visible": true
    },
  );
  static DUIFieldModel typeDate = DUIFieldModel.fromJson(
    {
      "id": 13,
      "key": "dateOfBirthGregorian",
      "type": "DateTimePiker",
      "keyboard": "datetime",
      "placeholder": {"key": "placeholder", "value": Tr.get.reminder},
      "multi": true,
      "format": {"max": "null", "min": "null", "format": "g", "validated": "required_if:1,NV25GlPuOnQ=|date_format:Y-m-d"},
      "is_required": true,
      "is_visible": true
    },
  );

  @override
  bool operator ==(covariant NotifyModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.description == description && other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ date.hashCode;
}
