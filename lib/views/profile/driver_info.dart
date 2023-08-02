// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:forall_driver/data/models/user_info/user_model.dart';
// import 'package:forall_driver/dynamic_ui/model/dynamic_fields_union/dynamic_fields_union.dart';
// import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
// import 'package:forall_driver/shared/theme/helper.dart';
// import 'package:forall_driver/shared/theme/text_theme.dart';
// import 'package:forall_driver/views/profile/profile_widgets.dart';
// import 'package:forall_driver/views/widgets/new_bg_img.dart';
// import 'package:photo_view/photo_view.dart';
// import '../widgets/appbar.dart';
//
// class DriverInfo extends StatelessWidget {
//   const DriverInfo({Key? key, required this.userModel}) : super(key: key);
//   final UserModel userModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: const KAppBar(),
//       body: BgImg(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 95.0,right: 5,left: 5),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 ...(userModel.data?.driverAttribute ?? <DriverAttribute>[]).map((attr) {
//                   return Container(
//                     decoration: KHelper.of(context).elevatedBox,
//                     margin: const EdgeInsets.symmetric(vertical: 1),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ProfileSectionTitle(title: attr.placeholder?.capitalize ?? ''),
//                         DynamicFieldsType.fromString(attr.type).maybeWhen(
//                           orElse: () {
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
//                               child: Wrap(
//                                 spacing: 5,
//                                 children: attr.answerCollections
//                                         ?.map(
//                                           (e) => Text(
//                                             ((e.placeholder ?? '').isNotEmpty ? e.placeholder ?? "" : e.value ?? "") +
//                                                 ((attr.answerCollections?.length != 1) ? ',' : ''),
//                                             style: KTextStyle.of(context).body2,
//                                           ),
//                                         )
//                                         .toList() ??
//                                     [],
//                               ),
//                             );
//                           },
//                           imageInput: () {
//                             return Padding(
//                               padding: const EdgeInsets.all(8),
//                               child: Wrap(
//                                 spacing: 8,
//                                 children: attr.answerCollections
//                                         ?.map(
//                                           (e) => Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               if (attr.answerCollections?.length != 1)
//                                                 Padding(
//                                                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
//                                                   child: Text(e.placeholder ?? '', style: KTextStyle.of(context).hint),
//                                                 ),
//                                               ClipRRect(
//                                                 borderRadius: BorderRadius.circular(KHelper.hPadding),
//                                                 child: GestureDetector(
//                                                   onTap: () {
//                                                     Nav.to(PhotoView(imageProvider: CachedNetworkImageProvider(e.value ?? dummyNetImg)));
//                                                   },
//                                                   child: SizedBox(
//                                                     width: 100,
//                                                     height: 100,
//                                                     child: KImageWidget(imageUrl: e.value ?? dummyNetImg, fit: BoxFit.cover),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                         .toList() ??
//                                     [],
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 5),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
