import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/global/languages/languages_model.dart';
import 'package:forall_driver/data/repository/global/global_repo.dart';
import 'package:forall_driver/logic/global/languages/languages_states.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import '../../../packages/extensions.dart';

class LanguagesBloc extends Cubit<LanguagesState> {
  LanguagesBloc({required this.globalRepoImpl}) : super(const LanguagesState.loading());

  static LanguagesBloc of(BuildContext context) {
    return BlocProvider.of<LanguagesBloc>(context);
  }

  final GlobalRepoImpl globalRepoImpl;

  LangDatum? seletedLang;
  LanguagesModel? languagesModel;

  Future getAllLangs() async {
    emit(const LanguagesState.loading());
    try {
      final result = await globalRepoImpl.getLanguages();
      result.fold(
        (l) {
          debugPrint('================= Lang Bloc $l : ');
          emit(LanguagesState.error(erorr: KFailure.toError(l)));
        },
        (r) {
          languagesModel = r;
          final selLang = languagesModel?.data?.where((element) => element.id == seletedLang?.id).toList() ?? [];
          seletedLang = selLang.isNotEmpty ? selLang.first : null;
          emit(LanguagesState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Lang Bloc Ex : $e : ');
      emit(LanguagesState.error(erorr: Tr.get.something_went_wrong));
    }
  }

  selectLang(LangDatum langDatum) {
    KStorage.i.setLang(langDatum.symbols ?? 'en');
    seletedLang = langDatum;
    emit(LanguagesState.success(model: languagesModel!));
    saveLangId(languagesModel?.data?.where((element) => element.symbols == langDatum.symbols).first.id ?? 2);
    _update;

    getAllLangs();
  }
  LangDatum? get initLang => languagesModel?.data?.firstWhereOrNull((element) => element.id.toString() == KStorage.i.getLangId);

  saveLangId(int id) {
    KStorage.i.setLangId(id);
  }

  get _update {
    emit(const LanguagesState.loading());
    emit(LanguagesState.success(model: languagesModel!));
  }
}
