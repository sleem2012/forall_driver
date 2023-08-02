import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';

import 'package:get/get.dart';

class CapRequestDialog extends StatelessWidget {
  const CapRequestDialog({Key? key, required this.data}) : super(key: key);

  final List<TripRoads> data;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
          width: Get.width,
          decoration: KHelper.of(context).elevatedBox.copyWith(color: KColors.of(context).background),
          child: ListView.separated(
              separatorBuilder: (BuildContext context, i) => const SizedBox(height: 15),
              padding: const EdgeInsets.symmetric(vertical: KHelper.hPadding),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
                  decoration: KHelper.of(context).elevatedBox,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: CircleAvatar(
                              radius: Get.height * .018,
                              backgroundColor: KColors.of(context).accentColor,
                              child: Text(
                                List.generate(26, (i) {
                                  return String.fromCharCode(i + 65);
                                })[index],
                                style: TextStyle(color: KColors.of(context).background),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data[index].name ?? '',
                                    style: KTextStyle.of(context).names,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
