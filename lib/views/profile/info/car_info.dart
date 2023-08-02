import 'package:flutter/material.dart';
import 'package:forall_driver/extensions.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/photo_viewer.dart';

import '../../../packages/widgets/image_widget.dart';
import '../../../shared/theme/text_theme.dart';
import 'driver_info_new.dart';

class CarInfo extends StatelessWidget {
  const CarInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = KStorage.i.getUserInfo?.data;

    final plate = model?.rider?.commercial?.vehicle?.plate;
    final plateNum = '${plate?.left} ${plate?.middle} ${plate?.right} ${plate?.number}';
    final decoration = KHelper.of(context).elevatedBox.copyWith(
          color: KHelper.of(context).elevatedBox.color?.withOpacity(.5),
          borderRadius: BorderRadius.circular(8),
        );
    final width = MediaQuery.of(context).size.width;
    final vehicle = model?.rider?.commercial?.vehicle;
    final images = vehicle?.images;
    final license = vehicle?.license;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 8),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: decoration,
              width: width,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        Nav.to(KPhotoView(image: vehicle?.images?.front?.s128px ?? dummyNetImg));
                      },
                      child: KImageWidget(
                        imageUrl: vehicle?.images?.front?.s128px ?? dummyNetImg,
                        height: 100,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          (vehicle?.vehicle_name ?? '').capitalized,
                          style: KTextStyle.of(context).title3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        DriverTitleValue(
                          title: ("${Tr.get.type} : "),
                          value: "${vehicle?.vehicleType ?? ''} ",
                        ),
                        const SizedBox(height: 5),
                        DriverTitleValue(
                          title: ("${Tr.get.car_model} : "),
                          value: "${vehicle?.model}",
                        ),
                        const SizedBox(height: 5),
                        DriverTitleValue(
                          title: ("${Tr.get.car_plate} : "),
                          value: plateNum,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /// 5.h,
        /// Container(
        ///   decoration: decoration,
        ///   padding: const EdgeInsets.all(10),
        ///   width: width,
        ///   child: Column(
        ///     crossAxisAlignment: CrossAxisAlignment.start,
        ///     children: [
        ///       Row(
        ///         children: [
        ///           const Icon(Icons.announcement_outlined, size: 18),
        ///           const SizedBox(width: 10),
        ///           Text(Tr.get.car_plate, style: KTextStyle.of(context).title),
        ///         ],
        ///       ),
        ///       const Divider(),
        ///       Text((plateNum).capitalized, style: KTextStyle.of(context).body2),
        ///     ],
        ///   ),
        /// ),
        5.h,
        Container(
          decoration: decoration,
          padding: const EdgeInsets.all(10),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Tr.get.car_img, style: KTextStyle.of(context).title),
              const Divider(),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: images?.front?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: images?.front?.s256px ?? dummyNetImg, width: 100),
                  ),
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: images?.back?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: images?.back?.s256px ?? dummyNetImg, width: 100),
                  ),
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: images?.right?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: images?.right?.s256px ?? dummyNetImg, width: 100),
                  ),
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: images?.left?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: images?.left?.s256px ?? dummyNetImg, width: 100),
                  ),
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: images?.plat?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: images?.plat?.s256px ?? dummyNetImg, width: 100),
                  ),
                ],
              ),
            ],
          ),
        ),
        5.h,
        Container(
          decoration: decoration,
          padding: const EdgeInsets.all(10),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Tr.get.vehicle_license, style: KTextStyle.of(context).title),
              const Divider(),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: license?.front?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: license?.front?.s256px ?? dummyNetImg, width: 100),
                  ),
                  InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: license?.back?.s256px ?? dummyNetImg));
                    },
                    child: KImageWidget(imageUrl: license?.back?.s256px ?? dummyNetImg, width: 100),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
