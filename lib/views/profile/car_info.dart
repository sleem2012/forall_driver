//
// import 'package:flutter/material.dart';
// import 'package:forall_driver/shared/localization/trans.dart';
//
// import 'package:forall_driver/views/widgets/custom_button.dart';
// import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
// import 'package:forall_driver/views/widgets/pick_image_widget.dart';
// import 'package:forall_driver/views/widgets/text_field.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// class CarInfo extends StatelessWidget {
//   const CarInfo({Key? key}) : super(key: key);
//
//   static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: const KAppBar(needsPop: true, title: 'Change passworrd'),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: KLoadingOverlay(
//           isLoading: false,
//           child: Center(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                    const SizedBox(height: 50),
//                   Center(
//                     child:PickImageWidget(onSelect: (file) {
//
//                     }, hint: '',),
//                   ),
//                   const SizedBox(height: 50),
//                   KTextFormField(
//
//                     hintText: Tr.get.car_model,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return Tr.get.car_model_validation;
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   KTextFormField(
//
//                     hintText: Tr.get.model_year,
//
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return Tr.get.model_year_validation;
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   KTextFormField(
//
//                     hintText: Tr.get.car_color,
//
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return Tr.get.car_color_validation;
//                       }
//
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 50),
//                   KButton(
//                     title: Tr.get.done,
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         FocusManager.instance.primaryFocus?.unfocus();
//                       }
//                     },
//                     width: Get.width * .7,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
