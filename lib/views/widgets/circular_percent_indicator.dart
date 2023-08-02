import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  final String footerText;
  final String centeredText;
  final double percent;

  const CircularIndicator({Key? key, required this.footerText, required this.centeredText, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      maskFilter: const MaskFilter.blur(BlurStyle.solid, 10),
      radius: 70.0,
      animation: true,
      animationDuration: 1200,
      lineWidth: 12.0,
      percent: percent,
      footer: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          footerText,
          style: TextStyle(
            color: KColors.of(context).accentColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      center: Text(
        centeredText,
        style: KTextStyle.of(context).body,
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.grey[300]!,
      progressColor: KColors.of(context).accentColor,
    );
  }
}
