// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:convert';
//
// class SvgImageLoader {
//   static Future<SvgPicture> load(String url) async {
//     var svgString = '';
//     if (url.startsWith('http')) {
//       svgString = await DefaultCacheManager().getSingleFile(url).then((file) => file.readAsString()).catchError((error) => print(error));
//     } else if (url.startsWith('file://')) {
//       final file = await DefaultCacheManager().getFileFromCache(url);
//       final bytes = await file?.file.readAsBytes();
//       svgString = utf8.decode(bytes?.toList());
//     } else if (url.startsWith('data:')) {
//       final bytes = base64.decode(url.substring(url.indexOf(',') + 1));
//       svgString = utf8.decode(bytes);
//     } else {
//       // Handle other URL schemes
//     }
//     return SvgPicture.string(svgString);
//   }
// }
//
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// import 'package:flutter/services.dart';
/// import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/views/widgets/shimmer_box.dart';


class CachedSvgImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Widget Function(BuildContext)? placeHolder;

  const CachedSvgImage(
      {Key? key,
      required this.url,
      this.width,
      this.height,
      this.placeHolder,
      this.color,
      this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      fit: fit ?? BoxFit.contain,
      width: width,
      height: height,
      color: color,
      placeholderBuilder: (context) {
        return  ShimmerBox(height: height,width: width,);
      },
    );

    /// return SvgPicture(
    ///   AdvancedNetworkSvg(
    ///     url,
    ///     (theme) {
    ///       return (bytes, colorFilter, key) {
    ///         return svg.svgPictureDecoder(
    ///           bytes ?? Uint8List.fromList(const []),
    ///           false,
    ///           colorFilter,
    ///           key,
    ///           theme: const SvgTheme(currentColor: KColors.textL, xHeight: 20),
    ///         );
    ///       };
    ///     },
    ///     useDiskCache: true,
    ///     loadFailedCallback: () {
    ///       return SvgPicture.asset(
    ///         'assets/images/Logo Only.svg',
    ///         fit: BoxFit.contain,
    ///         width: 24,
    ///         height: 24,
    ///         color: KColors.textL,
    ///         theme: const SvgTheme(currentColor: KColors.textL, xHeight: 20),
    ///       );
    ///     },
    ///   ),
    ///   width: width,
    ///   height: height,
    ///   placeholderBuilder: placeHolder,
    ///   theme: const SvgTheme(currentColor: KColors.textL, xHeight: 20),
    /// );
  }
}
