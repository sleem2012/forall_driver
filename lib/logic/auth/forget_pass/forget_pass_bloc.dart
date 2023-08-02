import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/repository/auth/auth_repo.dart';
import 'package:forall_driver/logic/auth/forget_pass/forget_pass_state.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';

class ForgetPasswordBloc extends Cubit<ForgetPasswordState> {
  ForgetPasswordBloc({required this.authRepoImpl}) : super(const ForgetPasswordState.initial());

  static ForgetPasswordBloc of(BuildContext context) {
    return BlocProvider.of<ForgetPasswordBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  sendCode({required String email}) async {
    emit(const ForgetPasswordState.loading());
    try {
      final result = await authRepoImpl.forgetPassword(email: email);

      result.fold(
        (l) {
          emit(ForgetPasswordState.error(failure: l));
          debugPrint('================= Forget Password   (Bloc): Failed $l ');
        },
        (r) {
          emit(const ForgetPasswordState.success());
          debugPrint('================= Forget Password (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      emit( const ForgetPasswordState.error(failure: KFailure.someThingWrongPleaseTryAgain()));
      debugPrint('================= Forget Password  (Bloc) (catch):  $e');
    }
  }
}
