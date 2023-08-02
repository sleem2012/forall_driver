import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/Auth/logout/logout_with_another_email.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:linkwell/linkwell.dart';

class KErrorView extends StatelessWidget {
  final void Function()? onTryAgain;
  final String? error;

  const KErrorView({Key? key, this.onTryAgain, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Logo Only.svg'),
              const SizedBox(
                height: 5,
              ),
              Text(
                Tr.get.sorry,
                style: KTextStyle.of(context).names,
              ),
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset('assets/images/oops.svg'),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error ?? Tr.get.try_later,
                  style: KTextStyle.of(context).title,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 25),
              if (onTryAgain != null)
                CustomBtn(
                  text: Tr.get.try_again,
                  onChange: onTryAgain!,
                  width: Get.width * .4,
                ),
              const SizedBox(height: 8,),

              LinkWell(
                "www.forallfa.com",
                style: KTextStyle.of(context).body2,
              ),
              const SizedBox(height: 8,),

              const LogoutWithAnotherEmail(),

            ],
          ),
        ),
      ),
    );
  }
}
