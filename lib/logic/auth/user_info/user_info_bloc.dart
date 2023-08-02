import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/user_info/user_model.dart';
import 'package:forall_driver/data/repository/auth/auth_repo.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

class UserInfoBloc extends Cubit<UserInfoState> {
  UserInfoBloc({required this.authRepoImpl}) : super(const UserInfoState.initial());

  static UserInfoBloc of(BuildContext context) {
    return BlocProvider.of<UserInfoBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  UserModel? _userModel;

  UserModel? get user {
    _userModel = KStorage.i.getUserInfo;
    return _userModel;
  }
  bool get isOnline => user?.data?.isOnline??false;

  getUserInfo() async {
    try {
      emit(const UserInfoState.loading());
      final result = await authRepoImpl.userInfo(KStorage.i.getFcmToken??'');
      result.fold(
        (l) {
          emit(UserInfoState.error(failure: l));
          debugPrint('================= User info (Bloc): Failed => $l ');
        },
        (r) {
          _userModel = r;
          KStorage.i.setToken(_userModel?.data?.token ?? '');
          KStorage.i.setUserInfo(_userModel);
          KStorage.i.setOnline(_userModel?.data?.isOnline);
          if(_userModel?.data?.rider?.commercial?.price!=null){
            KStorage.i.setPrice(_userModel?.data?.rider?.commercial?.price);
          }
          if(_userModel?.data?.rider?.commercial?.range!=null){
            KStorage.i.setRange(_userModel?.data?.rider?.commercial?.range);
          }
          emit(UserInfoState.success(userModel: _userModel!));
        },
      );
    } catch (e) {
      debugPrint('================= User Info Bloc Ex : $e ');
      emit(const UserInfoState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
      rethrow;

    }
  }




}
