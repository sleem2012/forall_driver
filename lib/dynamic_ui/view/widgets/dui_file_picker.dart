import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../model/dynamic_ui_model.dart';
import '../../../extensions.dart';
import 'sub_widgets/plus_btn.dart';

class DynamicFilePicker extends StatelessWidget {
  const DynamicFilePicker({super.key, required this.field, required this.onChanged});
  final DUIFieldModel field;
  final dynamic Function(File?, DUICollectionModel collection) onChanged;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const KDivider(),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(field.placeholder.capitalized, style: KTextStyle.of(context).title2),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: field.collection
              .map(
                (collection) => LayoutBuilder(builder: (context, si) {
                  debugPrint('================= ${si.maxWidth}   ,${si.maxHeight}   , $width');
                  return SizedBox(
                    width: (si.maxWidth / 2) - 3,
                    child: FilePickerWidget(
                      collection: collection,
                      onSelect: (file) => onChanged(file, collection),
                      validator: (p0) {
                        if (p0 == null && (field.isRequired || collection.isRequired)) {
                          return Tr.get.field_required;
                        }
                        return null;
                      },
                    ),
                  );
                }),
              )
              .toList(),
        ),
        const SizedBox(height: 4),
        const KDivider(),
      ],
    );
  }
}

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({Key? key, required this.collection, this.validator, required this.onSelect}) : super(key: key);

  final DUICollectionModel collection;
  final String? Function(File?)? validator;
  final void Function(File?) onSelect;
  @override
  State<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  File? _file;

  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf', 'doc'],
    );
    if (result != null) {
      for (var f in result.files) {
        _file = File(f.path ?? "");
      }
      widget.onSelect(_file);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: FormField<File?>(
        validator: widget.validator,
        builder: (formState) {
          return Container(
            decoration: formState.hasError ? KHelper.of(context).errorBorder : KHelper.of(context).filled,
            child: RawMaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              onPressed: () async {
                await pickFile();
                formState
                  ..didChange(_file)
                  ..validate();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 5),
                  const Icon(Icons.upload_file_rounded, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      (_file?.path.split('/').last ?? widget.collection.placeholder?.capitalized ?? ""),
                      style: (_file?.path != null ? KTextStyle.of(context).title3 : KTextStyle.of(context).hint).copyWith(fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
