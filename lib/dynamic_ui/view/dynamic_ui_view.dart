import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../packages/shared/error/failures.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/logger.dart';
import '../../shared/theme/text_theme.dart';
import '../../views/widgets/custom_button.dart';
import '../logic/bloc/dynamic_ui_bloc.dart';
import '../logic/bloc/dynamic_ui_states.dart';
import '../model/fields_union/fields_union.dart';
import '../model/dynamic_ui_model.dart';
import 'dynamic_helper/dynamic_helper.dart';
import 'widgets/dui_checkbox.dart';
import 'widgets/dui_date_time_picker.dart';
import 'widgets/dui_drop_down.dart';
import 'widgets/dui_file_picker.dart';
import 'widgets/dui_gallary.dart';
import 'widgets/dui_image_picker.dart';
import 'widgets/dui_labels.dart';
import 'widgets/dui_notifications.dart';
import 'widgets/dui_radio_btn.dart';
import 'widgets/dui_text_field.dart';
import 'widgets/sub_widgets/dui_loading.dart';
import 'widgets/sub_widgets/plus_btn.dart';

class DynamicUi extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<DUIFieldModel> fields;
  final List<Widget>? additionalFields;
  final bool? additionalFieldsInTop;
  final String? submitTitle, title;
  final Function(Map<String, dynamic> values, Map<String, dynamic> answer_col, Map<String, dynamic> grouped_a_col) onConfirm;
  final EdgeInsetsGeometry? padding;
  final KFailure? failure;

  const DynamicUi({
    super.key,
    required this.fields,
    required this.onConfirm,
    this.additionalFields,
    this.padding,
    this.failure,
    this.submitTitle,
    this.title,
    this.additionalFieldsInTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DynamicUiBloc(fields: fields),
      child: BlocBuilder<DynamicUiBloc, DynamicUiState>(
        buildWhen: (previous, current) => (current.id == "all"),
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(title!, style: KTextStyle.of(context).title),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (additionalFieldsInTop!) ...?additionalFields,
                          ...DynamicUiBloc.of(context).fields.map((f) {
                            return BlocBuilder<DynamicUiBloc, DynamicUiState>(
                              buildWhen: (previous, current) {
                                return (current.id == f.id || f.subFields.where((element) => element.id == current.id).isNotEmpty);
                              },
                              builder: (context, state) {
                                final field = DynamicUiBloc.of(context).fieldRef(f.id);
                                return DUIField(failure: failure, field: field);
                              },
                            );
                          }).toList(),
                          if (!additionalFieldsInTop!) ...?additionalFields,
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: KButton(
                    title: submitTitle ?? Tr.get.submit,
                    onPressed: () {
                      printMap(DynamicUiBloc.of(context).values);
                      printMap(DynamicUiBloc.of(context).answer_collection);
                      printMap(DynamicUiBloc.of(context).grouped_answer_collection);

                      if (_formKey.currentState!.validate()) {
                        onConfirm(
                          DynamicUiBloc.of(context).values,
                          DynamicUiBloc.of(context).answer_collection,
                          DynamicUiBloc.of(context).grouped_answer_collection,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DUIField extends StatelessWidget {
  const DUIField({Key? key, this.failure, required this.field}) : super(key: key);
  final DUIFieldModel field;
  final KFailure? failure;

  @override
  Widget build(BuildContext context) {
    final bloc = DynamicUiBloc.of(context);
    final textMap = bloc.getTextMap(field.id);
    final dateMap = bloc.getDateMap(field.id);
    final getFilteredText = bloc.getFilteredText(field.id);
    return Visibility(
      visible: field.isVisible,
      child: DUILoadingWrapper(
        isLoading: bloc.isLoading(field.id),
        destroy: field.type is DUIFieldsTypeDropDownButton,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: field.isSub ? 0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (textMap.entries.isNotEmpty) DUIChip(map: textMap, onDeleted: (key) => bloc.removeExtraText(field.id, key)),
              if (dateMap.entries.isNotEmpty) DUIChip(map: dateMap, onDeleted: (key) => bloc.removeExtraDate(field.id, key)),
              if (getFilteredText != null) DUIChip(map: {"": getFilteredText}),
              field.type.when(
                textField: () {
                  return DynamicTextField(
                    field: field,
                    skipValidation: textMap.entries.isEmpty,
                    error: DynamicUiVM.error422Text(field.key, failure),
                    onAdd: (p0) => bloc.addExtraText(field.id, p0),
                    onChanged: (p0) => bloc.addText(field.id, p0),
                    onFilter: field.conditions.isNotEmpty ? (p0) => bloc.triggerFilterOnTextField(field, p0) : null,
                  );
                },
                measured: () {
                  return DynamicTextField(
                    field: field,
                    skipValidation: textMap.entries.isEmpty,
                    error: DynamicUiVM.error422Text(field.key, failure),
                    onChanged: (p0) => bloc.addText(field.id, p0),
                  );
                },
                dropDownButton: () {
                  return DynamicDropDown(
                    field: field,
                    value: bloc.getDropDownValue(field),
                    error: DynamicUiVM.error422Text(field.key, failure),
                    onChanged: (p0) => bloc.addDropDownValue(field, p0!),
                  );
                },
                checkbox: () {
                  return DynamicCheckBox(
                    field: field,
                    error: DynamicUiVM.error422Text(field.key, failure),
                    onChanged: (p0) => bloc.addCheckBoxValues(field, p0),
                  );
                },
                dateTimePiker: () {
                  return DynamicDateTimePicker(
                    field: field,
                    onChanged: (p0) => bloc.addDate(field, p0),
                    error: DynamicUiVM.error422Text(field.key, failure),
                    skipValidation: dateMap.entries.isEmpty,
                    onAdd: (p0) => bloc.addExtraDate(field, p0),
                  );
                },
                radioButton: () {
                  return DynamicRadioButton(
                    field: field,
                    value: bloc.getRadio(field),
                    onChanged: (p0) => bloc.addRadio(field, p0),
                  );
                },
                imageInput: () {
                  return DynamicImagePicker(
                    field: field,
                    onChanged: (file, collection) => bloc.selectFile(colKey: collection.key ?? '', file: file, field: field),
                  );
                },
                fileInput: () {
                  return DynamicFilePicker(
                    field: field,
                    onChanged: (file, collection) {
                      bloc.selectFile(colKey: collection.key ?? '', file: file, field: field);
                    },
                  );
                },
                notifications: () {
                  return DynamicNotification(
                    field: field,
                    failure: failure,
                    onConfirm: (p0) => bloc.addExtraNotification(field.id, p0),
                  );
                },
                gallery: () {
                  return DynamicGallery(
                    field: field,
                    onSelect: (gallery) => bloc.selectGallery(field: field, gallery: gallery),
                  );
                },
                tree: () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const KDivider(),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(field.placeholder, style: KTextStyle.of(context).title2),
                      ),
                      const SizedBox(height: 5),
                      ...field.subFields.map((f) => DUIField(field: f, failure: failure)).toList(),
                      const KDivider(),
                    ],
                  );
                },
                label: () => DynamicLabels(placeHolder: bloc.getPlaceholder(field)),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
