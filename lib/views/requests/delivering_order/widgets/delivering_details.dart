import 'package:flutter/material.dart';
import 'package:forall_driver/packages/shared/picker/view/static_map_view.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/models/order/get_delivering_order_model.dart';

class DeliveringDetails extends StatelessWidget {
  const DeliveringDetails({Key? key, required this.orderData}) : super(key: key);
  final DeliveringOrderData orderData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                Tr.get.order_details,
                style: KTextStyle.of(context).title2,
                textAlign: TextAlign.center,
              )),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.my_location, size: 25),
              const SizedBox(width: 7),
              Expanded(child: Text(orderData.source?.detailedAddress ?? '', style: KTextStyle.of(context).title3)),
            ],
          ),
          const SizedBox(height: 10),
          MapStaticView(
              latLng: LatLng(
            double.tryParse(orderData.source?.latitude ?? '0') ?? 0,
            double.tryParse(orderData.source?.longitude ?? '0') ?? 0,
          )),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined, size: 25),
              Expanded(child: Text(orderData.destination?.detailedAddress ?? '', style: KTextStyle.of(context).title3)),
            ],
          ),
          const SizedBox(width: 7),
          const SizedBox(height: 10),
          MapStaticView(
              latLng: LatLng(
            double.tryParse(orderData.destination?.latitude ?? '0') ?? 0,
            double.tryParse(orderData.destination?.longitude ?? '0') ?? 0,
          )),
          const SizedBox(height: 15),
          Text(Tr.get.note),
          const SizedBox(height: 10),
          Text(
            orderData.userNote ?? '',
            style: KTextStyle.of(context).title3,
          )
        ],
      ),
    );
  }
}
