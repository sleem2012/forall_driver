// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../views/widgets/date_picker.dart';
import 'dynamic_ui_model.dart';
import 'measurement/measurements.dart';

class AllowedInputs {
  TextInputType inputType;
  List<TextInputFormatter> formatter;
  bool obscure;
  bool isAvatar;
  bool isPhone;
  KDateTimePickerType dateTimePickerType;
  FieldFormatModel? fieldFormatModel;
  List<MeasurementsConversion>? measurementsConversion;

  AllowedInputs({
    required this.inputType,
    required this.formatter,
    required this.fieldFormatModel,
    this.obscure = false,
    this.isPhone = false,
    this.isAvatar = false,
    this.dateTimePickerType = KDateTimePickerType.dateGregorian,
    this.measurementsConversion,
  });
  @override
  bool operator ==(covariant AllowedInputs other) {
    if (identical(this, other)) return true;
    return other.inputType == inputType && listEquals(other.formatter, formatter);
  }

  @override
  int get hashCode => inputType.hashCode ^ formatter.hashCode;

  AllowedInputs copyWith({
    TextInputType? inputType,
    List<TextInputFormatter>? formatter,
    bool? obscure,
    bool? isAvatar,
    bool? isPhone,
    KDateTimePickerType? dateTimePickerType,
    FieldFormatModel? fieldFormatModel,
    List<MeasurementsConversion>? measurementsConversion,
  }) {
    return AllowedInputs(
      inputType: inputType ?? this.inputType,
      formatter: formatter ?? this.formatter,
      obscure: obscure ?? this.obscure,
      isAvatar: isAvatar ?? this.isAvatar,
      isPhone: isPhone ?? this.isPhone,
      dateTimePickerType: dateTimePickerType ?? this.dateTimePickerType,
      fieldFormatModel: fieldFormatModel ?? this.fieldFormatModel,
      measurementsConversion: measurementsConversion ?? this.measurementsConversion,
    );
  }
}
