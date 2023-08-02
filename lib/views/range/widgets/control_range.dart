import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';

import '../../../di.dart';
import '../../../shared/theme/helper.dart';
import '../../../shared/theme/text_theme.dart';
import '../../widgets/custom_button.dart';
import '../range_cubit/range_cubit.dart';
import '../range_cubit/range_state.dart';
import '../update_range_cubit/update_range_cubit.dart';
import '../update_range_cubit/update_range_state.dart';

class ControlRangeWidget extends StatelessWidget {
  const ControlRangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final map = RangeCubit.of(context);
    return BlocBuilder<RangeCubit, RangeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: KHelper.of(context).elevatedBox,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    onPressed: () {
                      map.decreaseRange();
                    },
                    icon: const Icon(Icons.remove_circle, size: 30)),
                const SizedBox(width: 10),
                Text.rich(
                  TextSpan(
                    text: Tr.get.your_range,
                    style: KTextStyle.of(context).body,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${map.radius / 1000} ${Tr.get.km}',
                        style: KTextStyle.of(context).body2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {
                      map.increaseRadius();
                    },
                    icon: const Icon(Icons.add_circle, size: 30)),
              ]),
              BlocProvider(
                create: (context) => Di.updateRangeCubit,
                child: BlocConsumer<UpdateRangeCubit, UpdateRangeState>(
                  listener: (context, state) {
                    state.whenOrNull(
                        success: (model) =>
                            KHelper.showSnackBar(model.message ?? ''));
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => CustomBtn(
                          text: Tr.get.save,
                          onChange: () {
                            UpdateRangeCubit.of(context).updateRange(
                                map.radius.toString(),
                                (map.currentPosition?.latitude ?? 0).toString(),
                                (map.currentPosition?.longitude ?? 0)
                                    .toString());
                          }),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
