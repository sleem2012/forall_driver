import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/logic/global/settings/settings_bloc.dart';
import 'package:forall_driver/logic/global/settings/settings_state.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/views/onboarding_screen/widgets/slide.dart';
import 'package:forall_driver/views/widgets/error/error_widget.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

class SlideItems extends StatefulWidget {
  final int index;

  const SlideItems(this.index, {Key? key}) : super(key: key);

  @override
  State<SlideItems> createState() => SlideItemsState();
}

class SlideItemsState extends State<SlideItems> {
  String? currentVal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          initial: () => const KLoadingOverlay(isLoading: true),
          loading: () => const KLoadingOverlay(isLoading: true),
          error: (e) => KErrorWidget(error: e, onTryAgain: () {}),
          success: (e) {

            final slideList = [
              Slide(
                image: "${e.data?.first.introScreen?.screen?.image}",
                desc: "${e.data?.first.introScreen?.screen?.paragraph?.value}",
                title: "${e.data?.first.introScreen?.screen?.title?.value}",
              ),
              // Slide(
              //   image: "${e.data?.first.introScreen?.screen0?.image}",
              //   desc: "${e.data?.first.introScreen?.screen0?.paragraph?.value}",
              //   title: "${e.data?.first.introScreen?.screen0?.title?.value}",
              // ),
            ];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                    ),
                    child: Image.network(
                      "${slideList[widget.index].image}",
                      width: Get.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "${slideList[widget.index].title}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: KColors.of(context).accentColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "${slideList[widget.index].desc}",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
