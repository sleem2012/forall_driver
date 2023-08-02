import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/app.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/auth/logout/logout_bloc.dart';
import 'package:forall_driver/logic/auth/logout/logout_state.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_bloc.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_state.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_bloc.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_state.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/packages/payment/view/payment_view.dart';
import 'package:forall_driver/packages/shared/api_client/endpoints.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/Auth/change_pass/change_password...dart';
import 'package:forall_driver/views/Auth/login/login_screen.dart';
import 'package:forall_driver/views/profile/profile_widgets.dart';
import 'package:forall_driver/views/profile/update_profile.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/icon_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'info/info_tap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await UserInfoBloc.of(context).getUserInfo();
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 100),
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            final user = UserInfoBloc.of(context).user;
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                      user?.data?.image?.s128px?.toString() ?? dummyNetImg,
                    ),
                  ),
                  title: Text(
                    "${user?.data?.name}",
                    style: KTextStyle.of(context).names,
                  ),
                  subtitle: Text("${Tr.get.your_id.toString()}: ${user?.data?.id.toString()}", style: KTextStyle.of(context).tilePropsValues),
                  trailing: KIconButton(
                    child: const Icon(Icons.edit),
                    onPressed: () {
                      Nav.to(const UpdateProfile());
                    },
                  ),
                ),

                /// Card(
                ///   margin: EdgeInsets.zero,
                ///   elevation: 5,
                ///   color: KColors.of(context).fillContainer,
                ///   child: Padding(
                ///     padding: const EdgeInsets.symmetric(vertical: 5),
                ///     child: ProfileTile(
                ///         leading: KHelper.person,
                ///         title: '${Tr.get.your_balance}:',
                ///         traling: Text('${user?.data?.earning?.toString()}', style: KTextStyle.of(context).body2)),
                ///   ),
                /// ),
                ProfileSectionTitle(title: Tr.get.my_account),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).fillContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        ProfileTile(
                          leading: KHelper.phone,
                          title: Tr.get.phone_number,
                          traling: Text('${user?.data?.mobile}', style: KTextStyle.of(context).body3),
                        ),
                        ProfileTile(
                          leading: KHelper.email,
                          title: Tr.get.business_email,
                          traling: Text('${user?.data?.email}', style: KTextStyle.of(context).body3),
                        ),
                        ProfileTile(
                          leading: KHelper.location,
                          title: Tr.get.region,
                          traling: Text(
                            '${user?.data?.address?.cityId?.countryId?.name?.value} , ${user?.data?.address?.cityId?.name?.value}',
                            style: KTextStyle.of(context).body3,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        ProfileTile(
                          leading: KHelper.person,
                          title: Tr.get.info,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () {
                            Nav.to(const InfoTab());
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.payment,
                          title: Tr.get.payment_information,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () {
                            Nav.to(const PaymentView());
                          },
                        ),

                        /// ProfileTile(
                        ///   leading: KHelper.list,
                        ///   title: Tr.get.category,
                        ///   traling: Text('${user?.data?.category?.name?.value}', style: KTextStyle.of(context).body3),
                        /// ),
                        ProfileTile(
                          leading: KHelper.passworrd,
                          title: Tr.get.change_password,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () => Nav.to(const ChangePassword()),
                        ),
                        BlocProvider(
                          create: (context) => Di.updateUserBloc,
                          child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                success: (s) {
                                  Nav.offAll(const LoginScreen());
                                  KStorage.i.delToken;
                                  KStorage.i.delUserInfo;
                                },
                              );
                            },
                            builder: (context, state) {
                              return ProfileTile(
                                leading: Icons.person_remove_outlined,
                                title: Tr.get.deactivate_account,
                                traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                                onTap: () {
                                  ActionDialog(
                                    title: state.maybeWhen(orElse: () => Tr.get.deactivate_account, loading: () => Tr.get.loading),
                                    approveAction: Tr.get.yes_message,
                                    cancelAction: Tr.get.no_message,
                                    onApproveClick: () async {
                                      Navigator.pop(context);
                                      UpdateUserBloc.of(context).blockAccount;
                                      UpdateUserBloc.of(context).update();
                                    },
                                    onCancelClick: () {
                                      Navigator.pop(context);
                                    },
                                  ).show<void>(context);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ProfileSectionTitle(title: Tr.get.my_settings),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).fillContainer,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        ProfileTile(
                          leading: KHelper.terms,
                          title: Tr.get.terms_and_conditions,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () {
                            final url = KStorage.i.getSettings?.data?.first.termsContent?.rider;
                            debugPrint('================= $url : ');
                            if (url != null) {
                              launchUrlString(
                                url,
                                webViewConfiguration: const WebViewConfiguration(
                                  headers: {"Content-Type": "application/pdf"},
                                ),
                              );
                            }
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.privacyPolicy,
                          title: Tr.get.privacy_policy,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () {
                            final String? url = KStorage.i.getSettings?.data?.first.privacyContent?.rider;
                            debugPrint('================= $url : ');
                            if (url != null) {
                              launchUrlString(
                                url,
                                webViewConfiguration: const WebViewConfiguration(
                                  headers: {"Content-Type": "application/pdf"},
                                ),
                              );
                            }
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.help,
                          title: Tr.get.help,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            String? encodeQueryParameters(Map<String, String> params) {
                              return params.entries
                                  .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                  .join('&');
                            }

                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'support@forallfa.com',
                              query: encodeQueryParameters(<String, String>{'subject': 'I need Help , Please Contact Me'}),
                            );
                            launchUrl(emailLaunchUri);
                          },
                        ),
                        ProfileTile(
                          leading: KHelper.share,
                          title: Tr.get.share,
                          traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                          onTap: () async {
                            shareTheApp(
                              context,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: EdgeInsets.zero,
                  elevation: 5,
                  color: KColors.of(context).fillContainer,
                  child: BlocConsumer<LogoutBloc, LogoutState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Wrapper()));
                        },
                      );
                    },
                    builder: (context, state) {
                      return ProfileTile(
                        leading: KHelper.logout,
                        title: state.maybeWhen(orElse: () => Tr.get.log_out, loading: () => Tr.get.loading),
                        traling: const Icon(KHelper.expandSided, size: KHelper.iconSize),
                        onTap: () {
                          LogoutBloc.of(context).logout();
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

shareTheApp(BuildContext context) async {
  final RenderBox box = context.findRenderObject() as RenderBox;
  String url = KEndPoints.appStoreLinkDriver;
  await Share.share(url, sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
