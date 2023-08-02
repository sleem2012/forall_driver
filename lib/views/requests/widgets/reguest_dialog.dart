import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/order/order_model.dart';
import '../../../data/models/order/shipment_type.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import 'key_value_text.dart';

String getDateTitle(ServiceType? features, bool isFrom) {
  return features!.maybeWhen(
    shopping: () => Tr.get.delivered_at,
    ticketing: () => isFrom ? Tr.get.from : Tr.get.to,
    service: () => isFrom ? Tr.get.start : Tr.get.end,
    carrying: () => isFrom ? Tr.get.pickup_date : Tr.get.dropDown,
    orElse: () => Tr.get.delivered_at,
  );
}

class RequestDialog extends StatelessWidget {
  const RequestDialog({
    Key? key,
    this.isPending = false,
    this.isHistory = false,
    this.isPreparing = false,
    required this.data,
    this.hide = true,
  }) : super(key: key);
  final bool isHistory;
  final bool? isPending;
  final bool? isPreparing;
  final bool? hide;
  final OrderData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: KHelper.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
            child: Text(Tr.get.products, style: KTextStyle.of(context).body),
          ),
          const SizedBox(height: 10),
          ...(data.shippingContent?.items ?? []).map((item) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: KHelper.of(context).elevatedBox.copyWith(color: KColors.of(context).background),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 48,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white,
                              backgroundImage: CachedNetworkImageProvider(
                                item.images?.firstOrNull?.s128px ?? dummyNetImg,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.name ?? '',
                                    style: KTextStyle.of(context).names,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(child: KeyValueText(title: "${Tr.get.qTY}: ", value: item.quantity.toString())),
                                ],
                              ),
                              Row(
                                children: [
                                  if (item.productSize != null)
                                    Expanded(child: KeyValueText(title: "${Tr.get.size}: ", value: item.productSize?.name?.value ?? '')),
                                  if (item.productColor != null)
                                    Expanded(child: KeyValueText(title: "${Tr.get.color}: ", value: item.productColor?.name?.value ?? '')),
                                ],
                              ),
                              if (item.note != null) KeyValueText(title: Tr.get.note, value: item.note ?? ''),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
          if (hide ?? false)
            Container(
              margin: const EdgeInsets.all(10),
              decoration: KHelper.of(context).elevatedBox.copyWith(color: KColors.of(context).background),
              padding: const EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(Tr.get.commission, style: KTextStyle.of(context).title2),
                Text(
                  '${data.shippingProviderContent?.rider_commission_nett.toString() ?? ''} ${Tr.get2(key: data.currency?.toLowerCase() ?? '', value: [])}',
                ),
              ]),
            )
        ],
      ),
    );
  }
}
