import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/extensions.dart';
import 'package:forall_driver/logic/order/order_bloc.dart';
import 'package:forall_driver/logic/order/order_state.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/requests/widgets/key_value_text.dart';
import 'package:forall_driver/views/requests/widgets/states_cases_with_vendor.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../packages/chat/data/models/chat_model.dart';
import '../../../packages/chat/view/widgets/chat_icon_btn.dart';
import '../../widgets/relative_date_time.dart';

class ProcessingRequestsTile extends StatelessWidget {
  const ProcessingRequestsTile({Key? key, required this.tag, required this.data}) : super(key: key);
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
            // OrderBloc.of(context).update_order_socket(orderId: data.id);
            // OrderBloc.of(context).getOrder();
          },
        );
      },
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
              padding: const EdgeInsets.all(KHelper.hPadding),
              width: Get.width,
              decoration: KHelper.of(context).elevatedBox,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 48,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          backgroundImage: CachedNetworkImageProvider(
                            data.vendor?.company?.logo?.s128px ?? dummyNetImg,
                          ),
                        ),
                      ),
                      10.w,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data.vendor?.company?.name?.value ?? '',
                              style: KTextStyle.of(context).body2,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(child: KeyValueText(title: Tr.get.order_id, value: data.id?.toString() ?? '')),
                                Expanded(child: KeyValueText(title: Tr.get.quantity, value: data.shippingContent?.quantity.toString() ?? '')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StatesCasesWithVendor(data: data),
                            10.h,
                            RelativeDateTimeWidget(
                              dateTime: DateTime.tryParse(data.created_at ?? "") ?? DateTime.now(),
                              textStyle: KTextStyle.of(context).hint,
                            ),
                            10.h,
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -10,
              right: !Tr.isAr ? 20 : null,
              left: Tr.isAr ? 20 : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      "assets/images/circle_call.svg",
                      height: 30,
                      width: 30,
                    ),
                    onTap: () async {
                      await launchUrlString('tel:${data.vendor?.companyBranch?.company?.owner?.mobile}');
                    },
                  ),
                  const SizedBox(width: 7),
                  KChatIconButton(
                    roomType: ChatRoomType.order,
                    room_type_id: data.id,
                    order_chat_type: 'vendor',
                    room_id: data.vendorChatId,
                  ),
                  const SizedBox(width: 7),
                  InkWell(
                    onTap: () async {
                      String url =
                          "google.navigation:q=${data.vendor?.companyBranch?.address?.longitude},${data.vendor?.companyBranch?.address?.latitude}";
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
      },
    );
  }
}
