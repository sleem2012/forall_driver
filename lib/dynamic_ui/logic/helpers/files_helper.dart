import 'dart:io';

import '../../model/dynamic_ui_model.dart';

abstract class DUIFilesFHelper {
  static final Map<String, List<File>?> galleryMap = {};
  static selectGallery({required List<File> gallery, required DUIFieldModel field}) => galleryMap.addAll({field.id: gallery});

  static final Map<String, Map<String, File?>?> filesMap = {};
  static filesMapsMode({required String colKey, required String fid, required File? file}) {
    if (file != null) {
      filesMap.update(
        fid,
        (value) {
          if (value != null) {
            return value..update(colKey, (value) => file, ifAbsent: () => file);
          } else {
            return {colKey: file};
          }
        },
        ifAbsent: () => {colKey: file},
      );
    }
  }
}
