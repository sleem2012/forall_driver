import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/global/settings/settings_model.dart';
import 'package:forall_driver/data/repository/global/global_repo.dart';
import 'package:forall_driver/logic/global/settings/settings_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';

import '../../../packages/shared/api_client/endpoints.dart';


class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc({required this.globalRepoImpl}) : super(const SettingsState.initial());

  static SettingsBloc of(BuildContext context) {
    return BlocProvider.of<SettingsBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;
  SettingsModel? settingsModel;
  bool? isUpdate;

  Future getSettings() async {
    emit(const SettingsState.loading());
    try {
      final result = await globalRepoImpl.getSettings();
      result.fold(
            (l) {
          emit(SettingsState.error(error: KFailure.toError(l)));
          debugPrint('================= Settings (Bloc) : $l  ');
        },
            (r) {
          settingsModel = r;
          KStorage.i.setSettings(settingsModel);

          if ((r.data?.first.appVersion?.delivery ?? 0) <= KEndPoints.driverAppVersion) {
            isUpdate = false;
          } else {
            isUpdate = true;
          }

          emit(SettingsState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Settings (Bloc) (catch) : $e  ');
      emit(SettingsState.error(error: Tr.get.something_went_wrong));
    }
  }
}
