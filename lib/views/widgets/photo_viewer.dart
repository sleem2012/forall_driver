import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class KPhotoView extends StatelessWidget {
  final String image;
  const KPhotoView({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: Center(
        child: Hero(
          tag: image,
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(image),
            tightMode: true,
            backgroundDecoration: BoxDecoration(color: KColors.of(context).background),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: KColors.of(context).fabBackground,
        child: const Icon(Icons.arrow_forward, size: KHelper.iconSize, color: Colors.white),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}

