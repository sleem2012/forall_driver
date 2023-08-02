import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:forall_driver/shared/cache/svg_caching.dart';


import 'shimmer_box.dart';

class KImageWidget extends StatelessWidget {
  const KImageWidget(
      {Key? key,
      required this.imageUrl,
      this.width,
      this.height,
      this.color,
      this.placeHolder,
      this.errorBuilder,
      this.fit})
      : super(key: key);
  final String imageUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Widget Function(
    BuildContext,
  )? placeHolder;
  final Widget Function(BuildContext)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return imageUrl.endsWith('.svg')
        ? CachedSvgImage(
            url: imageUrl,
            color: color,
            height: height,
            fit: fit,
            width: width,
            placeHolder: placeHolder,
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            color: color,
            fit: fit,

            placeholder: (context,url) {
            return  ShimmerBox(height: height,width: width,);

            },

            errorWidget: (context, url, error) {
              return Image.asset('assets/images/Logo Only.svg');
            },
            width: width,
          );
  }
}
