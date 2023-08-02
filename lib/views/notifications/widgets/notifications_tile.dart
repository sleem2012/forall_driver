import 'package:flutter/material.dart';
import 'package:forall_driver/extensions.dart';

import '../../../data/models/notifications.dart';
import '../../../logic/notifications/get_notifications/get_notifications_bloc.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/relative_date_time.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({Key? key, required this.notificationsData}) : super(key: key);
  final NotificationsData notificationsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).elevatedBox.copyWith(
            color: notificationsData.isRead! ? KColors.of(context).elevatedBox : KColors.of(context).shadow,
          ),
      margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      child: ListTile(
        onTap: () {
          NotificationsBloc.of(context).updateNotification(notificationsData.id ?? 0);
          debugPrint(notificationsData.isRead.toString());
        },
        contentPadding: const EdgeInsets.all(8),
        leading: const Icon(KHelper.notifications, size: 40),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${notificationsData.title?.value}', style: KTextStyle.of(context).listTileTitle),
            8.h,
            Text(
              '${notificationsData.body?.value}',
              style: KTextStyle.of(context).listTileSub,
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RelativeDateTimeWidget(
              dateTime: DateTime.tryParse(notificationsData.createdAt ?? "") ?? DateTime.now(),
              textStyle: KTextStyle.of(context).body3,
            )
          ],
        ),
      ),
    );
  }
}
