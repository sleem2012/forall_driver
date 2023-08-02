import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/data/models/order/get_delivering_order_model.dart';
import 'package:forall_driver/logic/delivering/get_delivering_order/get_delivering_order_cubit.dart';
import 'package:forall_driver/views/requests/delivering_order/widgets/order_tile.dart';

class DeliveringOrderList extends StatelessWidget {
  const DeliveringOrderList({Key? key, required this.data}) : super(key: key);
  final List<DeliveringOrderData> data;

  @override
  Widget build(BuildContext context) {
    debugPrint('======================================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${data.length.toString()}');
    return SizedBox(
      height: double.infinity,
      child: RefreshIndicator(
        onRefresh: () async {
          await GetDeliveringOrderBloc.of(context).getDeliveringOrders();
        },
        child: data.isEmpty
            ? Center(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SvgPicture.asset('assets/images/no orders.svg'),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.only(bottom: 100, right: 10, left: 10, top: 10),
                itemBuilder: (context, i) => DeliveringOrderTile(orderData: data[i]),
                separatorBuilder: (context, i) => const SizedBox(height: 20),
                itemCount: data.length,
              ),
      ),
    );
  }
}
