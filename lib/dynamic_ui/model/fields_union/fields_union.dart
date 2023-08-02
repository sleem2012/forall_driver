import 'package:freezed_annotation/freezed_annotation.dart';
part 'fields_union.freezed.dart';

@freezed
class DUIFieldsType with _$DUIFieldsType {
  const factory DUIFieldsType.textField() = DUIFieldsTypeTextField;
  const factory DUIFieldsType.checkbox() = DUIFieldsTypeCheckbox;
  const factory DUIFieldsType.radioButton() = DUIFieldsTypeRadioButton;
  const factory DUIFieldsType.dropDownButton() = DUIFieldsTypeDropDownButton;
  const factory DUIFieldsType.dateTimePiker() = DUIFieldsTypeDateTimePiker;
  const factory DUIFieldsType.fileInput() = DUIFieldsTypeFileInput;
  const factory DUIFieldsType.imageInput() = DUIFieldsTypeImageInput;
  const factory DUIFieldsType.notifications() = DUIFieldsTypeNotifications;
  const factory DUIFieldsType.tree() = DUIFieldsTypeTree;
  const factory DUIFieldsType.gallery() = DUIFieldsTypeGallery;
  const factory DUIFieldsType.measured() = DUIFieldsTypeMeasured;
  const factory DUIFieldsType.label() = DUIFieldsTypeLabel;

  static const List<String> types = ['TextField', 'Checkbox', 'RadioButton', 'DropDownButton', 'DateTimePiker', 'FileInput', 'ImageInput'];

  static DUIFieldsType fromString(String? type) {
    switch (type) {
      case 'TextField':
        return const DUIFieldsType.textField();
      case 'Checkbox':
        return const DUIFieldsType.checkbox();
      case 'RadioButton':
        return const DUIFieldsType.radioButton();
      case 'DropDownButton':
        return const DUIFieldsType.dropDownButton();
      case 'DateTimePiker':
        return const DUIFieldsType.dateTimePiker();
      case 'FileInput':
        return const DUIFieldsType.fileInput();
      case 'ImageInput':
        return const DUIFieldsType.imageInput();
      case 'Tree':
        return const DUIFieldsType.tree();
      case 'Notifications':
        return const DUIFieldsType.notifications();
      case 'Gallery':
        return const DUIFieldsType.gallery();
      case 'Measured':
        return const DUIFieldsType.measured();
      default:
        return const DUIFieldsType.label();
    }
  }
}

// flutter pub run build_runner watch --delete-conflicting-outputs
