import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forall_driver/data/models/global/languages/languages_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/global/languages/languages_states.dart';
import 'package:forall_driver/logic/global/languages/langugese_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/drop_down.dart';

class LanguageDropdown extends StatelessWidget {
  final Function(LangDatum?) onSelect;
  final LangDatum? initVal;

  const LanguageDropdown({
    Key? key,
    required this.onSelect,
    this.initVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.languagesBloc..getAllLangs(),
      child: BlocBuilder<LanguagesBloc, LanguagesState>(
        builder: (context, state) {
          final langList = state.maybeWhen(
            orElse: () => <LangDatum>[],
            success: (langDatum, model) => model.data!,
          );
          return Column(
            children: [
              KDropdownBtn<LangDatum>(
                onChanged: (p0) {
                  onSelect(p0);
                  LanguagesBloc.of(context).selectLang(p0!);
                },
                isLoading: state.whenOrNull(loading: () => true) ?? false,
                items: langList.map((e) => KHelper.of(context).itemView<LangDatum>(itemText: "${e.nameValues?.value}", value: e)).toList(),
                title: state.maybeWhen(
                  orElse: () => (initVal != null ? initVal?.nameValues?.value ?? '' : Tr.get.select_language),
                  loading: () => Tr.get.loading,
                ),
                value: LanguagesBloc.of(context).initLang,
              ),
              if (state.maybeWhen(orElse: () => false, error: (e) => true))
                TextButton(
                  onPressed: LanguagesBloc.of(context).getAllLangs,
                  child: Text(Tr.get.try_again),
                ),
            ],
          );
        },
      ),
    );
  }
}
