import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_bloc.dart';
import 'package:forall_driver/logic/auth/user_info/user_info_state.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/logic/update_location/update_location_bloc.dart';
import 'package:forall_driver/logic/update_location/update_location_state.dart';
import 'package:forall_driver/views/notifications/notifications_list.dart';
import 'package:forall_driver/views/statistics/statics_screen.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/new_bg_img.dart';

import '../../logic/main_view/main_view_bloc.dart';
import '../../packages/chat/view/conversation_list.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/helper.dart';
import '../profile/profile_screen.dart';
import '../widgets/appbar.dart';
import 'request_distnation.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  @override
  void initState() {
    // if (!kDebugMode) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     ScaffoldMessenger.of(context).showMaterialBanner(
    //       const MaterialBanner(
    //         content: AdBanner(),
    //         leadingPadding: EdgeInsets.zero,
    //         padding: EdgeInsets.zero,
    //         backgroundColor: Colors.transparent,
    //         leading: SizedBox(),
    //         actions: [SizedBox()],
    //       ),
    //     );
    //   });
    // }
    NavEnforcerBloc.of(context).checkUser(destination: const MainNavPages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: KLoadingOverlay(isLoading: true),
    );
  }
}

class MainNavPages extends StatelessWidget {
  const MainNavPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? type = UserInfoBloc.of(context).user?.data?.rider?.commercial?.driver?.serviceType;

    return BlocConsumer<UpdateLocationBloc, UpdateLocationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocBuilder<MainViewBloc, MainViewState>(
          builder: (context, state) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: const KAppBar(),
              body: BgImg(
                child: Padding(
                  padding: const EdgeInsets.only(top: 95),
                  child: PageView(
                    controller: MainViewBloc.of(context).pageCtrl,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const StaticsScreen(),
                      const ProfileScreen(),
                      const ConversationView(),
                      const NotificationsList(),
                      RequestDistination(type: type ?? ''),
                    ],
                  ),
                ),
              ),
              floatingActionButton: BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  return UserInfoBloc.of(context).isOnline == true
                      ? SizedBox(
                          width: 45,
                          child: FloatingActionButton(
                            onPressed: () {
                              type == "taxi" ? Nav.to(RequestDistination(type: type ?? '')) : MainViewBloc.of(context).navTaped(4);
                            },
                            backgroundColor: KColors.of(context).fabBackground,
                            child: const Icon(KHelper.list, color: Colors.white),
                          ),
                        )
                      : const SizedBox();
                },
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                height: 50,
                icons: MainViewBloc.of(context).navItems,
                activeIndex: state.index,
                shadow: Shadow(color: KColors.of(context).shadow, blurRadius: 10),
                backgroundColor: KColors.of(context).elevated,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.defaultEdge,
                onTap: MainViewBloc.of(context).navTaped,
                activeColor: KColors.of(context).activeIcons,
                inactiveColor: KColors.of(context).selected,
              ),
            );
          },
        );
      },
    );
  }
}
