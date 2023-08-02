import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/dynamic_ui/view/dynamic_ui_view.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/views/main_screen/main_screen.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';

import '../../../logic/delivery_attributes/add/add_delivery_attr_bloc.dart';
import '../../../logic/delivery_attributes/add/add_delivery_attr_state.dart';
import '../../../logic/delivery_attributes/get/delivery_attributes_bloc.dart';
import '../../../logic/delivery_attributes/get/delivery_attributes_state.dart';
import '../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';

class DeliveryAttrView extends StatelessWidget {
  const DeliveryAttrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.deliveryAttributesBloc..get()),
        BlocProvider(create: (context) => Di.addDeliveryAttrBloc),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const KAppBar(showAct: false),
        body: BgImg(
          child: Padding(
            padding: const EdgeInsets.only(top: 95),
            child: BlocBuilder<DeliveryAttributesBloc, DeliveryAttributesState>(
              builder: (context, state) {
                return KRequestOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  error: state.maybeWhen(orElse: () => null, error: (e) => KFailure.toError(e)),
                  onTryAgain: DeliveryAttributesBloc.of(context).get,
                  child: state is DeliveryAttributesStateSuccess
                      ? BlocConsumer<AddDeliveryAttrBloc, AddDeliveryAttrState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              success: () {
                                NavEnforcerBloc.of(context).checkUser(destination: const MainNavigationView());
                              },
                            );
                          },
                          builder: (context, addStates) {
                            return KLoadingOverlay(
                              isLoading: addStates.maybeWhen(orElse: () => false, loading: () => true),
                              child: DynamicUi(
                                padding: const EdgeInsets.all(20),
                                fields: state.maybeWhen(orElse: () => [], success: (l) => l),
                                failure: addStates.maybeWhen(orElse: () => null, error: (f) => f),
                                submitTitle: Tr.get.subscribe,
                                onConfirm: (values, answer_col, grouped_a_col) {
                                  AddDeliveryAttrBloc.of(context).add(answer_col);
                                },
                              ),
                            );
                          },
                        )
                      : const SizedBox(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
