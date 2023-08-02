import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/captain_view/trip_routs_screen.dart';
import 'package:forall_driver/views/captain_view/widgets/request_bottom.dart';
import 'package:forall_driver/views/map/logic/map_cubit/map_bloc.dart';
import 'package:forall_driver/views/map/logic/map_cubit/map_state.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../logic/in_drive/get/get_in_drive_bloc.dart';
import '../../logic/in_drive/get/get_in_drive_state.dart';
import '../map/map_view/map_screen.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key, required this.data}) : super(key: key);
  final TripModelData data;

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.mapBloc
        ..getCurrentPosition(
          LatLng(double.tryParse((widget.data.tripRoads ?? []).first.latitude ?? '') ?? 0,
              double.tryParse((widget.data.tripRoads ?? []).first.longitude ?? '') ?? 0),
          LatLng(double.tryParse((widget.data.tripRoads ?? []).last.latitude ?? '') ?? 0,
              double.tryParse((widget.data.tripRoads ?? []).last.longitude ?? '') ?? 0),
        )
        ..loadMapStyles(context)
        ..addMarkers(widget.data.tripRoads ?? []),
      child: BlocListener<GetInDriveBloc, GetInDriveState>(
        listener: (context, inDriveState) {
          inDriveState.mapOrNull(initial: (state) {
            if (state.data.state == KSlugModel.waitingDriver) {
              GetInDriveBloc.of(context).setSelectedOrderData(state.data);
              Nav.replace(TripRoutsScreen(
                model: state.data,
              ));
            } else if (state.data.state == KSlugModel.canceled || state.data.state == "removed") {
              debugPrint(state.data.state);
              Nav.back();
            }
          });
        },
        child: BlocBuilder<GetInDriveBloc, GetInDriveState>(
          builder: (context, inDriveState) {
            return BlocBuilder<MapBloc, MapState>(
              buildWhen: (previous, current) {
                return current.maybeWhen(orElse: () => true, onCameraMove: (_) => false);
              },
              builder: (context, state) {
                final map = MapBloc.of(context);
                return Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: InkWell(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: MapScreen(
                            onCameraMove: (camera) {
                              map.controlWhenMove(target: camera.target);
                            },
                            onCameraIdle: () {
                              map.controlWhenStop();
                            },
                          ),
                        ),
                        BlocBuilder<MapBloc, MapState>(
                          buildWhen: (previous, current) {
                            return current is MapStateOnCameraMove;
                          },
                          builder: (context, state) {
                            return RequestBottom(
                              onTapAccept: () {
                                MapBloc.of(context).getCurrentPosition(
                                  LatLng(double.tryParse((widget.data.tripRoads ?? []).first.latitude ?? '') ?? 0,
                                      double.tryParse((widget.data.tripRoads ?? []).first.latitude ?? '') ?? 0),
                                  LatLng(double.tryParse((widget.data.tripRoads ?? []).last.latitude ?? '') ?? 0,
                                      double.tryParse((widget.data.tripRoads ?? []).last.latitude ?? '') ?? 0),
                                );
                              },
                              data: widget.data,
                              onTapDirections: map.onMapTaped,
                              height: map.height!,
                              onTapLocation: map.goToMyCurrentLocation,
                              opacity: map.opacity!,
                            );
                          },
                        ),
                        if (inDriveState is GetInDriveStateOnUpdateSocket)
                          Container(
                            height: Get.height,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Text(Tr.get.waiting_for_client_response,
                                        style: KTextStyle.of(context).title),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: CircularProgressIndicator(
                                    color: KColors.of(context).accentColor,
                                  )),
                                ],
                              ),
                            ),
                          ),

                        // const SearchBar(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
