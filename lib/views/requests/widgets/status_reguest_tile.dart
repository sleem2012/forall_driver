import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/requests/widgets/key_value_text.dart';
import 'package:forall_driver/views/requests/widgets/reguest_dialog.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../widgets/relative_date_time.dart';
import 'states_cases_with_client.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({Key? key, required this.data}) : super(key: key);
  final OrderData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            KHelper.showCustomBottomSheet(RequestDialog(isPreparing: true, data: data), isScrollControlled: true);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
            padding: const EdgeInsets.all(KHelper.hPadding),
            width: Get.width,
            decoration: KHelper.of(context).elevatedBox,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(
                    data.orderUser?.image?.s128px ?? dummyNetImg,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data.orderUser?.name}',
                        style: KTextStyle.of(context).body2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      KeyValueText(title: Tr.get.order_id, value: '${data.id}'),
                    ],
                  ),
                ),
                FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StatesCasesWithClient(data: data),
                      RelativeDateTimeWidget(
                        dateTime: DateTime.tryParse(data.created_at ?? "") ?? DateTime.now(),
                        textStyle: KTextStyle.of(context).hint,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          right: !Tr.isAr ? 20 : null,
          left: Tr.isAr ? 20 : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  "assets/images/circle_call.svg",
                  height: 30,
                  width: 30,
                ),
                onTap: () async {
                  await launchUrlString(
                    'tel:${data.orderUser?.mobile}',
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: KChatIconButton(
                  roomType: ChatRoomType.order,
                  room_type_id: data.id,
                  order_chat_type: 'rider',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async {
                  String url = "google.navigation:q=${data.orderUser?.address?.longitude},${data.orderUser?.address?.latitude}";
                  await launchUrlString(url);
                },
                child: SvgPicture.asset(
                  "assets/images/circle_locatoin.svg",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
