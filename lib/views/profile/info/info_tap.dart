import 'package:flutter/material.dart';
import 'package:forall_driver/packages/extensions.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/profile/info/car_info.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';

import 'driver_info_new.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const KAppBar(
        color: Colors.transparent,
      ),
      body: BgImg(
        child: Padding(
          padding: const EdgeInsets.only(top: 95),
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  indicatorColor: Colors.transparent,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  labelStyle: KTextStyle.of(context).title.B,
                  labelColor: KTextStyle.of(context).title.color,
                  unselectedLabelStyle: KTextStyle.of(context).body,
                  unselectedLabelColor: KTextStyle.of(context).title.color,
                  tabs: [
                    Text(Tr.get.driver),
                    Text(Tr.get.vehicle),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      DriverInfoNew(),
                      CarInfo(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
