import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';

import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../data/update_range/update_range_repo.dart';
import 'update_range_state.dart';

class UpdateRangeCubit extends Cubit<UpdateRangeState> {
  UpdateRangeCubit({required this.updateRangeRepoImpl})
      : super(const UpdateRangeState.initial());

  static UpdateRangeCubit of(context) => BlocProvider.of(context);

  final UpdateRangeRepoImpl updateRangeRepoImpl;

  updateRange(String range, String lat, String long) async {
    emit(const UpdateRangeState.loading());

    try {
      final result = await updateRangeRepoImpl.updateRange(
          range: range, rangeLat: lat, rangeLong: long);
      result.fold(
        (l) {
          debugPrint('================= updateRange (Bloc)  :$l ');
          emit(UpdateRangeState.error(error: KFailure.toError(l)));
        },
        (r) {
          KStorage.i.setRange(r.data?.commercial?.range);
          emit(UpdateRangeState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= updateRange (Bloc)  :$e ');
      emit(UpdateRangeState.error(error: Tr.get.something_went_wrong));
    }
  }
}
