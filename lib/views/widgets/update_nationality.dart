import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forall_driver/data/models/global/location/countries/countries_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_bloc.dart';
import 'package:forall_driver/logic/auth/update_user/update_user_state.dart';
import 'package:forall_driver/logic/global/location/location_bloc.dart';
import 'package:forall_driver/logic/global/location/location_state.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/main_screen/main_screen.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/drop_down.dart';
import 'package:forall_driver/views/widgets/image_widget.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:get/get.dart';

class UpdateNationality extends StatelessWidget {
  const UpdateNationality({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => Di.updateUserBloc,
        child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) {
                NavEnforcerBloc.of(context).checkUser(
                  msg: 'Nationality Added Successfully',
                  destination: const MainNavigationView(),
                );
              },
            );
          },
          builder: (context, state) {
            final update = UpdateUserBloc.of(context);
            return KLoadingOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    SvgPicture.asset('assets/images/Logo Only.svg'),
                    Text(
                      "Sorry",
                      style: KTextStyle.of(context).names,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You have to Add your Nationality First",
                      style: KTextStyle.of(context).title,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SvgPicture.asset('assets/images/oops.svg'),
                    const SizedBox(
                      height: 50,
                    ),
                    BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                        final countryList = LocationBloc.of(context).countriesModel?.data ?? [];

                        return KDropdownBtn<CountriesDatum>(
                          title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
                              ? Tr.get.loading
                              : Tr.get.select_nationality,
                          items: countryList
                              .map(
                                (e) => KHelper.of(context).itemView<CountriesDatum>(
                                  itemText: e.nationality?.value ?? '',
                                  value: e,
                                  icon: KImageWidget(imageUrl: e.flag ?? '', width: 20),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              update.selectedNationality = value;
                            }
                          },
                          validator: (values) {
                            if (values == null) {
                              return Tr.get.field_required;
                            } else {
                              return null;
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomBtn(
                      text: Tr.get.submit,
                      onChange: () {
                        UpdateUserBloc.of(context).update_nationality();
                      },
                      width: Get.width * .9,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
