import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/logic/order/order_bloc.dart';
import 'package:forall_driver/logic/order/order_state.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/requests/widgets/key_value_text.dart';
import 'package:get/get.dart';

import '../../../shared/theme/colors.dart';
import '../../widgets/action_dialog.dart';
import '../../widgets/relative_date_time.dart';
import '../../widgets/slugs_drop_down.dart';
import 'reguest_dialog.dart';

class PendingRequestsTile extends StatelessWidget {
  const PendingRequestsTile({Key? key, required this.tag, required this.data}) : super(key: key);
  final String tag;
  final OrderData data;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        state.whenOrNull(
          updateSuccess: () {
            // Get.to(() => const OnSuccessView(msg: "Order Accepted Successfully", ));

            // KHelper.showSnackBar("Order Accepted Successfully");
            // OrderBloc.of(context).getOrder();
          },
        );
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            KHelper.showCustomBottomSheet(RequestDialog(isPreparing: true, data: data), isScrollControlled: true);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
            padding: const EdgeInsets.all(KHelper.hPadding),
            width: Get.width,
            decoration: KHelper.of(context).elevatedBox,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * .18,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      data.vendor?.company?.logo?.s128px ?? dummyNetImg,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            data.vendor?.company?.name?.value ?? '',
                            style: KTextStyle.of(context).names,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          KeyValueText(title: Tr.get.order_id, value: data.id?.toString() ?? ''),
                          KeyValueText(title: Tr.get.quantity, value: data.shippingContent?.quantity.toString() ?? ''),
                          KeyValueText(title: Tr.get.distance, value: ' : ${data.distanceMeters}' "  ${Tr.get.meter}"),
                          KeyValueText(title: Tr.get.note, value: ' : ${data.user_note}'),
                        ],
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        child: RawMaterialButton(
                          onPressed: () {
                            ActionDialog(
                              title: Tr.get.accept_order,
                              approveAction: Tr.get.yes_message,
                              cancelAction: Tr.get.no_message,
                              onApproveClick: () {
                                Navigator.pop(context);

                                OrderBloc.of(context).updateOrder(shipping_id: data.id ?? 0, state: KSlugModel.onWay, data: data);
                              },
                              onCancelClick: () {
                                Navigator.pop(context);
                              },
                            ).show<void>(context);
                          },
                          fillColor: KColors.of(context).accentColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            Tr.get.accept_order,
                            style: KTextStyle.of(context).body3.copyWith(color: Colors.white),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
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
        );
      },
    );
  }
}
