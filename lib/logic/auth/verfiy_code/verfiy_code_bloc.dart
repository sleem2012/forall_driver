import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/repository/auth/auth_repo.dart';
import 'package:forall_driver/logic/auth/verfiy_code/verfiy_code_state.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

class VerfiyCodeBloc extends Cubit<VerfiyCodeState> {
  VerfiyCodeBloc({required this.authRepoImpl}) : super(const VerfiyCodeState.initial());

  static VerfiyCodeBloc of(BuildContext context) {
    return BlocProvider.of<VerfiyCodeBloc>(context);
  }

  final AuthRepoImpl authRepoImpl;

  verfiyCode({required String token,  String? email}) async {
    emit(const VerfiyCodeState.loading());
    try {
      final result = await authRepoImpl.verifyToken(token: token, email: email);

      result.fold(
        (l) {
          emit(VerfiyCodeState.error(error: KFailure.toError(l)));
          debugPrint('================= Verfiy Code  (Bloc): Failed $l ');
        },
        (r) {
          emit(const VerfiyCodeState.success());
          debugPrint('================= Verfiy Code  (Bloc): Success => $r ');
        },
      );
    } catch (e) {
      debugPrint('================= Verfiy Code  (Bloc) (catch):  $e');
      emit(VerfiyCodeState.error(error: Tr.get.something_went_wrong));
    }
  }
}
