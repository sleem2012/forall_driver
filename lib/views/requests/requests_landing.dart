import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/requests/requests_union.dart';
import 'package:forall_driver/logic/order/order_bloc.dart';
import 'package:forall_driver/logic/order/order_state.dart';
import 'package:forall_driver/packages/extensions.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/views/requests/requests_list.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';

class RequestsLanding extends StatefulWidget {
  const RequestsLanding({Key? key}) : super(key: key);

  @override
  State<RequestsLanding> createState() => _RequestsLandingState();
}

class _RequestsLandingState extends State<RequestsLanding> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);

  List<String> tabs = [
    Tr.get.pending_requests,
    Tr.get.processing_request,
    Tr.get.status_request,
    Tr.get.history_requests,
  ];
  String? selectedTab;

  @override
  void initState() {
    selectedTab = tabs.firstOrNull;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final order = OrderBloc.of(context);

        return KLoadingOverlay(
          isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
          child: DefaultTabController(
            length: tabs.length,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: KHelper.height / 50, vertical: 15),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  labelStyle: KTextStyle.of(context).body3.B,
                  labelColor: KTextStyle.of(context).body3.color,
                  unselectedLabelStyle: KTextStyle.of(context).body3,
                  unselectedLabelColor: KTextStyle.of(context).body3.color,
                  tabs: [
                    Row(
                      children: [
                        Expanded(child: Text("${Tr.get.pending_requests} ( ${order.pendingOrders.length} ) ", textAlign: TextAlign.center)),
                        Container(width: 1, height: 20, color: KColors.accentColorD),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("${Tr.get.processing_request} ( ${order.preparingOrders.length} ) ", textAlign: TextAlign.center)),
                        Container(width: 1, height: 20, color: KColors.accentColorD),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("${Tr.get.status_request} ( ${order.deliveryOrders.length} ) ", textAlign: TextAlign.center)),
                        Container(width: 1, height: 20, color: KColors.accentColorD),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text("${Tr.get.history_requests} ( ${order.completedOrders.length} ) ", textAlign: TextAlign.center)),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      PendingPreparingView(requestsState: const RequestsState.pending(), orders: order.pendingOrders),
                      PendingPreparingView(requestsState: const RequestsState.preparing(), orders: order.preparingOrders),
                      PendingPreparingView(requestsState: const RequestsState.delivery(), orders: order.deliveryOrders),
                      PendingPreparingView(requestsState: const RequestsState.history(), orders: order.completedOrders),

                      /// PendingPreparingView(requestsState: const RequestsState.pending(), orders: order.pendingOrders),
                      /// PendingPreparingView(requestsState: const RequestsState.preparing(), orders: order.preparingOrders),
                      /// PendingPreparingView(requestsState: const RequestsState.delivery(), orders: order.deliveryOrders),
                      /// PendingPreparingView(requestsState: const RequestsState.history(), orders: order.completedOrders),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
