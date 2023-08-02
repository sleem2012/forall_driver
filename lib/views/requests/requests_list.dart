import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:forall_driver/data/models/order/order_model.dart';
import 'package:forall_driver/data/models/requests/requests_union.dart';
import 'package:forall_driver/extensions.dart';
import 'package:forall_driver/logic/order/order_bloc.dart';
import 'package:forall_driver/views/requests/widgets/history_reguest_tile.dart';
import 'package:forall_driver/views/requests/widgets/pending_reguest_tile.dart';
import 'package:forall_driver/views/requests/widgets/status_reguest_tile.dart';

import '../../shared/localization/trans.dart';
import '../../shared/theme/text_theme.dart';
import 'widgets/processing_requests_tile.dart';

class PendingPreparingView extends StatelessWidget {
  final RequestsState requestsState;

  const PendingPreparingView({Key? key, required this.requestsState, required this.orders}) : super(key: key);
  final List<OrderData> orders;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await OrderBloc.of(context).getOrder();
      },
      child: orders.isEmpty
          ? Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      Tr.get.no_order,
                      style: KTextStyle.of(context).headers,
                    ),
                    10.h,
                    SvgPicture.asset('assets/images/no orders.svg'),
                  ],
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              padding: const EdgeInsets.only(top: 20, bottom: 100),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return requestsState.map(
                  pending: (value) => PendingRequestsTile(
                    tag: "pending$index",
                    data: orders[index],
                  ),
                  preparing: (value) => ProcessingRequestsTile(
                    tag: "preparing$index",
                    data: orders[index],
                  ),
                  delivery: (value) => StatusTile(
                    data: orders[index],
                  ),
                  history: (value) => HistoryRequestsTile(
                    tag: "preparing$index",
                    data: orders[index],
                  ),
                );
              },
            ),
    );
  }
}
