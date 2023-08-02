import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forall_driver/shared/cache/locale_storage.dart';
import 'package:forall_driver/shared/theme/colors.dart';
import 'package:forall_driver/views/widgets/appbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'range_cubit/range_cubit.dart';
import 'range_cubit/range_state.dart';
import 'widgets/control_range.dart';

class RangeView extends StatelessWidget {
  const RangeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  KAppBar(color: KColors.of(context).background,needsPop: true,),
      body: BlocProvider(
        create: (context) => RangeCubit()..getCurrentPosition()..setRange(KStorage.i.getRange),
        child: BlocBuilder<RangeCubit, RangeState>(
          builder: (context, state) {
            final map = RangeCubit.of(context);
            return map.currentPosition == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: GoogleMap(
                          zoomGesturesEnabled: false,
                          zoomControlsEnabled: false,
                          onMapCreated: map.onMapCreated,
                          myLocationEnabled: true,
                          initialCameraPosition: map.cameraPosition(),
                          // markers: {
                          //  map.setMarker()
                          // },
                          circles: map.setCircle(context),
                        ),
                      ),
                      const ControlRangeWidget()
                    ],
                  );
          },
        ),
      ),
    );
  }
}
