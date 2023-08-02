import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:get/get.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final String? image;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final void Function() onChange;
  final Color? backgroundColor;
  final double? elevation;

  const CustomBtn({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.elevation,
    this.image,
    this.textStyle,
    required this.onChange,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onChange,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0), backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:  Radius.circular(15),topLeft: Radius.circular(15))),
      ),
      child: Ink(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [KColors.linearTwo, KColors.linearOne],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,

            ),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
        ),
        child: Container(
          width: width?? Get.width/1.1,
          height: height?? 50,
          alignment: Alignment.center,
          child:  Text(text, style: const TextStyle(color: Colors.white,fontSize: 18),),
        ),
      ),


    );
  }
}
class KButton extends StatelessWidget {
  const KButton(
      {super.key,
      this.title,
      required this.onPressed,
      this.width,
      this.hieght,
      this.isLoading = false,
      this.kFillColor,
      this.child});

  final String? title;
  final bool? isLoading;
  final Color? kFillColor;
  final Widget? child;
  final Function() onPressed;
  final double? width, hieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width,
      height: hieght ?? 45,
      child: RawMaterialButton(
        onPressed: isLoading ?? false ? null : onPressed,
        fillColor: kFillColor ?? KColors.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KHelper.cornerRadius)),
        elevation: 0,
        child: isLoading!
            ? FittedBox(
                child: SizedBox(
                  height: (hieght ?? 45) - 10,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              )
            : FittedBox(
                child: child ??
                    Text(
                      title!,
                      style: KTextStyle.of(context).btntitle,
                    ),
              ),
      ),
    );
  }
}
