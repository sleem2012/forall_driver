import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/global/location/countries/countries_model.dart';
import 'package:forall_driver/data/models/user_info/udate_user_model.dart';
import 'package:forall_driver/data/repository/auth/auth_repo.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';

class UpdateUserBloc extends Cubit<UpdateUserState> {
  UpdateUserBloc({required this.authRepoImpl})
      : super(const UpdateUserState.initial());

  static UpdateUserBloc of(BuildContext context) =>
      BlocProvider.of<UpdateUserBloc>(context);

  final AuthRepoImpl authRepoImpl;

  final TextEditingController nameCtrl =
      TextEditingController(text: KStorage.i.getUserInfo?.data?.name);
  final TextEditingController phoneCtrl =
      TextEditingController(text: KStorage.i.getUserInfo?.data?.mobile);
  final TextEditingController emailCtrl =
      TextEditingController(text: KStorage.i.getUserInfo?.data?.email);

  String cCode = '';
  UpdateUserModel? updateUserModel = UpdateUserModel(
    birthdate: KStorage.i.getUserInfo?.data?.birthdate,
    gender: KStorage.i.getUserInfo?.data?.gender,
    currencyId: KStorage.i.getcurrencyId,
    langId: KStorage.i.getLangId,
    id: KStorage.i.getUserInfo?.data?.id.toString(),
  );
  KSlugModel? selectedGender =
      KSlugModel.of(KStorage.i.getUserInfo?.data?.gender ?? '');

  bool isOnline = KStorage.i.getUserInfo?.data?.isOnline ?? false;

  toggleOnline() {
    isOnline = !isOnline;
    KStorage.i.setOnline(isOnline);
    updateUserModel = updateUserModel?.copyWith(isOnline: isOnline);
    _update;
    updateOnline();
    debugPrint(isOnline.toString());
  }

  updateOnline() async {
    emit(const UpdateUserState.loading());
    try {
      updateUserModel = updateUserModel?.copyWith(isOnline: isOnline);
      debugPrint('================= ${updateUserModel?.toJson()} : ');
      final result = await authRepoImpl.updateOnline(model: updateUserModel!);
      result.fold(
        (l) {
          emit(UpdateUserState.error(failure: l));
          debugPrint('================= Login (Bloc): Failed => $l ');
        },
        (r) {
          emit(UpdateUserState.success(isOnline: isOnline));
          debugPrint('================= Login (Bloc): Success => $r ');
          KStorage.i.setUserInfo(r);
          KStorage.i.setOnline(r.data?.isOnline);
        },
      );
    } catch (e) {
      debugPrint('================= Login (Bloc) (catch):  $e');
      emit(const UpdateUserState.error(
          failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  get updateLang async {
    authRepoImpl.updateUser(
        model: UpdateUserModel(
            langId: KStorage.i.getLangId,
            id: KStorage.i.getUserInfo?.data?.id.toString()));
  }

  update() async {
    emit(const UpdateUserState.loading());

    try {
      updateUserModel = updateUserModel?.copyWith(
        name: nameCtrl.text,
        email: emailCtrl.text,
        mobile: phoneCtrl.text,
        gender: selectedGender?.slug,
      );

      debugPrint('================= ${updateUserModel?.toJson()} : ');

      final result = await authRepoImpl.updateUser(model: updateUserModel!);
      result.fold(
        (l) {
          emit(UpdateUserState.error(failure: l));
          debugPrint('================= Login (Bloc): Failed => $l ');
        },
        (r) {
          emit(const UpdateUserState.success());
          debugPrint('================= Login (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Login (Bloc) (catch):  $e');
      emit(const UpdateUserState.error(
          failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  CountriesDatum? selectedNationality;

  update_nationality() async {
    if (selectedNationality == null) {
      KHelper.showSnackBar('choose nationality first');
      return;
    }

    emit(const UpdateUserState.loading());

    try {
      final result = await authRepoImpl.updateUser(
          model: UpdateUserModel(
        nationalityId: selectedNationality?.id.toString(),
        id: KStorage.i.getUserInfo?.data?.id.toString(),
      ));
      result.fold(
        (l) {
          emit(UpdateUserState.error(failure: l));
          debugPrint('================= update  (Bloc): Failed => $l ');
        },
        (r) {
          emit(const UpdateUserState.success());
          debugPrint('================= update (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= update (Bloc) (catch):  $e');
      emit(const UpdateUserState.error(
          failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  selectGender(KSlugModel? selected) {
    selectedGender = selected;
    updateUserModel = updateUserModel?.copyWith(gender: selected?.slug);
    _update;
  }

  selectImage(File? image) async {
    if (image != null) {
      updateUserModel = updateUserModel?.copyWith(image: image);
      _update;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      updateUserModel = updateUserModel?.copyWith(
          birthdate: picked.toString().split(' ').first);
      debugPrint('================= ${updateUserModel?.birthdate}');
      _update;
    }
  }
  get blockAccount {
    updateUserModel=updateUserModel?.copyWith(is_blocked: 1);
  }

  get _update {
    emit(const UpdateUserState.loading());
    emit(const UpdateUserState.initial());
  }
}
