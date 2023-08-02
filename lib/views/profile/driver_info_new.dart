import 'package:flutter/material.dart';
import 'package:forall_driver/extensions.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:forall_driver/views/widgets/image_widget.dart';

import '../widgets/new_bg_img.dart';

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

    final plate = model?.rider?.commercial?.vehicle?.plate;
    final plateNum = '${plate?.left} ${plate?.middle} ${plate?.right} ${plate?.number}';

    final decoration =
        KHelper.of(context).elevatedBox.copyWith(color: KHelper.of(context).elevatedBox.color?.withOpacity(.5), borderRadius: BorderRadius.circular(0));
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const KAppBar(title: ''),
      body: BgImg(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: decoration,
                    width: width,
                    height: 100,
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
                              Text(
                                (model?.email ?? '').capitalized,
                                style: KTextStyle.of(context).body3,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                (model?.mobile ?? '').capitalized,
                                style: KTextStyle.of(context).hint2,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                ' User Id :  ${(model?.id ?? ' ').toString().capitalized}',
                                style: KTextStyle.of(context).hint2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: -25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: GestureDetector(
                        onTap: () {
                          // Nav.to(
                          //   KPhotoView(image: widget.reportData.user?.image!.s512px ?? dummyNetImg),
                          // );
                        },
                        child: KImageWidget(
                          imageUrl: model?.image?.s128px ?? dummyNetImg,
                          height: 100,
                          width: 75,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.format_align_left_sharp, size: 18),
                        const SizedBox(width: 10),
                        Text('Role', style: KTextStyle.of(context).title2),
                      ],
                    ),
                    const Divider(),
                    Text((model?.type?.role ?? '').capitalized, style: KTextStyle.of(context).body2),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: decoration,
                  padding: const EdgeInsets.all(10),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 18),
                          const SizedBox(width: 10),
                          Text(Tr.get.location, style: KTextStyle.of(context).title2),
                        ],
                      ),
                      const Divider(),
                      Text((model?.address?.detailedAddress ?? '').capitalized, style: KTextStyle.of(context).body2),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.announcement_outlined, size: 18),
                        const SizedBox(width: 10),
                        Text('License', style: KTextStyle.of(context).title2),
                      ],
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(('Back').capitalized, style: KTextStyle.of(context).body2),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(model?.rider?.commercial?.driver?.license?.back?.s256px ?? dummyNetImg),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(('Front').capitalized, style: KTextStyle.of(context).body2),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(model?.rider?.commercial?.driver?.license?.back?.s256px ?? dummyNetImg),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Vehicle', style: KTextStyle.of(context).title2),
              ),
              Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.announcement_outlined, size: 18),
                        const SizedBox(width: 10),
                        Text('Photo', style: KTextStyle.of(context).title2),
                      ],
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Front', style: KTextStyle.of(context).body2),
                        const SizedBox(height: 10),
                        Image.network(model?.rider?.commercial?.vehicle?.images?.front?.s256px ?? dummyNetImg),
                        const SizedBox(height: 10),
                        Text('Back', style: KTextStyle.of(context).body2),
                        const SizedBox(height: 10),
                        Image.network(model?.rider?.commercial?.vehicle?.images?.back?.s256px ?? dummyNetImg),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.announcement_outlined, size: 18),
                        const SizedBox(width: 10),
                        Text('Model', style: KTextStyle.of(context).title2),
                      ],
                    ),
                    const Divider(),
                    Text((model?.rider?.commercial?.vehicle?.model ?? '').capitalized, style: KTextStyle.of(context).body2),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: decoration,
                padding: const EdgeInsets.all(10),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.announcement_outlined, size: 18),
                        const SizedBox(width: 10),
                        Text('Plate', style: KTextStyle.of(context).title2),
                      ],
                    ),
                    const Divider(),
                    Text((plateNum).capitalized, style: KTextStyle.of(context).body2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
