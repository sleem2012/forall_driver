import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/data/models/notifications.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/notifications/get_notifications/get_notifications_bloc.dart';
import 'package:forall_driver/logic/notifications/get_notifications/notifications_state.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/error/error_widget.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';

import 'widgets/notifications_tile.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.getNotifications..getNotifications(),
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const KLoadingOverlay(isLoading: true),
            loading: () => const KLoadingOverlay(isLoading: true),
            success: (model) {
              return (model.notificationsData?.isEmpty ?? true)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/empty_inbox.svg',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Tr.get.your_inbox_is_empty,
                            style: KTextStyle.of(context).names,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 20, bottom: 100),
                      itemCount: model.notificationsData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return NotificationsTile(notificationsData: model.notificationsData?[index] ?? NotificationsData());
                      },
                    );
            },
            error: (error) => KErrorWidget(
              error: error,
              isError: true,
              onTryAgain: NotificationsBloc.of(context).getNotifications,
            ),
          );
        },
      ),
    );
  }
}
