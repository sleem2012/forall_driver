import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/auth/login/login_bloc.dart';
import 'package:forall_driver/logic/auth/login/login_state.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/packages/shared/error/error_422_model.dart';
import 'package:forall_driver/packages/shared/error/failures.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/Auth/forget_pass/forget_pass_screen.dart';
import 'package:forall_driver/views/Auth/signup/signup_screen.dart';
import 'package:forall_driver/views/main_screen/main_screen.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/icon_button.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';
import 'package:forall_driver/views/widgets/text_field.dart';
import 'package:get/get.dart';

import '../../../shared/cache/locale_storage.dart';

class LoginScreen extends StatefulWidget {
  final String? email, password;

  const LoginScreen({Key? key, this.email, this.password}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController email_ctrl;
  late TextEditingController password_ctrl;

  @override
  void initState() {
    super.initState();
    String defaultMail= KStorage.i.getDefaultMail??'';

    email_ctrl = TextEditingController(text: widget.email ?? (defaultMail.isNotEmpty?defaultMail:  ''));
    password_ctrl = TextEditingController(text: widget.password ?? '');
  }

  String? error422Text<T>(state, String key) {
    KFailure? failure = state?.maybeWhen(orElse: () => null, error: (value) => value);
    Error422Model? error422model = failure?.maybeWhen(orElse: () => null, error422: (error422model) => error422model);
    return error422model?.errors[key]?.first;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ActionDialog(
          title: Tr.get.exit_question,
          approveAction: Tr.get.yes_message,
          cancelAction: Tr.get.no_message,
          onApproveClick: () {
            Navigator.pop(context);
          },
          onCancelClick: () {
            Navigator.pop(context);
          },
        ).show<void>(context);
        return false;
      },
      child: Scaffold(
        body: BlocProvider(
          create: (context) => Di.loginBloc,
          child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
            state.whenOrNull(
              success: (userModel) async {
                // const nav = Nav;
                await Di.reset(context);
                Nav.offAll(const MainNavigationView());
              },
            );
          }, builder: (context, state) {
            final login = LoginBloc.of(context);
            return KLoadingOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              child: BgImg(
                isInputs: true,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: KHelper.hScaffoldPadding),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height / 6,
                          ),
                          Text(
                            Tr.get.welcome_back,
                            style: KTextStyle.of(context).title2,
                          ),
                          Text(
                            Tr.get.login_message,
                            style: KTextStyle.of(context).title,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Get.height / 6,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                KTextFormField(
                                  controller: email_ctrl,
                                  hintText: Tr.get.email,
                                  enabled: true,
                                  errorText: error422Text(state, 'email'),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.email_validation;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: Get.height * .025),
                                KTextFormField(
                                  obscureText: login.isVisible,
                                  controller: password_ctrl,
                                  hintText: Tr.get.password,
                                  errorText: error422Text(state, 'password'),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.pass_validation;
                                    }
                                    return null;
                                  },
                                  suffixIcon: KIconButton(
                                    child: Icon(login.isVisible ? KHelper.visibilityOff : KHelper.visibility),
                                    onPressed: () {
                                      login.togglePassV();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {
                                      Nav.to(ForgetPassScreen());
                                    },
                                    child: Text(
                                      Tr.get.forget_pass_question,
                                      style: KTextStyle.of(context).title.copyWith(color: KColors.of(context).reBackground),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height * .05),
                                CustomBtn(
                                  text: Tr.get.login,
                                  onChange: () {
                                    if (_formKey.currentState!.validate()) {
                                      FocusManager.instance.primaryFocus?.unfocus();
                                      LoginBloc.of(context).login(email: email_ctrl.text, password: password_ctrl.text);
                                    }
                                  },
                                  height: Get.height * 0.05,
                                  width: Get.width * 5,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: () {
                                      Nav.to(const SignUpScreen());
                                    },
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(text: Tr.get.dont_have_acc, style: KTextStyle.of(context).title.copyWith(color: KColors.of(context).reBackground)),
                                          TextSpan(
                                            text: Tr.get.sign_up,
                                            style: TextStyle(decoration: TextDecoration.underline, color: KColors.of(context).reBackground),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
          }),
        ),
      ),
    );
  }
}
