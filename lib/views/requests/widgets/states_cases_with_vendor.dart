import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/logic/order/order_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/qr_code/qr_generator.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:get/get.dart';

class StatesCasesWithVendor extends StatelessWidget {
  const StatesCasesWithVendor({Key? key, required this.data}) : super(key: key);
  final OrderData data;

  @override
  Widget build(BuildContext context) {
    switch (data.state) {
      case KSlugModel.onWay:
        return SizedBox(
          height: 20,
          width: Get.width * .15,
          child: RawMaterialButton(
            onPressed: () {
              ActionDialog(
                title: Tr.get.arrived_to_vendor,
                approveAction: Tr.get.yes_message,
                cancelAction: Tr.get.no_message,
                onApproveClick: () {
                  Navigator.pop(context);
                  OrderBloc.of(context).updateOrder(
                    shipping_id: data.id ?? 0,
                    state: KSlugModel.arrivedVendor,
                    data: data,
                  );
                },
                onCancelClick: () {
                  Navigator.pop(context);
                },
              ).show<void>(context);
            },
            fillColor: KColors.of(context).accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(Tr.get.arrived, style: KTextStyle.of(context).editBTN),
          ),
        );
      case KSlugModel.riderVerifyCode:
        return SizedBox(
          height: 20,
          width: Get.width * .15,
          child: RawMaterialButton(
            onPressed: () {
              Get.dialog(QRScanner(onDataCallback: (v) {
                if (v != null) {
                  OrderBloc.of(context).updateOrder(shipping_id: data.id ?? 0, data: data, qrVendor: v, state: KSlugModel.onDelivering);
                  Get.back(closeOverlays: true);
                }
              }), barrierDismissible: true, transitionDuration: const Duration(seconds: 1));
            },
            fillColor: KColors.of(context).accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(Tr.get.scan, style: KTextStyle.of(context).editBTN),
          ),
        );

      case KSlugModel.arrivedVendor:
        return Container(
          decoration: KHelper.of(context).freeShiping.copyWith(borderRadius: BorderRadius.circular(5), color: KColors.of(context).accentColor),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            height: 20,
            child: Center(child: Text(Tr.get.waiting_for_vendor, style: KTextStyle.of(context).editBTN)),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
