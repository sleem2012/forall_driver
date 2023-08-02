import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:get/get.dart';
import 'hero_dialog.dart';

class KPopupDialg extends StatelessWidget {
  final Widget child;
  final String tag;

  const KPopupDialg({super.key, required this.child, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: IgnorePointer(child: Container(color: Colors.transparent)),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
              child: Hero(
                tag: tag,
                createRectTween: (begin, end) => HeroTween(begin: begin, end: end),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(KHelper.cornerRadius),
                  child: Material(
                    elevation: 0,
                    color: Colors.transparent,
                    child: FittedBox(child: child),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class KButtonToDialog extends StatelessWidget {
  final Widget dialog, child;
  final String tag;
  final double? kWidth;
  final bool? isDismissible;

  const KButtonToDialog({super.key, required this.dialog, this.isDismissible, required this.tag, required this.child, this.kWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth ?? Get.width,
      child: Hero(
        tag: tag,
        createRectTween: (begin, end) {
          return HeroTween(begin: begin, end: end);
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: SingleChildScrollView(child: Material(color: Colors.transparent, child: child)),
            onTap: () {
              Navigator.push(
                context,
                HeroDialog(
                  builder: (context) => KPopupDialg(tag: tag, child: dialog),
                  isDismissible: isDismissible,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
