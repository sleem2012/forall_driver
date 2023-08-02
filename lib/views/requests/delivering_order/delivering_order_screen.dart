import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/logic/delivering/get_delivering_order/get_delivering_order_state.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/requests/delivering_order/widgets/order_list.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:get/get.dart';

import '../../../logic/delivering/get_delivering_order/get_delivering_order_cubit.dart';
import '../../../shared/localization/trans.dart';

class DeliveringOrderScreen extends StatefulWidget {
  const DeliveringOrderScreen({Key? key}) : super(key: key);

  @override
  State<DeliveringOrderScreen> createState() => _DeliveringOrderScreenState();
}

class _DeliveringOrderScreenState extends State<DeliveringOrderScreen> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  KSlugModel? selectedTab = KSlugModel.DeliveringOrderState.firstOrNull;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDeliveringOrderBloc, GetDeliveringOrderState>(
      builder: (context, state) {
        final delivering = GetDeliveringOrderBloc.of(context);
        debugPrint(delivering.statusOrder()?.length.toString());
        return KLoadingOverlay(
            isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
            child: Column(
              children: [
                TabBar(
                  onTap: (i) {
                    setState(() {
                      selectedTab = KSlugModel.DeliveringOrderState[i];
                    });
                  },
                  indicatorColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: Get.height / 50, vertical: 15),
                  controller: tabController,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  tabs: KSlugModel.DeliveringOrderState.map(
                    (e) => Row(
                      children: [
                        Expanded(
                            child: Text(
                          e.translated,
                          style: e != selectedTab ? KTextStyle.of(context).body3 : KTextStyle.of(context).title3,
                          textAlign: TextAlign.center,
                        )),
                        if (e.translated != Tr.get.history)
                          Container(
                            width: 2,
                            height: 20,
                            color: KColors.accentColorD,
                          )
                      ],
                    ),
                  ).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      DeliveringOrderList(data: delivering.newOrders() ?? []),
                      DeliveringOrderList(data: delivering.statusOrder() ?? []),
                      DeliveringOrderList(data: delivering.historyOrder() ?? []),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
