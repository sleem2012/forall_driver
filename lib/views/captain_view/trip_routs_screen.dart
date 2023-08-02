import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../packages/chat/data/models/chat_model.dart';
import '../../../../packages/chat/view/widgets/chat_icon_btn.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/di.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_bloc.dart';
import 'package:forall_driver/logic/in_drive/get/get_in_drive_state.dart';
import 'package:forall_driver/logic/in_drive/update_trip/update_trip_cubit.dart';
import 'package:forall_driver/logic/in_drive/update_trip/update_trip_state.dart';
import 'package:forall_driver/logic/nav_enforcer/nav_enforcer_bloc.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/localization/trans.dart';
import 'package:forall_driver/shared/theme/helper.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:forall_driver/views/main_screen/main_screen.dart';
import 'package:forall_driver/views/map/logic/location_helper.dart';
import 'package:forall_driver/views/map/logic/map_cubit/map_bloc.dart';
import 'package:forall_driver/views/map/logic/map_cubit/map_state.dart';
import 'package:forall_driver/views/widgets/custom_button.dart';
import 'package:forall_driver/views/widgets/on_success_view.dart';
import 'package:forall_driver/views/widgets/slugs_drop_down.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../shared/theme/colors.dart';

class TripRoutsScreen extends StatefulWidget {
  const TripRoutsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TripModelData model;

  @override
  State<TripRoutsScreen> createState() => _TripRoutsScreenState();
}

class _TripRoutsScreenState extends State<TripRoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.mapBloc
        ..getCurrentPosition(
            LatLng(KStorage.i.getLocation?.latitude ?? 0,
                KStorage.i.getLocation?.longitude ?? 0),
            LatLng(
                double.tryParse(widget.model.tripRoads?.first.latitude ?? '') ??
                    0,
                double.tryParse(
                        widget.model.tripRoads?.first.longitude ?? '') ??
                    0))
        ..addMarkers(widget.model.tripRoads ?? [])
        ..loadMapStyles(context),
      child: Scaffold(
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            debugPrint(
                MapBloc.of(context).currentPosition?.longitude.toString());
            debugPrint(
                MapBloc.of(context).currentPosition?.latitude.toString());
            final map = MapBloc.of(context);
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                GoogleMap(
                  polylines: map.polylinePoints,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  onMapCreated: (GoogleMapController controller) async {
                    map.mapController.complete(controller);
                    // controller.setMapStyle(map.darkMapStyle);
                  },
                  initialCameraPosition: map.cameraPosition(),
                  markers: map.markers,
                ),
                BlocConsumer<GetInDriveBloc, GetInDriveState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      initial: (data) {
                        if (data.state == KSlugModel.canceled) {
                          debugPrint(data.state);
                          GetInDriveBloc.of(context).get();
                          KHelper.showSnackBar(Tr.get.sorry_trip_cancelled);
                          Nav.offAll(const MainNavigationView());
                        }
                        if (data.state == KSlugModel.completed) {
                          Nav.offAll(
                            OnSuccessView(
                                msg: Tr.get.trip_thanking,
                                destination: const MainNavigationView()),
                          );
                          GetInDriveBloc.of(context).get();
                        }
                      },
                    );
                  },
                  builder: (context, state) {
                    final bloc = GetInDriveBloc.of(context).selectedTripData ??
                        widget.model;
                    return Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: KHelper.of(context).elevatedBox,
                        height: Get.height * .2,
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  BlocConsumer<UpdateTripCubit,
                                      UpdateTripState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      final update =
                                          UpdateTripCubit.of(context);

                                      debugPrint(bloc.state);
                                      return bloc.state ==
                                              KSlugModel.waitingDriver
                                          // &&
                                          //     (LocationHelper.getDistance(
                                          //             lat2: double.parse(
                                          //               widget
                                          //                       .model
                                          //                       .tripRoads
                                          //                       ?.first
                                          //                       .latitude ??
                                          //                   '0.0',
                                          //             ),
                                          //             lon2: double.parse(widget
                                          //                     .model
                                          //                     .tripRoads
                                          //                     ?.first
                                          //                     .longitude ??
                                          //                 "0.0")) <
                                          //         .2)
                                          ? KButton(
                                              onPressed: () {
                                                update.updateTrip(
                                                  context: context,
                                                  State: KSlugModel.waitingUser,
                                                  id: widget.model.id,
                                                );
                                              },
                                              width: Get.width / 3,
                                              hieght: 50,
                                              child: Text(Tr.get.arrived),
                                            )
                                          : bloc.state == KSlugModel.onWay &&
                                                  LocationHelper.getDistance(
                                                        lat2: double.parse(
                                                          widget
                                                                  .model
                                                                  .tripRoads
                                                                  ?.last
                                                                  .latitude ??
                                                              '0.0',
                                                        ),
                                                        lon2: double.parse(
                                                          widget
                                                                  .model
                                                                  .tripRoads
                                                                  ?.last
                                                                  .longitude ??
                                                              "0.0",
                                                        ),
                                                      ) >
                                                      1
                                              ? KButton(
                                                  onPressed: () {
                                                    MapBloc.of(context)
                                                        .getDirections(
                                                      LatLng(
                                                          double.tryParse((widget
                                                                              .model
                                                                              .tripRoads ??
                                                                          [])
                                                                      .first
                                                                      .latitude ??
                                                                  '') ??
                                                              0,
                                                          double.tryParse((widget
                                                                              .model
                                                                              .tripRoads ??
                                                                          [])
                                                                      .first
                                                                      .longitude ??
                                                                  '') ??
                                                              0),
                                                      LatLng(
                                                          double.tryParse((widget
                                                                              .model
                                                                              .tripRoads ??
                                                                          [])
                                                                      .last
                                                                      .latitude ??
                                                                  '') ??
                                                              0,
                                                          double.tryParse((widget
                                                                              .model
                                                                              .tripRoads ??
                                                                          [])
                                                                      .last
                                                                      .longitude ??
                                                                  '') ??
                                                              0),
                                                    );
                                                  },
                                                  width: Get.width / 3,
                                                  hieght: 50,
                                                  child: Text(Tr.get.begin),
                                                )
                                              : (LocationHelper.getDistance(
                                                        lat2: double.parse(
                                                            widget
                                                                    .model
                                                                    .tripRoads
                                                                    ?.last
                                                                    .latitude ??
                                                                '0.0'),
                                                        lon2: double.parse(widget
                                                                .model
                                                                .tripRoads
                                                                ?.last
                                                                .longitude ??
                                                            "0.0"),
                                                      ) <
                                                      1
                                                  ? KButton(
                                                      onPressed: () {
                                                        update.updateTrip(
                                                            context: context,
                                                            State: KSlugModel
                                                                .completed,
                                                            id: widget
                                                                .model.id);
                                                      },
                                                      width: Get.width / 3,
                                                      hieght: 50,
                                                      isLoading:
                                                          state.maybeWhen(
                                                              orElse: () =>
                                                                  false,
                                                              loading: () =>
                                                                  true),
                                                      child:
                                                          Text(Tr.get.end_trip),
                                                    )
                                                  : Text(bloc.state ?? '',
                                                      style:
                                                          KTextStyle.of(context)
                                                              .names));
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(widget
                                                    .model
                                                    .userId
                                                    ?.image
                                                    ?.s128px ??
                                                ''),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 8),
                                              Text(
                                                  widget.model.userId?.name ??
                                                      '',
                                                  style: KTextStyle.of(context)
                                                      .title),
                                              const SizedBox(height: 8),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          KChatIconButton(
                                              roomType: ChatRoomType.bookTrip,
                                              order_chat_type: 'client',
                                              room_type_id: widget.model.id),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () async {
                                              await launchUrlString(
                                                  '${Tr.get.tel}:${widget.model.userId?.mobile}');
                                            },
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  KColors.of(context)
                                                      .activeIcons,
                                              child: const Icon(Icons.phone,
                                                  color: Colors.white,
                                                  size: 20),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          GestureDetector(
                                            onTap: () async {
                                              String url = bloc.state ==
                                                      KSlugModel.waitingDriver
                                                  ? "google.navigation:q=${widget.model.tripRoads?.first.latitude},${widget.model.tripRoads?.first.longitude}"
                                                  : "google.navigation:q=${widget.model.tripRoads?.last.latitude},${widget.model.tripRoads?.last.longitude}";
                                              await launchUrlString(url);
                                            },
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  KColors.of(context)
                                                      .activeIcons,
                                              child: const Icon(
                                                  Icons.location_on_rounded,
                                                  color: Colors.white,
                                                  size: 20),
                                            ),
                                          ),
                                          if (kDebugMode)
                                            IconButton(
                                                onPressed: () {
                                                  UpdateTripCubit.of(context)
                                                      .updateTrip(
                                                      context: context,
                                                      State: KSlugModel
                                                          .completed,
                                                      id: widget.model.id);
                                                }, icon: const Icon(Icons.cancel),)
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
