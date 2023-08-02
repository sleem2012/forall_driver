import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/logic/order/order_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/qr_code/qr_generator.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:get/get.dart';

class StatesCasesWithClient extends StatelessWidget {
  const StatesCasesWithClient({Key? key, required this.data}) : super(key: key);
  final OrderData data;

  @override
  Widget build(BuildContext context) {
    switch (data.state) {
      case KSlugModel.onDelivering:
        return SizedBox(
          height: 20,
          width: Get.width * .15,
          child: RawMaterialButton(
            onPressed: () {
              ActionDialog(
                title: Tr.get.arrived_to_client,
                approveAction: Tr.get.yes_message,
                cancelAction: Tr.get.no_message,
                onApproveClick: () {
                  Navigator.pop(context);
                  OrderBloc.of(context).updateOrder(
                    shipping_id: data.id ?? 0,
                    state: KSlugModel.arrivedClient,
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
                      OrderBloc.of(context).updateOrder(shipping_id: data.id ?? 0, data: data, qrClient: v, state: KSlugModel.completed);
                      Get.back(closeOverlays: true);
                    }
                  }),
                ),
                barrierDismissible: true,
                transitionDuration: const Duration(seconds: 1),
              );
            },
            fillColor: KColors.of(context).accentColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(Tr.get.scan, style: KTextStyle.of(context).editBTN),
          ),
        );

      case KSlugModel.arrivedClient:
        return SizedBox(
          height: 20,
          child: Text(Tr.get.waiting_for_client_response, style: KTextStyle.of(context).body3),
        );

      default:
        return const SizedBox();
    }
  }
}
