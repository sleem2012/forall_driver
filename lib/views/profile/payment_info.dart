import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/text_field.dart';
import 'package:get/get.dart';

class PaymentInformation extends StatelessWidget {
  const PaymentInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const KAppBar(needsPop: true, title: 'Change passworrd'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: SvgPicture.asset(
                'assets/images/pay_card.svg',
                width: Get.width * .45,
              ),
            ),
            const SizedBox(height: 50),
            KTextFormField(
              hintText: Tr.get.bank_name,
            ),
            const SizedBox(height: 10),
            KTextFormField(
              hintText: Tr.get.name_on_card,
            ),
            const SizedBox(height: 10),
            KTextFormField(
              hintText: Tr.get.account_number,
            ),
            const SizedBox(height: 50),
            KButton(
              title: Tr.get.change,
              onPressed: () {},
              width: Get.width * .7,
            )
          ],
        ),
      ),
    );
  }
}
