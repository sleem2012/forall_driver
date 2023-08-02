import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:forall_driver/logic/delivering/get_delivering_order/get_delivering_order_cubit.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:forall_driver/views/widgets/text_field.dart';

class PayDialog extends StatelessWidget {
  const PayDialog({Key? key, required this.data}) : super(key: key);
  final DeliveringOrderData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: KHelper.of(context).fillContainer,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            KTextFormField(
              hintText: Tr.get.send_price,
              controller: GetDeliveringOrderBloc.of(context).paymentCtrl,
            ),
            const SizedBox(
              height: 10,
            ),
            KButton(
              onPressed: () {
                GetDeliveringOrderBloc.of(context).updateOrder(
                  data: data,
                  OrderState: KSlugModel.paymentNeeded,
                );
                Navigator.of(context).pop();
              },
              title: Tr.get.submit,
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
