
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/packages/shared/api_client/endpoints.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:linkwell/linkwell.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/Logo Only.svg'),
            const SizedBox(
              height: 20,
            ),
            Text(
              Tr.get.update_check,
              style: KTextStyle.of(context)
                  .body
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset('assets/images/Time to update.svg',
                  fit: BoxFit.cover, width: 300),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: KButton(
                onPressed: () async {

                  await launchUrlString(KEndPoints.appStoreLinkDriver);
                },
                title: Tr.get.update_now,
              ),
            ),
            LinkWell(
              "www.forallfa.com",
              style: KTextStyle.of(context).names,
            )
          ],
        ),
      ),
    );
  }
}
