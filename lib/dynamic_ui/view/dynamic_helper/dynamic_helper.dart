import 'package:flutter/services.dart';
import '../../../packages/shared/error/error_422_model.dart';
import '../../../views/widgets/date_picker.dart';
import '../../model/allowed_inputs.dart';
import '../../model/date_ranges/date_ranges_union.dart';
import '../../model/dynamic_ui_model.dart';
import '../../model/measurement/measurements.dart';

class DynamicUiVM {
  DynamicUiVM._();
  static AllowedInputs allowedInput(DUIFieldModel field) {
    return field.keyboard.when(
      integer: () => AllowedInputs(
        inputType: TextInputType.number,
        fieldFormatModel: field.format,
        formatter: [FilteringTextInputFormatter.allow(RegExp("^-?\\d*"))],
      ),
      name: () => AllowedInputs(
        inputType: TextInputType.name,
        fieldFormatModel: field.format,
        formatter: [FilteringTextInputFormatter.deny(RegExp(r'[0-9_\-=@,\.;]+$'))],
      ),
      phone: () => AllowedInputs(
        isPhone: true,
        inputType: const TextInputType.numberWithOptions(decimal: false, signed: false),
        fieldFormatModel: field.format,
        formatter: [FilteringTextInputFormatter.digitsOnly],
      ),
      money: () => doubleInputs(field),
      quantity: () => AllowedInputs(
        inputType: TextInputType.number,
        fieldFormatModel: field.format,
        formatter: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
          FilteringTextInputFormatter.deny(RegExp(r'^0+')),
        ],
      ),
      password: () => AllowedInputs(inputType: TextInputType.visiblePassword, obscure: true, fieldFormatModel: field.format, formatter: []),
      number: () => AllowedInputs(inputType: TextInputType.number, fieldFormatModel: field.format, formatter: []),
      email: () => AllowedInputs(inputType: TextInputType.emailAddress, fieldFormatModel: field.format, formatter: []),
      dateTime: () => AllowedInputs(
        inputType: TextInputType.name,
        dateTimePickerType: field.format?.format.toString() == 'h' ? KDateTimePickerType.dateTimeHijri : KDateTimePickerType.dateTimeGregorian,
        fieldFormatModel: field.format,
        formatter: [],
      ),
      time: () =>
          AllowedInputs(inputType: TextInputType.name, dateTimePickerType: KDateTimePickerType.time, fieldFormatModel: field.format, formatter: []),
      date: () => AllowedInputs(
        inputType: TextInputType.name,
        dateTimePickerType: field.format?.format.toString() == 'h' ? KDateTimePickerType.dateHijri : KDateTimePickerType.dateGregorian,
        fieldFormatModel: field.format,
        formatter: [],
      ),
      string: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: []),
      avatar: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: [], isAvatar: true),
      file: () => AllowedInputs(inputType: TextInputType.name, fieldFormatModel: field.format, formatter: [], isAvatar: false),
      duration: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.duration),
      length: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.length),
      volume: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.volume),
      weight: () => doubleInputs(field).copyWith(measurementsConversion: MeasurementsUnits.weight),
    );
  }

  static List<DateTime> dateList(DUIFieldModel field) {
    final list = dateRange(field);
    final fieldFormatModel = DynamicUiVM.allowedInput(field).fieldFormatModel;
    final init = DateTime.tryParse(fieldFormatModel?.initial.toString() ?? "") ?? DateTime.tryParse(fieldFormatModel?.min ?? "") ?? list[1];
    final min = DateTime.tryParse(fieldFormatModel?.min.toString() ?? "") ?? list[0];
    final max = DateTime.tryParse(fieldFormatModel?.max.toString() ?? "") ?? list[2];
    List<DateTime> dateList = [init, min, max]..sort((a, b) => a.compareTo(b));
    return dateList;
  }

  static List<DateTime> dateRange(DUIFieldModel field) {
    final fieldFormatModel = DynamicUiVM.allowedInput(field).fieldFormatModel;
    List<DateTime> dates = [];
    final date = DynamicDateRanges.fromString(fieldFormatModel?.date.toString());
    date.when(
      present: () => dates = [DateTime.now(), DateTime.now(), DateTime(DateTime.now().year + 100)],
      past: () => dates = [DateTime(DateTime.now().year - 100), DateTime.now(), DateTime.now()],
      plus18: () => dates = [DateTime(DateTime.now().year - 100), DateTime(DateTime.now().year - 18), DateTime(DateTime.now().year - 18)],
      plus21: () => dates = [DateTime(DateTime.now().year - 100), DateTime(DateTime.now().year - 21), DateTime(DateTime.now().year - 21)],
      non: () => dates = [DateTime(DateTime.now().year - 100), DateTime.now(), DateTime(DateTime.now().year + 100)],
    );
    return dates..sort((a, b) => a.compareTo(b));
  }

  static String? error422Text(String key, failure) {
    Error422Model? error422model = failure?.maybeWhen(orElse: () => null, error422: (error422model) => error422model);
    String? e;
    for (var error in error422model?.errors.values.toList() ?? <List<String>>[]) {
      if (error.first.toString().contains(key)) {
        e = error.first.replaceAll("The", '').replaceAll(key, '').replaceAll('.', '');
      }
    }
    return e;
  }
}

AllowedInputs doubleInputs(field) {
  return AllowedInputs(
    inputType: TextInputType.number,
    fieldFormatModel: field.format,
    formatter: [
      FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
    ],
  );
}
