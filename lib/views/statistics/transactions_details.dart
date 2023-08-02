import 'package:flutter/material.dart';
import 'package:forall_driver/views/statistics/widget/data_tile.dart';
import 'package:get/get.dart';

import '../../data/models/commission/commission_model.dart';
import '../../packages/payment/logic/get_vendor_commission/get_vendor_commission_bloc.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../../shared/theme/text_theme.dart';
import '../widgets/appbar.dart';
import '../widgets/new_bg_img.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({Key? key, required this.model}) : super(key: key);
  final CommissionModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: RefreshIndicator(
          onRefresh: () async {
            await GetVendorCommissionBloc.of(context).get();
          },
          child: BgImg(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Tr.get.payment, style: KTextStyle.of(context).title),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DataTile(title: '${Tr.get.pending} ( ${model.general?.pending?.count} )', Data: '${model.general?.pending?.amount}'),
                    const SizedBox(
                      height: 10,
                    ),
                    DataTile(title: '${Tr.get.completed} ( ${model.general?.completed?.count} )', Data: '${model.general?.completed?.amount}'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(Tr.get.commission_history, style: KTextStyle.of(context).title),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: Get.height * .1),
                      child: (model.data ?? []).isNotEmpty
                          ? ListView.separated(
                              padding: EdgeInsets.zero,
                              separatorBuilder: (BuildContext c, i) {
                                return Container(
                                  height: 5,
                                );
                              },
                              itemCount: model.data?.length ?? 0,
                              itemBuilder: (BuildContext context, index) {
                                return CommissionTile(
                                  commision: model.data?[index] ?? CommissionData(),
                                  //   commision:   CommisoinData(),
                                );
                              },
                            )
                          : Center(child: Text(Tr.get.no_commission))),
                ),
              ],
            ),
          )),
    );
  }
}

class CommissionTile extends StatelessWidget {
  final CommissionData commision;

  const CommissionTile({
    super.key,
    required this.commision,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: KHelper.of(context).fillContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                    child: Text(
                  commision.transactionDetails ?? '',
                  style: KTextStyle.of(context).body2,
                )),
                const SizedBox(
                  height: 5,
                ),
                Text(commision.createdAt?.substring(0, 10) ?? ''),
                const SizedBox(
                  height: 5,
                ),
                Text("${commision.forallAmount}  ${commision.currency}", style: KTextStyle.of(context).title3.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(Tr.get2(key: commision.state.toString(), value: [])),
            ],
          ),

          // Text(
          //   commision.state ?? '',
          //   style: KTextStyle.of(context).body,
          // ),
          // Text(
          //   "${commision.forallAmount}  ${commision.currency}",
          //   style: KTextStyle.of(context).names,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // Text(
          //   commision.createdAt ?? '',
          //   style: KTextStyle.of(context).names,
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // IconButton(
          //     onPressed: () {
          //       Get.bottomSheet(CommisoinDetails(
          //         commision: commision,
          //       ));
          //     },
          //     icon:  const Text('!',style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
