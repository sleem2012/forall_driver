import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:get/get.dart';

class ChangePassSuccess extends StatelessWidget {
  const ChangePassSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/acc_added_success.svg',
                  width: Get.width * .45,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                Tr.get.pass_change_success,
                style: KTextStyle.of(context).names,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
