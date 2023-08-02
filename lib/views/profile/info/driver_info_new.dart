import 'package:flutter/material.dart';
import 'package:forall_driver/extensions.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/image_widget.dart';
import 'package:forall_driver/views/widgets/photo_viewer.dart';

class DriverInfoNew extends StatefulWidget {
  const DriverInfoNew({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverInfoNew> createState() => _DriverInfoNewState();
}

class _DriverInfoNewState extends State<DriverInfoNew> {
  @override
  Widget build(BuildContext context) {
    final model = KStorage.i.getUserInfo?.data;
    final decoration = KHelper.of(context).elevatedBox.copyWith(
          color: KHelper.of(context).elevatedBox.color?.withOpacity(.5),
          borderRadius: BorderRadius.circular(8),
        );
    final width = MediaQuery.of(context).size.width;
    final driver = model?.rider?.commercial?.driver;
    final commercial = model?.rider?.commercial;
    final vehicle = model?.rider?.commercial?.vehicle;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: decoration,
                width: width,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const SizedBox(width: 100),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            (model?.name ?? '').capitalized,
                            style: KTextStyle.of(context).title3,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          DriverTitleValue(
                            title: ("${Tr.get.birthdate_} : "),
                            value: (driver?.dateOfBirth?.gregorian ?? driver?.dateOfBirth?.hijri ?? ''),
                          ),
                          const SizedBox(height: 5),
                          DriverTitleValue(
                            title: ("${Tr.get.identity} : "),
                            value: "${commercial?.identity?.value ?? ''}  -  ${commercial?.identity?.type ?? ''}",
                          ),
                          const SizedBox(height: 5),
                          DriverTitleValue(
                            title: ("${Tr.get.driver_license} : "),
                            value: "${driver?.license?.value ?? ''}  -  ${driver?.license?.type ?? ''}",
                          ),
                          const SizedBox(height: 5),
                          DriverTitleValue(
                            title: ("${Tr.get.vehicle_license} : "),
                            value: "${driver?.sequenceNumber}",
                          ),
                          const SizedBox(height: 5),
                          DriverTitleValue(
                            title: (Tr.get.role),
                            value: (Tr.get2(key: driver?.serviceType?.toLowerCase() ?? "", value: [])).capitalized,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: Tr.isAr ? null : 15,
                right: !Tr.isAr ? null : 15,
                top: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () {
                      Nav.to(KPhotoView(image: driver?.photo?.s128px ?? dummyNetImg));
                    },
                    child: KImageWidget(
                      imageUrl: driver?.photo?.s128px ?? dummyNetImg,
                      height: 100,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// Container(
          ///   decoration: decoration,
          ///   padding: const EdgeInsets.all(10),
          ///   width: width,
          ///   child: Column(
          ///     crossAxisAlignment: CrossAxisAlignment.start,
          ///     children: [
          ///       Row(
          ///         children: [
          ///           const Icon(Icons.format_align_left_sharp, size: 18),
          ///           const SizedBox(width: 10),
          ///           Text(Tr.get.rule, style: KTextStyle.of(context).title),
          ///         ],
          ///       ),
          ///       const Divider(),
          ///       Text((Tr.get2(key: driver?.serviceType?.toLowerCase() ?? "", value: [])).capitalized, style: KTextStyle.of(context).body2),
          ///     ],
          ///   ),
          /// ),

          /// const SizedBox(height: 8),
          /// Container(
          ///   decoration: decoration,
          ///   padding: const EdgeInsets.all(10),
          ///   width: width,
          ///   child: Column(
          ///     crossAxisAlignment: CrossAxisAlignment.start,
          ///     children: [
          ///       Row(
          ///         children: [
          ///           const Icon(Icons.location_on_outlined, size: 18),
          ///           const SizedBox(width: 10),
          ///           Text(Tr.get.location, style: KTextStyle.of(context).title),
          ///         ],
          ///       ),
          ///       const Divider(),
          ///       Text((model?.address?.detailedAddress ?? '').capitalized, style: KTextStyle.of(context).body2),
          ///     ],
          ///   ),
          /// ),
          const SizedBox(height: 8),
          Container(
            decoration: decoration,
            padding: const EdgeInsets.all(10),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Tr.get.license, style: KTextStyle.of(context).title),
                const Divider(),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        Nav.to(KPhotoView(image: driver?.license?.front?.s256px ?? dummyNetImg));
                      },
                      child: KImageWidget(imageUrl: driver?.license?.front?.s256px ?? dummyNetImg, width: 100),
                    ),
                    InkWell(
                      onTap: () {
                        Nav.to(KPhotoView(image: driver?.license?.back?.s256px ?? dummyNetImg));
                      },
                      child: KImageWidget(imageUrl: driver?.license?.back?.s256px ?? dummyNetImg, width: 100),
                    ),
                  ],
                ),
              ],
            ),
          ),
          8.h,
          Container(
            decoration: decoration,
            padding: const EdgeInsets.all(10),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Tr.get.criminal_certificate, style: KTextStyle.of(context).title),
                const Divider(),
                InkWell(
                  onTap: () {
                    Nav.to(KPhotoView(image: vehicle?.certificate?.criminalCase?.s256px ?? dummyNetImg));
                  },
                  child: KImageWidget(imageUrl: vehicle?.certificate?.criminalCase?.s256px ?? dummyNetImg, width: 100),
                ),
              ],
            ),
          ),
          8.h,
          Container(
            decoration: decoration,
            padding: const EdgeInsets.all(10),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Tr.get.drug_analysis, style: KTextStyle.of(context).title),
                const Divider(),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    InkWell(
                      onTap: () {
                        Nav.to(KPhotoView(image: vehicle?.certificate?.drugAnalysis?.s256px ?? dummyNetImg));
                      },
                      child: KImageWidget(imageUrl: vehicle?.certificate?.drugAnalysis?.s256px ?? dummyNetImg, width: 100),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class DriverTitleValue extends StatelessWidget {
  const DriverTitleValue({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.capitalized,
          style: KTextStyle.of(context).body2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          value.capitalized,
          style: KTextStyle.of(context).hint2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
