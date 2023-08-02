import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomImage extends StatelessWidget {
  const CustomImage(
      {this.imageUrl, this.height = 40, this.width, this.boxFit, Key? key})
      : super(key: key);

  final String? imageUrl;
  final double height;
  final double? width;
  final BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width??Get.width/100,
      imageUrl: imageUrl!,
      fit: boxFit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, imageURL, progress) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, imageURL, progress) => const Center(
        child: Icon(
         Icons.download_for_offline,
          color: Colors.red,
        ),
      ),
    );
  }
}
