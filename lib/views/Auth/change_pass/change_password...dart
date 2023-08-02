import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/auth/change_pass/change_pass_cubit.dart';
import 'package:forall_driver/logic/auth/change_pass/change_pass_state.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/icon_button.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';
import 'package:forall_driver/views/widgets/on_success_view.dart';
import 'package:forall_driver/views/widgets/text_field.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.changePass,
      child: BlocConsumer<ChangePassCubit, ChangePassState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => OnSuccessView(msg: Tr.get.pass_change_success),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          final pass = ChangePassCubit.of(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: KAppBar(
              needsPop: true,
              title: Tr.get.change_password,
            ),
            body: BgImg(
              isInputs: true,
              child: Padding(
                padding: const EdgeInsets.only(top: 95),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: KLoadingOverlay(
                    isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Text(
                              Tr.get.change_password,
                              style: KTextStyle.of(context).title2,
                            ),
                            const SizedBox(height: 50),
                            KTextFormField(
                              obscureText: pass.isVisible,
                              controller: pass.currentPassController,
                              hintText: Tr.get.current_password,
                              suffixIcon: KIconButton(
                                radius: 10,
                                child: Icon(pass.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                onPressed: () {
                                  pass.togglePassV();
                                },
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.pass_validation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            KTextFormField(
                              obscureText: pass.isVisible,
                              controller: pass.newPassController,
                              hintText: Tr.get.new_pass,
                              suffixIcon: KIconButton(
                                radius: 10,
                                child: Icon(pass.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                onPressed: () {
                                  pass.togglePassV();
                                },
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.pass_validation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            KTextFormField(
                              obscureText: pass.isVisible,
                              controller: pass.confirmPassController,
                              hintText: Tr.get.confirm_password,
                              suffixIcon: KIconButton(
                                radius: 10,
                                child: Icon(pass.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                onPressed: () {
                                  pass.togglePassV();
                                },
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return Tr.get.confirm_password_validation;
                                }
                                if (value != pass.newPassController.text) {
                                  return Tr.get.confirm_password_matching_validation;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 50),
                            CustomBtn(
                              text: Tr.get.change_password,
                              onChange: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  pass.changePass();
                                }
                              },
                              width: Get.width * .7,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
