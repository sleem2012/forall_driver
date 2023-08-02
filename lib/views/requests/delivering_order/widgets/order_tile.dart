import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/requests/delivering_order/widgets/delivering_state_cases.dart';
import 'package:get/get.dart';

import '../../../../logic/delivering/get_delivering_order/get_delivering_order_cubit.dart';
import '../../../../packages/chat/data/models/chat_model.dart';
import '../../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../../../packages/widgets/slide_panel.dart';
import '../../../widgets/action_dialog.dart';
import '../../../widgets/slugs_drop_down.dart';
import 'delivering_details.dart';

class DeliveringOrderTile extends StatelessWidget {
  const DeliveringOrderTile({Key? key, required this.orderData}) : super(key: key);
  final DeliveringOrderData orderData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            KHelper.showCustomBottomSheet(
                isScrollControlled: true,
                Stack(
                  children: [
                    DeliveringDetails(orderData: orderData),
                  ],
                ));
          },
          child: Slidable(
            key: Key(orderData.id.toString()),
            dragStartBehavior: DragStartBehavior.start,
            startActionPane: actionPane(
              isToENd: false,
              Icons.check,
              KColors.accentColorD,
              () {
                if (orderData.state == KSlugModel.lookingForRider) {
                  ActionDialog(
                    title: Tr.get.accept_order,
                    approveAction: Tr.get.yes_message,
                    cancelAction: Tr.get.no_message,
                    onApproveClick: () {
                      Navigator.pop(context);
                      GetDeliveringOrderBloc.of(context).updateOrder(data: orderData, OrderState: KSlugModel.pending);
                    },
                    onCancelClick: () {
                      Navigator.pop(context);
                    },
                  ).show<void>(context);
                }
              },
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: KHelper.of(context).elevatedBox,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .18,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: KColors.of(context).transactionCard,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: CachedNetworkImageProvider(
                          orderData.orderUser?.image?.s64px ?? dummyNetImg,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(orderData.orderUser?.name ?? '', style: KTextStyle.of(context).body2),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(Tr.get.order_id, style: KTextStyle.of(context).body2),
                            Text(
                              orderData.id.toString(),
                              style: KTextStyle.of(context).body3,
                            )
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(Tr.get.total),
                            Text(
                              '${orderData.totalPrice?.toString() ?? ''}  ${orderData.currency?.toString() ?? ''}',
                              style: KTextStyle.of(context).body3,
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('${Tr.get.from} : '),
                                  Expanded(
                                    child: Text(
                                      orderData.source?.cityId?.name?.value?.toString() ?? '',
                                      style: KTextStyle.of(context).body3,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('${Tr.get.to} : '),
                                  Expanded(
                                    child: Text(orderData.destination?.cityId?.name?.value?.toString() ?? '',
                                        style: KTextStyle.of(context).body3, overflow: TextOverflow.ellipsis, maxLines: 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        orderData.createdAt?.substring(0, 10) ?? "",
                        style: const TextStyle(fontSize: 9),
                      ),
                      const SizedBox(height: 9),
                      // Text(
                      //   orderData.state ?? '',
                      //   style: const TextStyle(fontSize: 9),
                      // )
                      const SizedBox(height: 9),
                      DeliveringStateCases(
                        data: orderData,
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (orderData.state == KSlugModel.pending)
          Positioned(
            bottom: -15,
            right: !Tr.isAr ? 20 : null,
            left: Tr.isAr ? 20 : null,
            child: KChatIconButton(
              roomType: ChatRoomType.billOrder,
              room_type_id: orderData.id,
              order_chat_type: 'client',
            ),
          )
      ],
    );
  }
}
