import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:get/get.dart';

class KOfflineView extends StatelessWidget {
  final void Function()? onTryAgain;

  const KOfflineView({Key? key, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          width: Get.width,
          height: Get.height,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(KHelper.cornerRadius),
              ),
            ),
          ),
        ),
        Center(
          child: Material(
            child: Container(
              decoration: KHelper.of(context).elevatedBox,
              width: Get.width * .8,
              padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/images/no_connection.svg'),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Connection Failed",
                        style: KTextStyle.of(context).title,
                      ),
                    ),
                    const SizedBox(height: 25),
                    if (onTryAgain != null)
                      CustomBtn(
                        text: Tr.get.try_again,
                        onChange: onTryAgain!,
                        width: Get.width * .4,
                        height: Get.height * .05,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
