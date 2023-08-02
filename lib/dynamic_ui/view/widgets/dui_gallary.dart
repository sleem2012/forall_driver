import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../di.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../model/dynamic_ui_model.dart';
import 'sub_widgets/plus_btn.dart';

class DynamicGallery extends StatefulWidget {
  const DynamicGallery({super.key, required this.field, required this.onSelect});
  final DUIFieldModel field;
  final Function(List<File> gallery) onSelect;
  @override
  State<DynamicGallery> createState() => _DynamicGalleryState();
}

class _DynamicGalleryState extends State<DynamicGallery> {
  final List<File> gallery = <File>[];

  Future pickFile(FormFieldState<List<File>> formState) async {
    final pickedFile = await Di.imagePicker.pickImage(source: ImageSource.gallery);
    debugPrint('================= $pickedFile');
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      gallery.add(file);
      widget.onSelect(gallery);
    }
    formState
      ..didChange(gallery)
      ..validate();
    setState(() {});
    debugPrint('=================  : $gallery');
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = BorderRadius.circular(KHelper.cornerRadius);

    return LayoutBuilder(
      builder: (context, si) {
        return FormField<List<File>>(
          validator: (value) {
            if ((value == null || value.isEmpty) && widget.field.isRequired) {
              return Tr.get.field_required;
            }
            return null;
          },
          builder: (formState) {
            return Container(
              decoration:
                  (formState.hasError ? KHelper.of(context).errorBorder : KHelper.of(context).filled).copyWith(borderRadius: BorderRadius.circular(25)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(widget.field.placeholder.capitalize ?? "", style: KTextStyle.of(context).title3),
                      ),
                      if (widget.field.format?.max != gallery.length) DUIPlusBtn(onPressed: () => pickFile(formState), hasError: formState.hasError)
                    ],
                  ),
                  Wrap(
                    children: [
                      ...gallery.map((f) {
                        return Stack(
                          children: [
                            Container(
                              height: si.maxWidth / 4,
                              width: (si.maxWidth / 4) - 5,
                              margin: const EdgeInsets.all(2.5),
                              decoration: KHelper.of(context).filled,
                              child: ClipRRect(borderRadius: borderRadius, child: Image.file(f, fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gallery.remove(f);
                                    widget.onSelect(gallery);
                                    formState
                                      ..didChange(gallery)
                                      ..validate();
                                  });
                                },
                                child: const Icon(Icons.cancel, color: Colors.red, size: 15),
                              ),
                            )
                          ],
                        );
                      }).toList()
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
