import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/repository/auth/auth_repo.dart';
import 'package:forall_driver/logic/auth/reset_pass/reset_pass_state.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

class ResetPasswordBloc extends Cubit<ResetPasswordState> {
  ResetPasswordBloc({required this.authRepoImpl}) : super(const ResetPasswordState.initial());

  static ResetPasswordBloc of(BuildContext context) {
    return BlocProvider.of<ResetPasswordBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  reset({required String password, required String passwordConf}) async {
    emit(const ResetPasswordState.loading());
    try {
      final result = await authRepoImpl.resetPassword(password: password, passwordConf: passwordConf);

      result.fold(
        (l) {
          emit(ResetPasswordState.error(failure: l));
          debugPrint('================= Reset Password   (Bloc): Failed $l ');
        },
        (r) {
          emit(const ResetPasswordState.success());
          debugPrint('================= Reset Password (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Reset Password  (Bloc) (catch):  $e');
      emit(const ResetPasswordState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
