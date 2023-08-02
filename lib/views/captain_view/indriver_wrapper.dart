import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_bloc.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_state.dart';
import 'package:forall_driver/views/captain_view/trip_routs_screen.dart';
import 'package:forall_driver/views/widgets/error/error_widget.dart';
import 'package:forall_driver/views/widgets/loading/loading_overlay.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';

import 'cap_requests_list.dart';

class InDriverWrapper extends StatelessWidget {
  const InDriverWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetInDriveBloc, GetInDriveState>(
        builder: (context, state) {
          final trips = GetInDriveBloc.of(context).getInDriveModel;

          return state.maybeWhen(
            orElse: () {
              if (trips?.data?.isEmpty ?? false) {
                return const InDriverRequestsList();
              } else {
                if (trips?.data?.first.state == KSlugModel.waitingUser ||
                    trips?.data?.first.state == KSlugModel.waitingDriver ||
                    trips?.data?.first.state == KSlugModel.onWay ||
                    trips?.data?.first.state == KSlugModel.arrivedClient ||
                    trips?.data?.first.state == KSlugModel.paymentNeeded) {
                  return  TripRoutsScreen(
                      model: trips?.data?.first ?? TripModelData());
                } else {
                  return const InDriverRequestsList();
                }
              }
            },
            loading: () => const KLoadingOverlay(isLoading: true),
            error: (error) => KErrorWidget(
              error: state.whenOrNull(error: (error) => error),
              isError: true,
              onTryAgain: GetInDriveBloc.of(context).get,
            ),
          );
        },
      ),
    );
  }
}
