import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_bloc.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/hero_dialog/btn_to_dialog.dart';
import 'package:get/get.dart';

import '../../../shared/theme/colors.dart';
import 'cap_request_dialog.dart';

class RequestBottom extends StatelessWidget {
  const RequestBottom(
      {Key? key,
      required this.height,
      required this.onTapLocation,
      required this.opacity,
      required this.onTapDirections,
      required this.data,
      required this.onTapAccept})
      : super(key: key);
  final double height;
  final double opacity;
  final void Function() onTapLocation;
  final void Function() onTapDirections;
  final void Function() onTapAccept;
  final TripModelData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        AnimatedContainer(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)), color: KColors.of(context).elevatedBox),
          width: double.infinity,
          height: height,
          duration: const Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: CachedNetworkImageProvider(
                              data.userId?.image?.s128px ?? dummyNetImg,
                              maxHeight: Get.height.toInt(),
                            ),
                          ),
                          Text(
                            data.userId?.name ?? '',
                            style: const TextStyle(fontSize: 12),
                          ),
                          // const Text('10 min', style: TextStyle(fontSize: 12))
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KButtonToDialog(
                              kWidth: Get.width * .3,
                              dialog: CapRequestDialog(data: data.tripRoads ?? []),
                              tag: 'tag${data.id}',
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: KColors.of(context).accentColor, borderRadius: BorderRadius.circular(10)),
                                child:  Text(
                                  Tr.get.show_locations,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data.fare ?? '',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                            )

                            // const Text('\$ 15 ~ 2.2 km')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  KButton(
                    title: '${Tr.get.send_fare_with} ${data.fare}',
                    onPressed: () {
                      final fare = double.tryParse(data.fare?.split(' ').first ?? '') ?? 0;
                      ActionDialog(
                        title: '${Tr.get.send_fare_with} $fare SAR ',
                        approveAction: Tr.get.yes_message,
                        cancelAction: Tr.get.no_message,
                        onApproveClick: () {
                          GetInDriveBloc.of(context).update_order_socket(orderId: data.id, offer: fare);
                          Navigator.pop(context);
                        },
                        onCancelClick: () {
                          Navigator.pop(context);
                        },
                      ).show<void>(context);
                    },
                    hieght: Get.height / 21,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Center(child: Text(Tr.get.offer_your_fare)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) {
                        final double fare = double.tryParse(data.fare?.split(' ').first ?? '') ?? 0;
                        final fareList = [
                          fare + (fare * 2.5 / 100),
                          fare + (fare * 5 / 100),
                          fare + (fare * 7.5 / 100),
                        ];

                        return LimitedBox(
                            child: KButton(
                          title: fareList[index].toStringAsFixed(2).toString(),
                          onPressed: () {
                            final selectedFare = fareList[index];
                            ActionDialog(
                              title: '${Tr.get.send_fare_with} $selectedFare ${Tr.get.sar} ',
                              approveAction: Tr.get.yes_message,
                              cancelAction: Tr.get.no_message,
                              onApproveClick: () {
                                GetInDriveBloc.of(context).update_order_socket(orderId: data.id, offer: selectedFare);
                                Navigator.pop(context);
                              },
                              onCancelClick: () {
                                Navigator.pop(context);
                              },
                            ).show<void>(context);
                          },
                          width: 70,
                          hieght: 40,
                          // child: index == 3
                          //     ? const Icon(
                          //         Icons.edit,
                          //         color: Colors.white,
                          //       )
                          //     : null,
                        ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  KButton(
                    onPressed: () {
                      Nav.back();
                    },
                    title: Tr.get.close,
                    hieght: Get.height / 21,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
