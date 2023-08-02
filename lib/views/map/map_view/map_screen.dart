import 'package:flutter/material.dart';
import 'package:forall_driver/views/map/logic/map_cubit/map_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.onCameraMove, required this.onCameraIdle}) : super(key: key);
  final void Function(CameraPosition cameraPosition) onCameraMove;
  final void Function() onCameraIdle;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    MapBloc.of(context).getIcons();

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {}

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final map = MapBloc.of(context);
    return map.currentPosition == null
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : GoogleMap(
            polylines: map.polylinePoints,
            // onTap: (argument) => map.onMapTaped(argument),
            onCameraIdle: widget.onCameraIdle,
            onCameraMove: widget.onCameraMove,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) async {
              map.mapController.complete(controller);
            },
            initialCameraPosition: map.cameraPosition(),
            markers: map.markers,
          );
  }
}
