import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_bloc.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_state.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_bloc.dart';
import 'package:forall_driver/logic/get_commission/get_commission_bloc.dart';
import 'package:forall_driver/logic/get_commission/get_commission_state.dart';
import 'package:forall_driver/logic/update_location/update_location_bloc.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/statistics/transactions_details.dart';
import 'package:forall_driver/views/statistics/widget/bar_chart.dart';
import 'package:forall_driver/views/widgets/shimmer_box.dart';
import 'package:get/get.dart';

import '../../data/models/commission/commission_model.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';

class StaticsScreen extends StatefulWidget {
  const StaticsScreen({Key? key}) : super(key: key);

  @override
  State<StaticsScreen> createState() => _StaticsScreenState();
}

class _StaticsScreenState extends State<StaticsScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('zzzzzz${KStorage.i.getUserInfo?.data?.isOnline}');

    return BlocProvider(
      create: (context) => Di.updateUserBloc,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
        child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (isOnline) {
                UserInfoBloc.of(context).getUserInfo();
                UpdateLocationBloc.of(context).setIsOnline(isOnline);
                debugPrint('======================${isOnline.toString()}');
              },
            );
          },
          builder: (context, state) {
            final update = UpdateUserBloc.of(context);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              height: Get.height * .05,
                              KStorage.i.getUserInfo?.data?.image?.s64px ?? dummyNetImg,
                              width: Get.height * .08,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * .02,
                          ),
                          Column(
                            children: [
                              Text(
                                KStorage.i.getUserInfo?.data?.name ?? '',
                                style: KTextStyle.of(context).body2,
                              ),
                              Text(
                                Tr.get2(key: KStorage.i.getUserInfo?.data?.rider?.commercial?.driver?.serviceType ?? '', value: []),
                                style: KTextStyle.of(context).body2,
                              ),
                              // Text("Shoes - Bags", style: KTextStyle.of(context).tilePropsValues),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              update.toggleOnline();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 1.3, color: update.isOnline ? Colors.yellowAccent : Colors.red),
                              ),
                              child: AnimatedAlign(
                                duration: const Duration(milliseconds: 500),
                                alignment: update.isOnline ? Alignment.centerRight : Alignment.centerLeft,
                                curve: Curves.fastOutSlowIn,
                                child: Column(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20), color: update.isOnline ? Colors.yellowAccent : Colors.red),
                                        child: Text(
                                          update.isOnline ? Tr.get.online : Tr.get.offline,
                                          style: const TextStyle(fontSize: 10, color: Colors.black),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  BlocBuilder<GetCommissionBloc, GetVendorCommissionState>(
                    builder: (context, state) {
                      final commission = GetCommissionBloc.of(context).commissionModel;
                      return Column(
                        children: [
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(child: Text(Tr.get.activity_chart, style: KTextStyle.of(context).tileProps)),
                              InkWell(
                                onTap: () => GetCommissionBloc.of(context).pickDate(context),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: KHelper.of(context).outlineBorder,
                                  child: Text(GetCommissionBloc.of(context).selectedDate.toString().split(' ').first),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (state is GetVendorCommissionStateLoading)
                            AspectRatio(
                                aspectRatio: 1.70,
                                child: ShimmerBox(
                                  height: Get.height * .15,
                                  width: Get.width,
                                ))
                          else
                            BarChartApp(
                              dataList: GetCommissionBloc.of(context).barChartData,
                              title: '',
                              currency: GetCommissionBloc.of(context).currency,
                            ),
                          const SizedBox(height: 20),
                          Text(Tr.get.progress, style: KTextStyle.of(context).tileProps),
                          const SizedBox(height: 20),
                          if (state is GetVendorCommissionStateLoading)
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                ShimmerBox(height: Get.height * .15, width: Get.width * .3),
                                ShimmerBox(height: Get.height * .15, width: Get.width * .3),
                                ShimmerBox(height: Get.height * .15, width: Get.width * .3),
                              ],
                            )
                          else
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                CommissionCard(
                                    amount: commission?.general?.pending?.amount ?? '00.0', title: Tr.get.pending_requests, icon: Icons.pending_actions),
                                CommissionCard(
                                    amount: commission?.general?.orders?.count.toString() ?? '0', title: Tr.get.total_orders, icon: Icons.check),
                                InkWell(
                                  child: CommissionCard(
                                      amount: commission?.general?.completed?.amount ?? '00.0', title: Tr.get.total_earnings, icon: Icons.attach_money),
                                  onTap: () {
                                    Nav.to(TransactionDetailsScreen(model: commission ?? CommissionModel()));
                                  },
                                ),
                              ],
                            )
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CommissionCard extends StatelessWidget {
  const CommissionCard({Key? key, this.icon, required this.amount, this.title}) : super(key: key);
  final IconData? icon;
  final String amount;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KHelper.of(context).fillContainer,
      height: KHelper.height * .15,
      width: KHelper.width * .3,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon),
          Center(
            child: Text(
              title ?? '',
              style: KTextStyle.of(context).names,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(child: Text(amount, style: KTextStyle.of(context).body3)),
        ],
      ),
    );
  }
}
