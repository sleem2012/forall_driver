import 'package:flutter/material.dart';
import 'package:forall_driver/logic/theme/theme_cubit.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/views/widgets/icon_button.dart';

class ThemeToggleBtn extends StatelessWidget {
  final double? size;
  const ThemeToggleBtn({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KIconButton(
      onPressed: ThemeBloc.of(context).updateThemeMode,
      child: Icon(
        Theme.of(context).brightness == Brightness.light ? Icons.nights_stay_rounded : Icons.wb_sunny_rounded,
        color: KColors.of(context).accentColor,
        size: size,
      ),
    );
  }
}
