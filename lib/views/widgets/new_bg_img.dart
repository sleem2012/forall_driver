import 'package:flutter/material.dart';
import 'package:forall_driver/logic/theme/theme_cubit.dart';

import '../../shared/theme/helper.dart';

class BgImg extends StatelessWidget {
  const BgImg({Key? key, this.child, this.isInputs}) : super(key: key);
  final Widget? child;
  final bool? isInputs;
  @override
  Widget build(BuildContext context) {
    /// final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: KHelper.width,
          height: KHelper.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isInputs == true ? 'assets/images/main_bg_${ThemeBloc.of(context).strTheme}.png' : 'assets/images/splash_${ThemeBloc.of(context).strTheme}.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (child != null) child!
      ],
    );
  }
}
