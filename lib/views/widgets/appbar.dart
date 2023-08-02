import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/logic/main_view/main_view_bloc.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/packages/chat/view/widgets/un_readed_msg_badge.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/add_price/add_price_view.dart';
import 'package:forall_driver/views/range/range_view.dart';
import 'package:forall_driver/views/widgets/icon_button.dart';

import '../../shared/theme/colors.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? needsPop, showAct;
  final String? title;
  final Color? color;

  const KAppBar(
      {Key? key,
      this.needsPop = false,
      this.title,
      this.showAct = true,
      this.color})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: AppBar(
        backgroundColor: color ?? Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('FORALL',
                style: TextStyle(
                    fontSize: 20, color: KColors.of(context).accentColor)),
            const SizedBox(width: 10),
            SvgPicture.asset('assets/images/Logo Only.svg',
                height: 30, width: 30),
          ],
        ),
        titleTextStyle: KTextStyle.of(context).headers,
        actions: showAct!
            ? [
                if (KStorage.i.getUserInfo?.data?.rider?.commercial?.driver
                        ?.serviceType ==
                    "take_tour") ...[
                  KIconButton(
                      child: Image.asset(
                        'assets/images/Take-a-tour---filled.png',
                        height: 20,
                        width: 20,
                      ),
                      onPressed: () {
                        Nav.to(AddPriceView());
                      }),
                  const SizedBox(width: 5),
                  KIconButton(
                      child: Image.asset(
                          'assets/images/Book-a-car---Filled.png',
                          height: 20,
                          width: 20),
                      onPressed: () {
                        Nav.to(const RangeView());
                      }),
                ],
                const SizedBox(width: 5),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    KIconButton(
                      child: const Icon(KHelper.chats, size: KHelper.iconSize),
                      onPressed: () {
                        if (needsPop!) Nav.back();
                        MainViewBloc.of(context).navTaped(2);
                      },
                    ),
                     const Positioned(
                        top: 10, right: 0, child: UnReaddMsgBadge()),
                  ],
                ),
                const SizedBox(width: 5),
                KIconButton(
                  child:
                      const Icon(KHelper.notifications, size: KHelper.iconSize),
                  onPressed: () {
                    if (needsPop!) Nav.back();
                    MainViewBloc.of(context).navTaped(3);
                  },
                ),
              ]
            : [],
      ),
    );
  }
}
