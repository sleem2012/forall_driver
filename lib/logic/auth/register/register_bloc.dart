import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/global/location/cities/cities_model.dart';
import '../../../data/models/global/location/countries/countries_model.dart';
import '../../../data/models/register/register_model.dart';
import '../../../data/repository/auth/auth_repo.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../packages/shared/picker/data/country_search_model/address_result.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../../views/widgets/slugs_drop_down.dart';
import 'register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc({required this.authRepoImpl}) : super(const RegisterState.initial());

  static RegisterBloc of(BuildContext context) {
    return BlocProvider.of<RegisterBloc>(context);
  }

  CountriesDatum? selectedCountry;
  CountriesDatum? selectedNationality;
  CitiesDatum? selectedCity;
  String cCode = '';
  bool passVisible = true, addressIsNull = false;

  togglePassV() {
    passVisible = !passVisible;
    _update;
  }

  final AuthRepoImpl authRepoImpl;

  bool termsChecked = false;
  bool privacyChecked = false;
  bool contractChecked = false;

  checkTerms(bool value) {
    termsChecked = value;
    _update;
  }

  checkPrivacy(bool value) {
    privacyChecked = value;
    _update;
  }

  checkContract(bool value) {
    contractChecked = value;
    _update;
  }

  RegisterModel? registerModel = RegisterModel(
    birthdate: DateTime.now().toString().split(' ').first,
    fcmToken: KStorage.i.getFcmToken,
    lang_id: KStorage.i.getLangId,
    currency_id: KStorage.i.getcurrencyId,
    timeZone: DateTime.now().timeZoneName,
  );
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController intercomController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController detailedAddressController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  String? location;

  File? image;

  register() async {
    if (!termsChecked) {
      KHelper.showSnackBar(Tr.get.youShouldAcceptTermsAndConditions);
      return;
    }

    if (!privacyChecked) {
      KHelper.showSnackBar(Tr.get.youShouldAcceptPrivacyAndPolicy);
      return;
    }

    if (!contractChecked) {
      KHelper.showSnackBar(Tr.get.youShouldAcceptDigitalContract);
      return;
    }

    debugPrint('================= ${registerModel?.fcmToken}');
    if (registerModel?.detailed_address == null) {
      addressIsNull = true;
      _update;
      return;
    }
    emit(const RegisterState.loading());

    try {
      registerModel = registerModel?.copyWith(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        mobile: '$cCode${phoneController.text}',
        password_confirmation: passwordConfirmController.text,
        fcmToken: KStorage.i.getFcmToken,
        lang_id: KStorage.i.getLangId,
        currency_id: KStorage.i.getcurrencyId,
      );
      final result = await authRepoImpl.register(registerModel!);

      result.fold(
        (l) {
          emit(RegisterState.error(error: KFailure.toError(l)));
          debugPrint('================= Register (Bloc): Failed $l ');
        },
        (r) {
          emit(const RegisterState.success());
          debugPrint('================= Register (Bloc): Success ');
        },
      );
    } catch (e) {
      debugPrint('================= Register (Bloc) (catch):  $e');
      emit(RegisterState.error(error: Tr.get.something_went_wrong));
    }
  }

  setbirthdate(String val) {
    registerModel = registerModel?.copyWith(birthdate: val);
    _update;
  }

  KSlugModel? selectedGender;

  selectGender(KSlugModel? selected) {
    registerModel = registerModel?.copyWith(gender: selected?.slug);
    selectedGender = selected;
    _update;
  }

  selectImage(File? image) async {
    if (image != null) {
      registerModel = registerModel?.copyWith(image: image);
      _update;
    } else {
      KHelper.showSnackBar(Tr.get.select_cover);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        birthdateController.text = value.toString().split(' ').first;
        registerModel = registerModel?.copyWith(birthdate: value.toString().split(' ').first);
        debugPrint('================= ${registerModel?.birthdate}');
        _update;
        return value;
      } else {
        return null;
      }
    });
  }

  Future<void> selectCityId(int id, CitiesDatum? citiesDatum) async {
    selectedCity = citiesDatum;
    registerModel = registerModel?.copyWith(city_id: id);
    debugPrint('================= ${registerModel?.city_id} ');
    _update;
  }

  Future<void> selectNationality(int id, CountriesDatum? nationalityData) async {
    selectedNationality = nationalityData;
    registerModel = registerModel?.copyWith(nationality_id: id);
    debugPrint('================= ${registerModel?.nationality_id} ');
    _update;
  }

  Future<void> selectCountry(CountriesDatum? country) async {
    selectedCountry = country;
    _update;
  }

  // selectAddress(BuildContext context) async {
  //   try {
  //     final result = await KHelper.showMaps(context);
  //     if (result != null) {
  //       registerModel = registerModel?.copyWith(
  //         latitude: result.latlng.latitude,
  //         longitude: result.latlng.longitude,
  //         detailed_address: result.address,
  //       );
  //       location = result.address;
  //       detailedAddressController.text = result.address;
  //       debugPrint('================= ${registerModel?.detailed_address} : ');
  //       debugPrint('detailedAddress ${detailedAddressController.text} : ');
  //     }
  //     _update;
  //   } catch (e) {
  //     KHelper.showSnackBar(Tr.get.address_is_null);
  //   }
  // }

  setLocationData(AddressResult result) {
    registerModel = registerModel?.copyWith(
        latitude: result.latlng.latitude,
        longitude: result.latlng.longitude,
        detailed_address: result.address,
        state: result.state,
        city_id: result.cityId,
        floor: result.floor,
        building: result.building,
        street: result.street,
        zipcode: result.zipcode,
        intercom: result.intercome);
    location = result.address;
  }

  get _update {
    emit(const RegisterState.loading());
    emit(const RegisterState.initial());
  }
}
