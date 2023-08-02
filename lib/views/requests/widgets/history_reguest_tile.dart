import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:get/get.dart';

import '../../widgets/relative_date_time.dart';

class HistoryRequestsTile extends StatelessWidget {
  const HistoryRequestsTile({Key? key, required this.tag, required this.data}) : super(key: key);
  final String tag;
  final OrderData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
          padding: const EdgeInsets.all(KHelper.hPadding),
          width: Get.width,
          height: Get.height * .15,
          decoration: KHelper.of(context).elevatedBox,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  width: Get.width * .6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
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
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${data.vendor?.company?.name?.value ?? ''}   # ${data.id?.toString()}",
                                  style: KTextStyle.of(context).body2,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * .18,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              backgroundImage: CachedNetworkImageProvider(
                                data.orderUser?.image?.s128px ?? dummyNetImg,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.orderUser?.name ?? '',
                                  style: KTextStyle.of(context).tilePropsValues,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height,
                width: Get.width * .2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(Tr.get2(key: data.state ?? "", value: []), style: KTextStyle.of(context).body2),
                    RelativeDateTimeWidget(
                      dateTime: DateTime.tryParse(data.updated_at ?? "") ?? DateTime.now(),
                      textStyle: KTextStyle.of(context).hint,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
