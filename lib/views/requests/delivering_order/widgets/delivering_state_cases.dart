import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:forall_driver/logic/delivering/get_delivering_order/get_delivering_order_cubit.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/qr_code/qr_generator.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/helper.dart';
import 'pay_dialog.dart';

class DeliveringStateCases extends StatelessWidget {
  const DeliveringStateCases({Key? key, required this.data}) : super(key: key);
  final DeliveringOrderData data;

  @override
  Widget build(BuildContext context) {
    switch (data.state) {
      case KSlugModel.pending:
        return Column(
          children: [
            SizedBox(
              width: 70,
              height: 20,
              child: RawMaterialButton(
                onPressed: () {
                  KHelper.showCustomBottomSheet(PayDialog(
                    data: data,
                  ));
                },
                fillColor: KColors.of(context).trackColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  Tr.get.send_price,
                  style: KTextStyle.of(context).editBTN.copyWith(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 70,
              height: 20,
              child: RawMaterialButton(
                onPressed: () {
                  ActionDialog(
                    title: Tr.get.free,
                    approveAction: Tr.get.yes_message,
                    cancelAction: Tr.get.no_message,
                    onApproveClick: () {
                      Navigator.pop(context);
                      GetDeliveringOrderBloc.of(context).updateOrder(data: data, OrderState: KSlugModel.onDelivering);
                    },
                    onCancelClick: () {
                      Navigator.pop(context);
                    },
                  ).show<void>(context);
                },
                fillColor: KColors.of(context).accentColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  Tr.get.free,
                  style: KTextStyle.of(context).editBTN.copyWith(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      case KSlugModel.paymentNeeded:
        return SizedBox(
          height: 20,
          width: Get.width * .25,
          child: FittedBox(child: Text(Tr.get.waiting_for_client_response, style: KTextStyle.of(context).names)),
        );
      case KSlugModel.onDelivering:
        return SizedBox(
          height: 20,
          width: Get.width * .15,
          child: RawMaterialButton(
            onPressed: () {
              ActionDialog(
                title: Tr.get.arrived,
                approveAction: Tr.get.yes_message,
                cancelAction: Tr.get.no_message,
                onApproveClick: () {
                  Navigator.pop(context);
                  GetDeliveringOrderBloc.of(context).updateOrder(data: data, OrderState: KSlugModel.arrivedClient);
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
      case KSlugModel.completedCode:
        return SizedBox(
          height: 20,
          width: Get.width * .15,
          child: RawMaterialButton(
            onPressed: () {
              Get.dialog(
                  SizedBox(
                    height: Get.height * .5,
                    width: Get.width,
                    child: QRScanner(onDataCallback: (v) {
                      if (v != null) {
                        GetDeliveringOrderBloc.of(context).updateOrder(data: data, OrderState: KSlugModel.completed);
                        Get.back(closeOverlays: true);
                      }
                    }),
                  ),
                  barrierDismissible: true,
                  transitionDuration: const Duration(seconds: 1));
            },
            fillColor: KColors.of(context).accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(Tr.get.scan, style: KTextStyle.of(context).editBTN),
          ),
        );

      case KSlugModel.arrivedClient:
        return SizedBox(
          height: 20,
          width: Get.width * .17,
          child: FittedBox(child: Text(Tr.get.waiting_for_client_response, style: KTextStyle.of(context).names)),
        );
      default:
        return Text(
          data.state ?? '',
          style: const TextStyle(fontSize: 9),
        );
    }
  }
}
