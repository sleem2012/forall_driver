import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/captain_view/request_details.dart';
import 'package:forall_driver/views/map/logic/location_helper.dart';
import 'package:forall_driver/views/widgets/hero_dialog/btn_to_dialog.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'cap_request_dialog.dart';

class CapRequestTile extends StatelessWidget {
  const CapRequestTile({
    Key? key,
    required this.onDismiss,
    required this.data,
  }) : super(key: key);
  final void Function() onDismiss;
  final TripModelData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Nav.to(RequestDetails(data: data));
      },
      child: Container(
        height: Get.height / 7,
        width: double.infinity,
        color: KColors.of(context).elevatedBox,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        backgroundImage: CachedNetworkImageProvider(data.userId?.image?.s64px ?? dummyNetImg, maxHeight: Get.height.toInt()),
                      ),
                      const SizedBox(height: 5,),
                      FittedBox(
                          child: Text(data.userId?.name ?? '',
                              // KStorage.i.getLocation?.longitude.toString() ?? '',
                              style: const TextStyle(fontSize: 12))),
                      // const Text('10 min', style: TextStyle(fontSize: 12))
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Fare : ${ data.min ?? ''}', style: TextStyle(color: KColors.of(context).reBackground)),
                      const SizedBox(height: 5,),

                      Text(
                          data.tripRoads!.isNotEmpty
                              ? 'Distance : ${LocationHelper.getDistance(lat2: double.parse(data.tripRoads?.first.latitude ?? ''), lon2: double.parse(data.tripRoads?.first.longitude ?? '')).toStringAsFixed(3)}km'
                              : '',
                          style: KTextStyle.of(context).body2,),
                      const SizedBox(height: 5,),

                      Row(
                        children: [
                          KButtonToDialog(
                            kWidth: Get.width * .3,
                            dialog: CapRequestDialog(data: data.tripRoads ?? []),
                            tag: 'tag${data.createdAt}',
                            child: Text(Tr.get.show_locations, style: KTextStyle.of(context).body2),
                          ),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onDismiss,
              child: Container(height: Get.height, color: KColors.of(context).accentColor, child: const Center(child: Icon(Icons.more_vert, color: Colors.white, size: 30))),
            )
          ],
        ),
      ),
    );
  }
}
