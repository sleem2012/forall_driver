import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/logic/theme/theme_cubit.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/views/Auth/login/login_screen.dart';
import 'package:forall_driver/views/onboarding_screen/widgets/slide_items.dart';
import 'package:forall_driver/views/widgets/action_dialog.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  final key = GlobalKey<SlideItemsState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        switch (_currentPage) {
          case 0:
            ActionDialog(
              content: [
                Text(
                  Tr.get.exit_question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
              approveAction: Tr.get.yes_message,
              cancelAction: Tr.get.no_message,
              onApproveClick: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
              onCancelClick: () {
                Navigator.pop(context);
              },
            ).show<void>(context);
            return false;

          case 1:
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
            break;
          case 2:
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
            );
        }
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/splash_${ThemeBloc.of(context).strTheme}.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: PageView.builder(
                  onPageChanged: (index) {
                    _currentPage = index;
                    setState(() {});
                  },
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: 1,
                  itemBuilder: (context, i) =>
                      SlideItems(i, key: i == 1 ? key : null),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: CustomBtn(
                    onChange: () {
                      if (_currentPage == 0) {
                        Nav.offAll(const LoginScreen());
                      } else {
                        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOutCubic);
                      }
                    },
                    text: Tr.get.go,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
