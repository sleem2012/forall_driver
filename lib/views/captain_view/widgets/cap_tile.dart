import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/in_drive/create_trip_model.dart';
import 'package:forall_driver/views/captain_view/widgets/option_tile.dart';
import 'package:forall_driver/views/captain_view/widgets/cap_request_tile.dart';

class CapTile extends StatefulWidget {
  const CapTile({Key? key, required this.data}) : super(key: key);
  final TripModelData data;
  @override
  State<CapTile> createState() => _CapTileState();
}

class _CapTileState extends State<CapTile> {
  final widgetKey = GlobalKey();

  @override
  void initState() {
    tfHeight();
    super.initState();
  }

  bool isRequest = true;

  double tfHeight() {
    double h = 88.0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final obj = widgetKey.currentContext?.findRenderObject();
      RenderBox? box;
      if (obj != null) {
        box = obj as RenderBox;
        h = box.size.height;
      }
    });
    return h;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: CapRequestTile(
          onDismiss: () {
            setState(() {
              // isRequest = false;
              debugPrint(isRequest.toString());
            });
          },
          data: widget.data),
      secondChild: OptionTile(onDismiss: () {
        setState(() {
          // isRequest = true;
          debugPrint(isRequest.toString());
        });
      }),
      crossFadeState: changeCrossFade(),
      duration: const Duration(milliseconds: 500),
    );
  }

  CrossFadeState changeCrossFade() {
    return isRequest ? CrossFadeState.showFirst : CrossFadeState.showSecond;
  }
}
