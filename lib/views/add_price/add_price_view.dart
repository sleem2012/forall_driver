import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/update_price/update_price_cubit.dart';
import 'package:forall_driver/logic/update_price/update_price_state.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';
import 'package:forall_driver/views/widgets/text_field.dart';

import '../../shared/theme/helper.dart';

class AddPriceView extends StatelessWidget {
  AddPriceView({Key? key}) : super(key: key);

  final _Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.updatePriceCubit..setInitial(KStorage.i.getPrice),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar:  KAppBar(title: Tr.get.add_your_prices,needsPop: true),
        body: BgImg(
          child: BlocListener<UpdatePriceCubit, UpdatePriceState>(
            listener: (context, state) {
              state.whenOrNull(
                  success: (model) =>
                      KHelper.showSnackBar(model.message ?? ''));
            },
            child: BlocBuilder<UpdatePriceCubit, UpdatePriceState>(
              builder: (context, state) {
                final price = UpdatePriceCubit.of(context);
                return KLoadingOverlay(
                  isLoading: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 95),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _Key,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomBtn(
                                    width: 100,
                                      height: 50,
                                      onChange:  (){
                                    if (!_Key.currentState!.validate()) {
                                      return;
                                    } else {
                                      price.UpdatePrice();
                                    }
                                  }, text:Tr.get.save ),
                                ],
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  // shrinkWrap: true,
                                  children: [
                                    Text(Tr.get.t15_min,
                                        style: KTextStyle.of(context).body),
                                    const SizedBox(height: 10),
                                    PriceInput(
                                        controller: price.price15Ctrl,
                                        hint: Tr.get.t15_min),
                                    const SizedBox(height: 10),
                                    Text(Tr.get.t30_min,
                                        style: KTextStyle.of(context).body),
                                    const SizedBox(height: 10),
                                    PriceInput(
                                        controller: price.price30Ctrl,
                                        hint: Tr.get.t30_min),
                                    const SizedBox(height: 10),
                                    Text(Tr.get.t45_min,
                                        style: KTextStyle.of(context).body),
                                    const SizedBox(height: 10),
                                    PriceInput(
                                        controller: price.price45Ctrl,
                                        hint: Tr.get.t45_min),
                                    const SizedBox(height: 10),
                                    Text(Tr.get.t60_min,
                                        style: KTextStyle.of(context).body),
                                    const SizedBox(height: 10),
                                    PriceInput(
                                        controller: price.price60Ctrl,
                                        hint: Tr.get.t60_min),
                                    const SizedBox(height: 20),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PriceInput extends StatelessWidget {
  const PriceInput({Key? key, required this.controller, required this.hint})
      : super(key: key);
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return KTextFormField(
      controller: controller,
      hintText: hint,
      formatter: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: const TextInputType.numberWithOptions(),
      validator: (String? value) {
        if (value!.isEmpty) {
          return Tr.get.field_required;
        } else {
          return null;
        }
      },
    );
  }
}
